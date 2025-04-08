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
	
	
	@GetMapping(value="outbound/o_list")
	public String list(Model model, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // 
	    }
		List<outboundDTO> list = outboundservice.list();
		
		model.addAttribute("list", list);
		return "o_list";
		
	}
	
	@GetMapping(value="outbound/o_detail")
	public String detail(@RequestParam("out_id") int out_id,Model model) throws Exception {
		System.out.println(out_id);
		List<outboundDTO> read = outboundservice.detail(out_id);
		System.out.println(read);
		
		model.addAttribute("detail", read);
		return "o_detail";
		
	}
	
	@GetMapping(value="outbound/o_register")
	public String registerform(HttpSession session,Model model) {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  //
	    }
		List<ProductDTO> product = productservice.productlist();
		List<MemberDTO> member = memberservice.memberList();
		List<CompanyDTO> company = companyservice.companylist();
		model.addAttribute("product", product);
		model.addAttribute("member", member);
		model.addAttribute("company", company);
		return "o_register";
	}
	
	@PostMapping(value="outbound/o_register")
	public String register(@ModelAttribute outboundDTO outbounddto, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  //
	    }
		System.out.println(outbounddto);
		outboundservice.register(outbounddto);
		return "redirect:/outbound/o_list";
	}
	
	@GetMapping(value="outbound/o_update")
	public String updateform(@RequestParam int out_id,Model model) throws Exception {
		List<outboundDTO> dto = outboundservice.detail(out_id);
		model.addAttribute("up", dto);
		return "o_update";
	}
	
	@PostMapping(value="outbound/o_update")
	public String update(@ModelAttribute outboundDTO outbounddto) throws Exception {
		outboundservice.update(outbounddto);
		
		return "redirect:/outbound/o_detail?out_id=" + outbounddto.getOut_id();
	}
	
	@PostMapping(value="outbound/o_delete")
	public String delete(@RequestParam int out_id) throws Exception {
		int result = outboundservice.delete(out_id);
		if(result > 0) {
			return "redirect:/outbound/o_list";
		}
		return "redirect:/outbound/o_list";
	}
}
