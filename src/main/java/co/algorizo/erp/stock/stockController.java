package co.algorizo.erp.stock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.inbound.inboundService;
import co.algorizo.erp.outbound.outboundDTO;
import co.algorizo.erp.outbound.outboundService;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.product.ProductService;
import co.algorizo.erp.register.dto.MemberDTO;
import co.algorizo.erp.register.service.MemberService;

@Controller
public class stockController {
	
	int currentquantity;

	private static final Logger logger = LoggerFactory.getLogger(stockController.class);

	@Autowired
	private stockService stockservice;
	@Autowired
	private inboundService inboundservice;
	@Autowired
	private outboundService outboundservice;
	@Autowired
	private CompanyService companyservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private MemberService memberservice;

	@GetMapping(value = "stock/s_list")
	public String list(Model model, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; //
		}
		List<stockDTO> list = stockservice.list();
		model.addAttribute("list", list);
		List<StockSummaryDTO> summary = stockservice.summary();
		model.addAttribute("summary", summary);

		return "s_list";
	}

	@GetMapping(value = "stock/s_detail")
	public String detail(@RequestParam int s_id, Model model) throws Exception {
		System.out.println(s_id);
		List<stockDTO> dto = stockservice.detail(s_id);
		System.out.println("s_controller" + dto);
		model.addAttribute("detail", dto);

		return "s_detail";
	}

	@GetMapping(value = "stock/s_register")
	public String registerform(HttpSession session, Model model) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; // 로그인 체크
		}

		List<inboundDTO> inbound = inboundservice.list();
		List<outboundDTO> outbound = outboundservice.list();
		List<ProductDTO> product = productservice.productlist();

		// 최신 입출고 정보 Map으로 저장

		model.addAttribute("inbound", inbound);
		model.addAttribute("outbound", outbound);
		model.addAttribute("product", product);

		return "s_register";
	}

	@PostMapping(value = "stock/s_register")
	public String register(@ModelAttribute stockDTO stockdto, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; //
		}
		System.out.println(stockdto);
		stockservice.register(stockdto);
		return "redirect:/stock/s_list";

	}

	@GetMapping(value = "stock/s_update")
	public String updateform(@RequestParam int s_id, Model model) throws Exception {
		List<stockDTO> update = stockservice.detail(s_id);

		model.addAttribute("up", update);
		return "s_update";
	}

	@PostMapping(value = "stock/s_update")
	public String update(@ModelAttribute stockDTO stockdto) throws Exception {
		stockservice.update(stockdto);
		return "redirect:s_detail?s_id=" + stockdto.getS_id();

	}

	@PostMapping(value = "stock/s_delete")
	public String delete(@RequestParam int s_id) throws Exception {
		int result = stockservice.delete(s_id);

		if (result > 0) {
			return "redirect:/stock/s_list";
		}
		return "redirect:/stock/s_list";
	}

}
