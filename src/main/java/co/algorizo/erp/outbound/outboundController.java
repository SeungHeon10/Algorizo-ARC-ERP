package co.algorizo.erp.outbound;

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
public class outboundController {

	private static final Logger logger = LoggerFactory.getLogger(outboundController.class);

	@Autowired
	private outboundService outboundservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private CompanyService companyservice;

	@GetMapping(value = "/outbound/outboundlist")
	public String list(Model model, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; //
		}
		List<outboundDTO> list = outboundservice.list();

		model.addAttribute("list", list);
		return "/outbound/outboundlist";

	}

	@GetMapping(value = "/outbound/outbounddetail")
	public String detail(@RequestParam("out_id") int out_id, Model model) throws Exception {
		System.out.println(out_id);
		List<outboundDTO> read = outboundservice.detail(out_id);
		System.out.println(read);

		model.addAttribute("detail", read);
		return "outbound/outbounddetail";

	}

	@GetMapping(value = "/outbound/outboundregister")
	public String registerform(HttpSession session, Model model) {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; //
		}
		List<ProductDTO> product = productservice.productlist();
		List<MemberDTO> member = memberservice.memberList();
		List<CompanyDTO> company = companyservice.companylist();
		model.addAttribute("product", product);
		model.addAttribute("member", member);
		model.addAttribute("company", company);
		return "outbound/outboundregister";
	}

	@PostMapping(value = "/outbound/outboundregister")
	public String register(@ModelAttribute outboundDTO outbounddto, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; //
		}
		outboundservice.register(outbounddto);
		System.out.println(outbounddto);
		return "redirect:/outbound/outboundlist";
	}

	@GetMapping(value = "/outbound/outboundupdate")
	public String updateform(@RequestParam int out_id, Model model) throws Exception {
		List<outboundDTO> dto = outboundservice.detail(out_id);
		model.addAttribute("up", dto);
		return "outbound/outboundupdate";
	}

	@PostMapping(value = "/outbound/outboundupdate")
	public String update(@ModelAttribute outboundDTO outbounddto) throws Exception {
		outboundservice.update(outbounddto);

		return "redirect:/outbound/outbounddetail?out_id=" + outbounddto.getOut_id();
	}

	@PostMapping(value = "/outbound/outbounddelete")
	public String delete(@RequestParam int out_id) throws Exception {
		int result = outboundservice.delete(out_id);
		if (result > 0) {
			return "redirect:/outbound/outboundlist";
		}
		return "redirect:/outbound/outboundlist";
	}
}
