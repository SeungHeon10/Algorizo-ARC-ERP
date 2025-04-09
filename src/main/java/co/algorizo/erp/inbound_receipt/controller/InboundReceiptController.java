package co.algorizo.erp.inbound_receipt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.inbound_receipt.dto.InboundReceiptDTO;
import co.algorizo.erp.inbound_receipt.service.InboundReceiptService;

@Controller
public class InboundReceiptController {
	private static final Logger log = LoggerFactory.getLogger(InboundReceiptController.class);
	
	@Autowired
	private InboundReceiptService irService;
	
//	전체조회
	@GetMapping(value="inboundReceipt/listAllInboundReceipt")
	public String listAllInboundReceipt(Model model, HttpSession session) throws Exception {
		log.info("입고거래명세서 전체조회");
		if(session.getAttribute("m_id") == null) {
			return "redirect:/";
		}
		List<InboundReceiptDTO> irList = irService.listAllInboundReceipt();
		model.addAttribute("irList", irList);
		
		return "inboundReceipt/inboundReceiptList";
	}

//	선택조회
	@GetMapping(value="inboundReceipt/selectOneInboundReceipt")
	public String selectOneInboundReceipt(@RequestParam("inre_id") int inre_id, Model model) throws Exception {
		log.info("거래명세서 상세 조회 : " + inre_id);
		InboundReceiptDTO irDTO = irService.selectOneInboundReceipt(inre_id);
//		DTO값 확인
		log.info("irDTO : " + irDTO.toString());
		
		model.addAttribute("irDTO", irDTO);
		
		return "inboundReceipt/inboundReceiptDetail";
	}
	
//	등록
	@GetMapping(value="inboundReceipt/insertInboundReceipt")
	public String insertInboundReceiptForm(@RequestParam("in_id") int in_id, Model model) throws Exception {
		log.info("입고 번호로 거래명세서 생성 폼 요청 : " + in_id);
		
		// in_id로 입고 정보 조회 (반환 타입 변경)
		inboundDTO inboundData = irService.getInboundById(in_id);

		// DTO 변환
		InboundReceiptDTO inboundReceipt = new InboundReceiptDTO();
		inboundReceipt.setInbound_in_id(inboundData.getIn_id()); // 입고번호
		inboundReceipt.setP_name(inboundData.getProduct().getP_name()); // 품목명
		inboundReceipt.setP_code(inboundData.getProduct().getP_code()); // 품목코드
		inboundReceipt.setIn_quantity(inboundData.getIn_quantity()); // 입고수량
		inboundReceipt.setP_price(inboundData.getProduct().getP_price()); // 단가
		inboundReceipt.setCp_name(inboundData.getCompany().getCp_name()); // 회사명
		inboundReceipt.setCp_manager(inboundData.getCompany().getCp_manager()); // 담당자
		inboundReceipt.setCp_fax(inboundData.getCompany().getCp_fax()); // Fax
		inboundReceipt.setInre_totalprice(inboundData.getIn_quantity() * inboundData.getProduct().getP_price()); // 입고 총 가격
		
//		모델에 조회된 입고 정보 추가
		model.addAttribute("inboundReceipt", inboundReceipt);
		
		return "inboundReceipt/insertInboundReceipt";
	}
	
//	등록 처리
	@PostMapping("inboundReceipt/insertInboundReceipt")
	public String insertInboundReceipt(@RequestParam("in_id") int in_id) throws Exception {
		
		
		
	    // 1️⃣ in_id로 입고 정보 조회
	    inboundDTO inboundData = irService.getInboundById(in_id);

	    // 2️⃣ 조회된 데이터 확인 (로그 찍기)
	    if (inboundData == null) {
	        log.error("입고 데이터가 존재하지 않음! in_id: " + in_id);
	        return "redirect:/errorPage";
	    }
	    log.info("조회된 입고 정보: " + inboundData.toString());

	    if (inboundData.getProduct() == null) {
	        log.error("상품 정보가 없음! product_p_id: " + inboundData.getProduct_p_id());
	    } else {
	        log.info("조회된 상품 정보: " + inboundData.getProduct().toString());
	    }
	    // 3️⃣ InboundReceiptDTO에 데이터 설정
	    InboundReceiptDTO irDTO = new InboundReceiptDTO();
	    irDTO.setInbound_in_id(in_id); // in_id만 설정하고 inre_id는 설정하지 않음
	    irDTO.setInbound_in_id(inboundData.getIn_id()); // 입고 번호
	    irDTO.setP_name(inboundData.getProduct().getP_name()); // 품목 명
	    irDTO.setP_code(inboundData.getProduct().getP_code()); // 품목 코드
	    irDTO.setIn_quantity(inboundData.getIn_quantity()); // 입고 수량
	    irDTO.setCp_name(inboundData.getCompany().getCp_name()); // 공급업체명
	    irDTO.setCp_manager(inboundData.getCompany().getCp_manager()); // 담당자
	    irDTO.setCp_fax(inboundData.getCompany().getCp_fax()); // Fax
	    irDTO.setInre_totalprice(inboundData.getIn_quantity() * inboundData.getProduct().getP_price()); // 입고 총 가격
	    log.info("irDTO 확인 : " + irDTO);

	    // 4️⃣ 거래명세서 등록
	    irService.insertInboundReceipt(irDTO);
	    
	    return "redirect:/inboundReceipt/listAllInboundReceipt";
	}
	
	
}
