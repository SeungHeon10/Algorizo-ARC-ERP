package co.algorizo.erp.inbound;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.algorizo.erp.company.CompanyDTO;
import co.algorizo.erp.company.CompanyService;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.product.ProductService;
import co.algorizo.erp.register.dto.MemberDTO;
import co.algorizo.erp.register.service.MemberService;

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

	@GetMapping(value = "/inbound/inboundlist")
	public String list(Model model, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/";
		}
		List<inboundDTO> list = service.list();

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
		if (session.getAttribute("m_id") == null || session.getAttribute("m_id") == "") {
			return "redirect:/"; //
		}

		List<ProductDTO> productList = productservice.productlist();
		List<CompanyDTO> companyList = companyservice.companylist();
		List<MemberDTO> memberList = memberservice.memberList();
		model.addAttribute("product", productList);
		model.addAttribute("company", companyList);
		model.addAttribute("member", memberList);
		return "inbound/inboundregister";
	}

	@PostMapping(value = "inbound/inboundregister")
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
}
