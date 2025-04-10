package co.algorizo.erp.procurement_plan;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.algorizo.erp.procurement_plan.DTO.PlanDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDetailDTO;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.product.ProductService;

@Controller
@RequestMapping(value = "/plans")
public class PlanController {
	@Autowired
	private PlanService planService;
	@Autowired
	private ProductService productService;
	
//	조달 계획 목록 페이지 이동
	@GetMapping(value = "/list")
	public ModelAndView listPage(HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		if (session.getAttribute("m_id") == null) { 
			mav.setViewName("redirect:/");
	        return mav;
	    }
		mav.setViewName("procurement_plan/procurement_planList");
		return mav;
	}
	
//	조달 계획 목록
	@GetMapping(value = "/listData")
	public ResponseEntity<List<PlanDTO>> list() {
		
		List<PlanDTO> list = planService.list();
		return ResponseEntity.ok(list);
	}
	
//	조달 계획 상세보기 페이지 이동
	@GetMapping(value = "/detail")
	public ModelAndView detailPage(@RequestParam int plan_id) { //@RequestParam int plan_id
		ModelAndView mav = new ModelAndView();
		mav.addObject("plan_id", plan_id);
		mav.setViewName("procurement_plan/procurement_planDetail");
		return mav;
	}
	
//	조달 계획 상세보기
	@GetMapping(value = "/detailData")
	public ResponseEntity<List<PlanDetailDTO>> detail(@RequestParam int plan_id) {
		List<PlanDetailDTO> list = planService.detail(plan_id);
		
		return ResponseEntity.ok(list);
	}
	
//	조달 계획 등록폼 이동
	@GetMapping(value = "/register")
	public ModelAndView registerForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("procurement_plan/procurement_planRegister");
		return mav;
	}

//	조달 계획 등록하기
	@PostMapping(value = "/register")
	public ResponseEntity<String> plan_register(@RequestBody PlanDTO planDTO) {
		Date today = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(" HH:mm:ss");
		planDTO.setPlan_regdate(planDTO.getPlan_regdate() + simpleDateFormat.format(today));
		planService.plan_Register(planDTO);
		
		planDTO.getProducts().forEach(product -> product.setPlan_id(planDTO.getPlan_id()));
		planDTO.getProducts().forEach(product -> planService.product_Register(product));
		
		return ResponseEntity.ok("등록완료!");
	}
	
//	조달 계획 수정폼 이동
	@GetMapping(value = "/update")
	public ModelAndView updateForm(@RequestParam int plan_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("plan_id", plan_id);
		mav.setViewName("procurement_plan/procurement_planUpdate");
		return mav;
	}
	
//	조달 계획 수정하기
	@PostMapping(value = "/update")
	public ResponseEntity<String> update(@RequestBody PlanDTO planDTO) {
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		planDTO.setPlan_moddate(dateFormat.format(today));
		
		planService.update(planDTO);
		
		planService.product_Delete(planDTO.getPlan_id());
		
		planDTO.getProducts().forEach(product -> product.setPlan_id(planDTO.getPlan_id()));
		planDTO.getProducts().forEach(product -> planService.product_Register(product));
		return ResponseEntity.ok("수정완료!");
	}
	
//	조달 계획 삭제하기
	@PostMapping(value = "/delete")
	public ResponseEntity<String> delete(@RequestParam int plan_id) {
		planService.plan_Delete(plan_id);
		return ResponseEntity.ok("삭제완료!");
	}
	
//	코드 불러오기
	@GetMapping(value = "/code")
	@ResponseBody
	public String registerCode() {
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String prefix = "PL-" + dateFormat.format(today) + "-";
		String lastcode = planService.registerCode(prefix);
		
		int index = 1;
		if(lastcode != null) {
			String[] parts = lastcode.split("-");
			index = Integer.parseInt(parts[2]) + 1;
		}
		String resultNum = String.format("%03d", index);
		return prefix + resultNum;
	}
	
//	품목 리스트 가져오기
	@GetMapping(value = "/product_list")
	public ResponseEntity<List<ProductDTO>> product_list(){
		
		return ResponseEntity.ok(productService.productlist());
	}
}
