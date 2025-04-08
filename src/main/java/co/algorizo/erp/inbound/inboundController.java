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

	@GetMapping(value = "inbound/i_list")
	public String list(Model model, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; // 
		}
		List<inboundDTO> list = service.list();
		System.out.println(list);
		model.addAttribute("list", list);
		return "i_list";
	}

	@GetMapping(value = "inbound/i_detail")
	public String detail(@RequestParam("in_id") int in_id, Model model) throws Exception {
		try {
			List<inboundDTO> dto = service.detail(in_id);
			model.addAttribute("dto", dto);
			return "i_detail";
		} catch (NumberFormatException e) {
			return "redirect:/errorPage"; // 
		}

	}

	@GetMapping(value = "inbound/i_register")
	public String registerform(HttpSession session, Model model) throws Exception {
		if (session.getAttribute("m_id") == null || session.getAttribute("m_id") == "") {
			return "redirect:/"; // 
		}
		
		List<ProductDTO> productList = productservice.productlist();
		List<CompanyDTO> companyList = companyservice.companylist();
		List<MemberDTO> memberList = memberservice.memberList();
		System.out.println(productList);
		System.out.println(companyList);
		System.out.println(memberList);

		model.addAttribute("product", productList);
		model.addAttribute("company", companyList);
		model.addAttribute("member", memberList);
		return "i_register";

	}

	@PostMapping(value = "inbound/i_register")
	public String register(@ModelAttribute inboundDTO inbounddto, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; // 
		}
		System.out.println(inbounddto);

		service.register(inbounddto);
		return "redirect:/inbound/i_list";

	}

	@GetMapping(value = "inbound/i_update")
	public String updateform(@RequestParam int in_id, Model model) throws Exception {
		List<inboundDTO> update = service.detail(in_id);

		model.addAttribute("up", update);
		return "i_update";
	}

	@PostMapping(value = "inbound/i_update")
	public String update(@ModelAttribute inboundDTO inbounddto) throws Exception {
		service.update(inbounddto);
		return "redirect:i_detail?in_id=" + inbounddto.getIn_id();
	}

	@PostMapping(value = "inbound/i_delete")
	public String delete(@RequestParam int in_id, Model model) throws Exception {
		int result = service.delete(in_id);

		if (result > 0) {
			return "redirect:/inbound/i_list";
		}
		return "redirect:/inbound/i_list";
	}

}
