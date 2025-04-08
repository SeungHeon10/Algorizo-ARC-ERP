package co.algorizo.erp.inspection;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.inbound.inboundService;

@Controller
@RequestMapping(value = "/inspection")
public class InspectionController {
	@Autowired
	private InspectionService inspectionService;
	@Autowired
	private inboundService inboundService;
	
//	전체조회
	@GetMapping(value = "/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		
		List<InspectionDTO> list = inspectionService.list();
		
		mav.addObject("list", list);
		mav.setViewName("in_list");
		return mav;
	}
//	상세보기
	@GetMapping(value = "/detail")
	public ModelAndView detail(@RequestParam int i_id) {
		ModelAndView mav = new ModelAndView();
		
		InspectionDTO inspection = inspectionService.detail(i_id);
		
		mav.addObject("detail", inspection);
		mav.setViewName("in_detail");
		return mav;
	}
//	등록폼 이동
	@GetMapping(value = "/register")
	public String registerForm() {
		
		return "in_register";
	}
//	등록
	@PostMapping(value = "/register")
	public String register(InspectionDTO inspectionDTO) {
		Date today = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(" HH:mm:ss");
		inspectionDTO.setI_date(inspectionDTO.getI_date() + simpleDateFormat.format(today));
		inspectionService.register(inspectionDTO);
		
		return "redirect:list";
	}
//	수정폼 이동
	@GetMapping(value = "/update")
	public ModelAndView updateForm(@RequestParam int i_id) {
		ModelAndView mav = new ModelAndView();
		
		InspectionDTO inspection = inspectionService.detail(i_id);
		
		mav.addObject("detail", inspection);
		mav.setViewName("in_update");
		return mav;
	}
//	수정
	@PostMapping(value = "/update")
	public String update(InspectionDTO inspectionDTO) {
		Date today = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		inspectionDTO.setI_moddate(simpleDateFormat.format(today));
		
		inspectionService.update(inspectionDTO);
		
		return "redirect:list";
	}
//	삭제
	@GetMapping(value = "/delete")
	public String delete(@RequestParam int i_id) {
		
		inspectionService.delete(i_id);
		
		return "redirect:list";
	}
//	코드 불러오기
	@GetMapping(value = "/code")
	@ResponseBody
	public String registerCode() {
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String prefix = "INSP-" + dateFormat.format(today) + "-";
		String lastcode = inspectionService.registerCode(prefix);
		
		int index = 1;
		if(lastcode != null) {
			String[] parts = lastcode.split("-");
			index = Integer.parseInt(parts[2]) + 1;
		}
		String resultNum = String.format("%03d", index);
		return prefix + resultNum;
	}
//	입고 목록 조회
	@GetMapping(value = "/inboundList")
	@ResponseBody
	public List<inboundDTO> inboundList() throws Exception{
		return inboundService.list();
	}
//	입고 상세 조회
	@GetMapping(value = "/inboundDetail")
	@ResponseBody
	public List<inboundDTO> inboundDetail(@RequestParam int in_id) throws Exception{
		return inboundService.detail(in_id);
	}
}
