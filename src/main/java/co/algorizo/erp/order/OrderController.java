package co.algorizo.erp.order;

import java.io.IOException;
import java.io.OutputStream;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import co.algorizo.erp.company.CompanyDTO;
import co.algorizo.erp.company.CompanyService;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.product.ProductService;
import co.algorizo.erp.register.dto.MemberDTO;
import co.algorizo.erp.register.service.MemberService;
import co.algorizo.erp.stock.stockDTO;
import co.algorizo.erp.stock.stockService;

@Controller
public class OrderController {

	@Inject
	OrderService orderService;
	@Inject
	MemberService memberService;
	@Inject
	ProductService productService;
	@Inject
	CompanyService companyService;

    @GetMapping("order/downloadPdf")
    public void downloadPdf(@RequestParam("o_code") String oCode,
                            @RequestParam("product_name") String productName,
                            @RequestParam("o_qty") int quantity,
                            @RequestParam("p_price") int price,
                            HttpServletResponse response) throws IOException {
        try {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=invoice.pdf");

            Document document = new Document(PageSize.A4);
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            BaseFont baseFont = BaseFont.createFont("HYSMyeongJo-Medium", "UniKS-UCS2-H", BaseFont.NOT_EMBEDDED);
            Font titleFont = new Font(baseFont, 18, Font.BOLD);
            Font textFont = new Font(baseFont, 12, Font.NORMAL);
            Font boldFont = new Font(baseFont, 12, Font.BOLD);

            // Title
            Paragraph title = new Paragraph("거래명세서", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph("\n"));

            // 공급자 정보
            PdfPTable supplierTable = new PdfPTable(2);
            supplierTable.setWidthPercentage(100);
            supplierTable.addCell(new Paragraph("공급자: ARC ERP", textFont));
            supplierTable.addCell(new Paragraph("사업자등록번호: 220-81-65848", textFont));
            supplierTable.addCell(new Paragraph("주소: 수원시 영통구 ", textFont));
            supplierTable.addCell(new Paragraph("연락처: 031-213-6912", textFont));
            document.add(supplierTable);
            document.add(new Paragraph("\n"));

            // 거래 내역 테이블
            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.addCell(new Paragraph("품목명", boldFont));
            table.addCell(new Paragraph("수량", boldFont));
            table.addCell(new Paragraph("단가", boldFont));
            table.addCell(new Paragraph("공급가액", boldFont));
            table.addCell(new Paragraph("부가세", boldFont));

            int supplyAmount = quantity * price;
            int vat = (int) (supplyAmount * 0.1);
            int totalAmount = supplyAmount + vat;
            NumberFormat nf = NumberFormat.getNumberInstance(Locale.KOREA);

            table.addCell(new Paragraph(productName, textFont));
            table.addCell(new Paragraph(String.valueOf(quantity), textFont));
            table.addCell(new Paragraph(nf.format(price), textFont));
            table.addCell(new Paragraph(nf.format(supplyAmount), textFont));
            table.addCell(new Paragraph(nf.format(vat), textFont));
            document.add(table);

            // 총 금액
            document.add(new Paragraph("\n"));
            Paragraph total = new Paragraph("총 금액: " + nf.format(totalAmount) + " 원", boldFont);
            total.setAlignment(Element.ALIGN_RIGHT);
            document.add(total);

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	@GetMapping(value = "order/list")
	public String list(Model model, HttpSession session) {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; // ✅ 세션 없으면 로그인 페이지로 리다이렉트
		}

		List<OrderDTO> list = orderService.getAllOrders();
		System.out.println("Order List: " + list);
		model.addAttribute("list", list);

		return "orderList";
	}

	@GetMapping(value = "order/register")
	public String register(Model model, HttpSession session) {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; // ✅ 세션 없으면 로그인 페이지로 리다이렉트
		}

		// 현재 로그인한 사용자 정보 가져오기
		String m_id = (String) session.getAttribute("m_id");
		MemberDTO member = memberService.selectMember(m_id); // memberService에 이 메소드 필요

		List<OrderDTO> list = orderService.getAllOrders();
		List<ProductDTO> productList = productService.productlist();
		List<CompanyDTO> companyList = companyService.companylist();
		
		model.addAttribute("list", list);
		model.addAttribute("productList", productList);
		model.addAttribute("companyList", companyList);
		
		
		String nextOrderCode = orderService.generateNextOrderCode();
		model.addAttribute("nextOrderCode", nextOrderCode);
		model.addAttribute("member", member);
		return "orderRegister";
	}

	@PostMapping(value = "order/register")
	public String register(@RequestParam Map<String, Object> map, HttpSession session) {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; // ✅ 세션 없으면 로그인 페이지로 리다이렉트
		}

		 // 파라미터 확인 로그 추가
	    System.out.println("폼에서 전달된 모든 파라미터: " + map);
	    
	    // product.p_name이 어떻게 전달되는지 확인
	    String productName = (String) map.get("product.p_name");
	    System.out.println("제품 이름: " + productName);
	    
	    // company.cp_name이 어떻게 전달되는지 확인
	    String companyName = (String) map.get("company.cp_name");
	    System.out.println("회사 이름: " + companyName);
	    
	    map.put("product_name", productName);
	    map.put("company_name", companyName);
	    
	    map.put("member_m_id", session.getAttribute("m_id"));

		orderService.register(map);

		return "redirect:/order/list";
	}

	@GetMapping(value = "order/detail")
	public String detail(@RequestParam("o_code") String o_code, Model model) {

		OrderDTO order = orderService.getOrderDetail(o_code);

		model.addAttribute("order", order);

		return "orderDetail";
	}

	@GetMapping(value = "order/update")
	public String update(@RequestParam("o_code") String o_code, Model model) {
		OrderDTO order = orderService.getOrderDetail(o_code);

		model.addAttribute("order", order);

		return "orderUpdate";
	}

	@PostMapping(value = "order/update")
	public String update(@RequestParam Map<String, Object> map) {

		orderService.updateOrder(map);

		return "redirect:/order/detail?o_code=" + map.get("o_code");
	}

	@GetMapping(value = "order/delete")
	public String delete(@RequestParam("o_code") String o_code) {

		orderService.deleteOrder(o_code);

		return "redirect:/order/list";
	}

}
