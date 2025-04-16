package co.algorizo.erp.inspection;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

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

import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.inbound.inboundService;
import co.algorizo.erp.inspection.DTO.DefectReasonDTO;
import co.algorizo.erp.inspection.DTO.InspectionDTO;

@Controller
@RequestMapping(value = "/inspection")
public class InspectionController {
	@Autowired
	private InspectionService inspectionService;
	@Autowired
	private inboundService inboundService;
	
//	�쟾泥댁“�쉶 �럹�씠吏� �씠�룞
	@GetMapping(value = "/list")
	public ModelAndView listPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("m_id") == null) { 
			mav.setViewName("redirect:/");
	        return mav;
	    }
		
		mav.setViewName("inspection/inspectionList");
		return mav;
	}
	
//	寃��닔 議고쉶 紐⑸줉
	@GetMapping(value = "/listData")
	public ResponseEntity<List<InspectionDTO>> list() {
		List<InspectionDTO> list = inspectionService.list();
		
		return ResponseEntity.ok(list);
	}
	
//	�긽�꽭蹂닿린 �럹�씠吏� �씠�룞
	@GetMapping(value = "/detail")
	public ModelAndView detailPage(@RequestParam int i_id) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("i_id", i_id);
		mav.setViewName("inspection/inspectionDetail");
		return mav;
	}
	
//	寃��닔 �긽�꽭蹂닿린
	@GetMapping(value = "/detailData")
	public ResponseEntity<InspectionDTO> detail(@RequestParam int i_id) {
		InspectionDTO inspection = inspectionService.detail(i_id);
		return ResponseEntity.ok(inspection);
	}
	
//	�벑濡앺뤌 �씠�룞
	@GetMapping(value = "/register")
	public String registerForm(HttpSession session) {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";
	    }
		return "inspection/inspectionRegister";
	}
	
//	�벑濡�
	@PostMapping(value = "/register")
	public ResponseEntity<String> register(@RequestBody InspectionDTO inspectionDTO) {
		inspectionService.register(inspectionDTO);
		
		return ResponseEntity.ok("�벑濡앹셿猷�!");
	}
	
//	�닔�젙�뤌 �씠�룞
	@GetMapping(value = "/update")
	public ModelAndView updateForm(@RequestParam int i_id) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("i_id", i_id);
		mav.setViewName("inspection/inspectionUpdate");
		return mav;
	}
	
//	�닔�젙
	@PostMapping(value = "/update")
	public ResponseEntity<String> update(@RequestBody InspectionDTO inspectionDTO) {
		inspectionService.update(inspectionDTO);
		
		return ResponseEntity.ok("�닔�젙�셿猷�!");
	}
//	�궘�젣
	@PostMapping(value = "/delete")
	public ResponseEntity<String> delete(@RequestParam int i_id) {
		
		inspectionService.delete(i_id);
		
		return ResponseEntity.ok("�궘�젣�셿猷�!");
	}
	
//	肄붾뱶 �깮�꽦
	@GetMapping(value = "/code")
	@ResponseBody
	public String registerCode() {
		String newCode = inspectionService.registerCode();
		
		return newCode;
	}
	
//	�엯怨� 紐⑸줉 議고쉶
	@GetMapping(value = "/inboundList")
	@ResponseBody
	public List<inboundDTO> inboundList() {
		
		return inspectionService.inboudList();
	}
	
//	�엯怨� �긽�꽭 議고쉶
	@GetMapping(value = "/inboundDetail")
	@ResponseBody
	public List<inboundDTO> inboundDetail(@RequestParam int in_id) throws Exception{
		return inboundService.detail(in_id);
	}
	
//	遺덈웾 �궗�쑀 由ъ뒪�듃
	@GetMapping(value = "/defectReason")
	@ResponseBody
	public List<DefectReasonDTO> defectReasonList(){
		
		return inspectionService.defectReasonList();
	}
	
//	遺덈웾 �궗�쑀 �뜲�씠�꽣
	@GetMapping(value = "/reasonData")
	@ResponseBody
	public Map<String, Object> defectReasonData(@RequestParam String month){
		LocalDate start = LocalDate.parse(month + "-01");
	    LocalDate end = start.withDayOfMonth(start.lengthOfMonth());
		
		return inspectionService.defectReasonData(start , end);
	}
}
