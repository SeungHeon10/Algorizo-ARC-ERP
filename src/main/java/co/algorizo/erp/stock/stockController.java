package co.algorizo.erp.stock;

import java.util.ArrayList;
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
	private ProductService productservice;

	@GetMapping(value = "/stock/stocklist")
	public String list(Model model, HttpSession session,@ModelAttribute stockDTO stockdto) throws Exception {
		if (session.getAttribute("m_id") == null) {
			return "redirect:/"; //
		}
		List<stockDTO> list = stockservice.list();
		List<StockSummaryDTO> summary = stockservice.summary();
		for (stockDTO dto : list) {
		    if (dto.getProduct_p_id() == stockdto.getProduct_p_id()) { // 특정 조건
		        if (dto.getS_quantity() > 50) {
		            dto.setS_status("재고 충족"); // 수량이 50개 초과인 경우
		        } else if (dto.getS_quantity() > 0) {
		            dto.setS_status("재고 부족"); // 수량이 1개 이상 50개 이하인 경우
		        } else if (dto.getS_quantity() == 0) {
		            dto.setS_status("재고 없음"); // 수량이 0인 경우
		        }
		        stockservice.updateStockStatus(dto); // 상태 변경을 데이터베이스에 반영
		    }
		}

		model.addAttribute("list", list);
		model.addAttribute("summary", summary);
		
		return "stock/stocklist";
	}

	@GetMapping(value = "/stock/stockdetail")
	public String detail(@RequestParam int s_id, Model model) throws Exception {
		stockDTO dto = stockservice.detail(s_id);
		System.out.println("s_controller" + dto);
		model.addAttribute("detail", dto);

		return "stock/stockdetail";
	}

}
