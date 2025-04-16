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
import co.algorizo.erp.inspection.InspectionService;
import co.algorizo.erp.inspection.DTO.InspectionDTO;
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
		model.addAttribute("in_status", "�԰� ���");
		return "inbound/inboundregister";
	}

	@PostMapping(value = "/inbound/inboundregister")
	public String register(@ModelAttribute inboundDTO inbounddto, HttpSession session, RedirectAttributes redirect)
			throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; //
		}
		service.register(inbounddto);
		return "redirect:/inbound/inboundlist"; // ���� �� ��� �������� �̵�
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
		logger.debug("Request payload: {}", payload); // ��û Ȯ��
		System.out.println("Request payload: " + payload); // �ֿܼ� ���

		try {
			// in_id ���� ����� ���޵Ǿ����� Ȯ��
			if (!payload.containsKey("in_id") || payload.get("in_id") == null
					|| String.valueOf(payload.get("in_id")).trim().isEmpty()) {
				System.out.println("�԰� ID�� ��ȿ���� �ʽ��ϴ�."); // ��ȿ���� ���� in_id ���
				return ResponseEntity.badRequest().body("�԰� ID�� ��ȿ���� �ʽ��ϴ�.");
			}

			String in_id = String.valueOf(payload.get("in_id"));
			String i_id = String.valueOf(payload.get("i_id"));
			String s_id = String.valueOf(payload.get("s_id"));
			logger.debug("Parsed in_id: {}", in_id); // in_id Ȯ��
			logger.debug("Parsed i_id: {}", i_id); // in_id Ȯ��
			System.out.println("Parsed in_id: " + in_id); // �ֿܼ� ���
			System.out.println("Parsed i_id: " + i_id); // �ֿܼ� ���
			System.out.println("Parsed s_id: " + s_id); // �ֿܼ� ���

			// in_id�� ������ ��쿡�� ó��
			try {
				Integer.parseInt(in_id); // ���ڿ��� ������ ��ȯ�� �� �ִ��� üũ
				System.out.println("in_id�� ������ ��ȯ��: " + in_id); // ������ ��ȯ�� in_id ���
			} catch (NumberFormatException e) {
				System.out.println("��ȿ���� ���� �԰� ID�Դϴ�."); // ��ȿ���� ���� ID ���
				return ResponseEntity.badRequest().body("��ȿ���� ���� �԰� ID�Դϴ�.");
			}
			Integer inspectionId = Integer.valueOf(i_id);
			Integer stockid = Integer.valueOf(s_id);
			 if (inspectionId == 0) { // i_id�� 0�� ��� �ٷ� Ȯ�� ó��
		            System.out.println("i_id�� 0�̹Ƿ� �ٷ� Ȯ�� ó��");
		            service.updateInboundStatus(in_id, "�԰� �Ϸ�");
		            System.out.println("�԰� ���� ������Ʈ: �԰� �Ϸ�, in_id = " + in_id);
		            return ResponseEntity.ok().build();
		    }
			stockDTO stock = stockservice.detail(stockid);
			System.out.println("stockdetail" + stock); 
			InspectionDTO inspection = inspectionservice.detail(inspectionId);
			System.out.println("inspectiondetail" + inspection );
			
			stock.setS_quantity(stock.getS_quantity() + inspection.getI_quantity());
			// �԰� ���� ������Ʈ ȣ��
			service.updateInboundStatus(in_id, "�԰� �Ϸ�");
			//��� ������Ʈ�ϴ� ������ �־���� service�� dao�ϳ� �� ���� �԰� �Ϸᰡ �Ǹ� ����� �߰��ǰ� �����
			service.stockupdate(stock.getS_quantity(),stockid);
			System.out.println("�԰� ���� ������Ʈ: �԰� �Ϸ�, in_id = " + in_id); // ���� ������Ʈ ���
			System.out.println("��� ���� ������Ʈ: ��� �߰� �Ϸ�, i_id = " + i_id); // ���� ������Ʈ ���
			System.out.println("��� ���� ������Ʈ: ��� �߰� �Ϸ�, s_id = " + s_id); // ���� ������Ʈ ���
			//
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			logger.error("�԰� ���� ������Ʈ �� ���� �߻�: {}", e.getMessage());
			System.out.println("�԰� ���� ������Ʈ �� ���� �߻�: " + e.getMessage()); // ���� �޽��� ���
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("���� ������Ʈ ����");
		}
	}

}
