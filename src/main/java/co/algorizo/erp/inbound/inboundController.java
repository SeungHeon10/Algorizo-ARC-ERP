package co.algorizo.erp.inbound;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.algorizo.erp.company.CompanyDTO;
import co.algorizo.erp.company.CompanyService;
import co.algorizo.erp.inspection.InspectionDTO;
import co.algorizo.erp.inspection.InspectionService;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.product.ProductService;
import co.algorizo.erp.register.dto.MemberDTO;
import co.algorizo.erp.register.service.MemberService;
import co.algorizo.erp.stock.stockDTO;
import co.algorizo.erp.stock.stockService;

@Controller
public class inboundController {

	private static final Logger logger = LoggerFactory.getLogger(inboundController.class);

	@Autowired
	private inboundService service;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private CompanyService companyservice;
	@Autowired
	private stockService stockservice;
	@Autowired
	private InspectionService inspectionservice;

	@GetMapping(value = "/inbound/inboundlist")
	public String list(Model model, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/";
		}
		List<inboundDTO> list = service.list();
		System.out.println(list);
		model.addAttribute("list", list);
		return "inbound/inboundlist";
	}

	@GetMapping(value = "/inbound/inbounddetail")
	public String detail(@RequestParam("in_id") int in_id, Model model) throws Exception {
		try {
			List<inboundDTO> dto = service.detail(in_id);
			model.addAttribute("dto", dto);
			return "inbound/inbounddetail";
		} catch (NumberFormatException e) {
			return "redirect:/errorPage"; //
		}
	}

	@GetMapping(value = "/inbound/inboundregister")
	public String registerform(HttpSession session, Model model) throws Exception {
		if (session.getAttribute("m_id") == null || session.getAttribute("m_id").equals("")) {
			return "redirect:/"; //
		}
		List<ProductDTO> productList = productservice.productlist();
		List<CompanyDTO> companyList = companyservice.companylist();
		List<MemberDTO> memberList = memberservice.memberList();
		model.addAttribute("product", productList);
		model.addAttribute("company", companyList);
		model.addAttribute("member", memberList);
		model.addAttribute("in_status", "입고 대기");
		return "inbound/inboundregister";
	}

	@PostMapping(value = "/inbound/inboundregister")
	public String register(@ModelAttribute inboundDTO inbounddto, HttpSession session, RedirectAttributes redirect)
			throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; //
		}
		service.register(inbounddto);
		return "redirect:/inbound/inboundlist"; // 성공 시 목록 페이지로 이동
	}

	@GetMapping(value = "/inbound/inboundupdate")
	public String updateform(@RequestParam int in_id, Model model) throws Exception {
		List<inboundDTO> update = service.detail(in_id);
		model.addAttribute("up", update);
		return "inbound/inboundupdate";
	}

	@PostMapping(value = "/inbound/inboundupdate")
	public String update(@ModelAttribute inboundDTO inbounddto) throws Exception {
		service.update(inbounddto);
		return "redirect:/inbound/inbounddetail?in_id=" + inbounddto.getIn_id();
	}

	@PostMapping(value = "/inbound/inbounddelete")
	public String delete(@RequestParam int in_id, Model model) throws Exception {
		int result = service.delete(in_id);

		if (result > 0) {
			return "redirect:/inbound/inboundlist";
		}
		return "redirect:/inbound/inboundlist";
	}

	@PostMapping(value = "/inbound/confirm")
	@ResponseBody
	public ResponseEntity<?> confirmInbound(@RequestBody Map<String, Object> payload) {
		logger.debug("Request payload: {}", payload); // 요청 확인
		System.out.println("Request payload: " + payload); // 콘솔에 출력

		try {
			// in_id 값이 제대로 전달되었는지 확인
			if (!payload.containsKey("in_id") || payload.get("in_id") == null
					|| String.valueOf(payload.get("in_id")).trim().isEmpty()) {
				System.out.println("입고 ID가 유효하지 않습니다."); // 유효하지 않은 in_id 출력
				return ResponseEntity.badRequest().body("입고 ID가 유효하지 않습니다.");
			}

			String in_id = String.valueOf(payload.get("in_id"));
			String i_id = String.valueOf(payload.get("i_id"));
			String s_id = String.valueOf(payload.get("s_id"));
			logger.debug("Parsed in_id: {}", in_id); // in_id 확인
			logger.debug("Parsed i_id: {}", i_id); // in_id 확인
			System.out.println("Parsed in_id: " + in_id); // 콘솔에 출력
			System.out.println("Parsed i_id: " + i_id); // 콘솔에 출력
			System.out.println("Parsed s_id: " + s_id); // 콘솔에 출력

			// in_id가 숫자일 경우에만 처리
			try {
				Integer.parseInt(in_id); // 문자열을 정수로 변환할 수 있는지 체크
				System.out.println("in_id가 정수로 변환됨: " + in_id); // 정수로 변환된 in_id 출력
			} catch (NumberFormatException e) {
				System.out.println("유효하지 않은 입고 ID입니다."); // 유효하지 않은 ID 출력
				return ResponseEntity.badRequest().body("유효하지 않은 입고 ID입니다.");
			}
			Integer inspectionId = Integer.valueOf(i_id);
			Integer stockid = Integer.valueOf(s_id);
			 if (inspectionId == 0) { // i_id가 0일 경우 바로 확정 처리
		            System.out.println("i_id가 0이므로 바로 확정 처리");
		            service.updateInboundStatus(in_id, "입고 완료");
		            System.out.println("입고 상태 업데이트: 입고 완료, in_id = " + in_id);
		            return ResponseEntity.ok().build();
		    }
			stockDTO stock = stockservice.detail(stockid);
			System.out.println("stockdetail" + stock); 
			InspectionDTO inspection = inspectionservice.detail(inspectionId);
			System.out.println("inspectiondetail" + inspection );
			
			stock.setS_quantity(stock.getS_quantity() + inspection.getI_quantity());
			// 입고 상태 업데이트 호출
			service.updateInboundStatus(in_id, "입고 완료");
			//재고 업데이트하는 로직이 있어야함 service랑 dao하나 더 만들어서 입고 완료가 되면 재고량에 추가되게 만들기
			service.stockupdate(stock.getS_quantity(),stockid);
			System.out.println("입고 상태 업데이트: 입고 완료, in_id = " + in_id); // 상태 업데이트 출력
			System.out.println("재고 수량 업데이트: 재고 추가 완료, i_id = " + i_id); // 상태 업데이트 출력
			System.out.println("재고 수량 업데이트: 재고 추가 완료, s_id = " + s_id); // 상태 업데이트 출력
			//
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			logger.error("입고 상태 업데이트 중 오류 발생: {}", e.getMessage());
			System.out.println("입고 상태 업데이트 중 오류 발생: " + e.getMessage()); // 오류 메시지 출력
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("상태 업데이트 실패");
		}
	}

}
