package co.algorizo.erp.register.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.algorizo.erp.register.dto.MemberDTO;
import co.algorizo.erp.register.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	
	// 회원가입
	@RequestMapping("/register")
	public String registerForm(Model model) {
		logger.info("register Form");
			
		model.addAttribute("member", new MemberDTO());
			
		return "register";
	}
	// 회원가입 처리
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(
	        @RequestParam("birth_year") String birthYear,
	        @RequestParam("birth_month") String birthMonth,
	        @RequestParam("birth_day") String birthDay,
	        @ModelAttribute("dto") MemberDTO dto,
	        @RequestParam String phone1,
	        @RequestParam String phone2,
	        @RequestParam String phone3
	) {
	    logger.info("register");

	    // YYMMDD 형식의 birth 생성
	    if (birthYear != null && !birthYear.isEmpty() &&
	        birthMonth != null && !birthMonth.isEmpty() &&
	        birthDay != null && !birthDay.isEmpty()) {
	        
	        String yearLastTwoDigits = birthYear.substring(birthYear.length() - 2);
	        String paddedMonth = String.format("%02d", Integer.parseInt(birthMonth));
	        String paddedDay = String.format("%02d", Integer.parseInt(birthDay));
	        
	        String fullBirth = yearLastTwoDigits + "-"+ paddedMonth + "-"+ paddedDay;
	        dto.setBirth(fullBirth);
	        
	        // 전화번호 설정
	        String m_pno = phone1 + "-" + phone2 + "-" + phone3;
	        dto.setM_pno(m_pno);  // DTO에 전화번호 설정
	        
	        System.out.println("서버에서 설정한 birth: " + fullBirth);
	    }
	    
	    // 전화번호 검증 (필요시 추가)
	    if (dto.getM_pno() == null || dto.getM_pno().trim().isEmpty()) {
	        throw new IllegalArgumentException("전화번호(m_pno)가 비어있습니다.");
	    }
	    
	    System.out.println("m_pno 값 : " + dto.getM_pno());

	    // 회원 등록
	    service.insertMember(dto);

	    logger.info("회원가입 성공" + dto);
	    logger.info("Submitted birth field in DTO: {}", dto.getBirth());

	    return "redirect:/";
	}
	
	// 사원 전체조회
	@GetMapping("/members")
	public String memberList(Model model, HttpSession session) {
		
		 if (session.getAttribute("m_id") == null) {
		        // 세션이 없으면 로그인 페이지로 리다이렉트
		        return "redirect:/";
		    }
		
		List<MemberDTO> memberList = service.memberList();
		model.addAttribute("memberList",memberList);
		
		return "members";
	}
	
	// 사원 detail
	@GetMapping("/members/memberDetail")
	public String membersDetail(@RequestParam("m_id") String m_id, Model model, HttpSession session) {
		logger.info("사원 상세 조회 m_id = " + m_id);
		
		 if (session.getAttribute("m_id") == null) {
		        // 세션이 없으면 로그인 페이지로 리다이렉트
		        return "redirect:/";
		    }
		
		MemberDTO member = service.memberDetail(m_id);
		model.addAttribute("member",member);
		
		
		
		return "memberDetail";
	}
	
	// 사원 delete
	@GetMapping(value="/members/deleteMember")
	public String deleteMember(@RequestParam("m_id") String m_id, HttpSession session) {
		logger.info("삭제, m_id = " + m_id );
		 if (session.getAttribute("m_id") == null) {
		        // 세션이 없으면 로그인 페이지로 리다이렉트
		        return "redirect:/";
		    }
		
		service.deleteMember(m_id);
		return "redirect:/members";
	}
	
	
	// 사원 수정 폼 이동
		@GetMapping(value="/members/updateMember")
		public String updateMember(@RequestParam("m_id") String m_id, Model model, HttpSession session) {
			logger.info("update page for m_id = " + m_id);
			
			 if (session.getAttribute("m_id") == null) {
			        // 세션이 없으면 로그인 페이지로 리다이렉트
			        return "redirect:/";
			    }
			
			MemberDTO member = service.selectMember(m_id);
			if(member == null) {
				model.addAttribute("error", "해당 사원을 찾을 수 없습니다.");
				return "error-404";
			}
			model.addAttribute("member",member);
			
			return "memberUpdate";
		}
		// 사원 수정 처리
		@PostMapping(value="/members/updateMember")
		public String updateMember(@ModelAttribute MemberDTO member,
				RedirectAttributes redirectAttributes, HttpSession session) {
			logger.info("Updating member : " + member);
			
			 if (session.getAttribute("m_id") == null) {
			        // 세션이 없으면 로그인 페이지로 리다이렉트
			        return "redirect:/";
			    }
			
			try {
				MemberDTO updatedMember = service.updateMember(member);
				redirectAttributes.addFlashAttribute("success", "사원 정보가 수정되었습니다.");
				return "redirect:/members/memberDetail?m_id=" + updatedMember.getM_id();
				
			} catch(Exception e){
				logger.error("Error!" + e.getMessage());
				redirectAttributes.addFlashAttribute("error", "사원 정보 수정에 실패했습니다.");
				return "redirect:/members/updateMember?m_id=" + member.getM_id();
			}
			
			
			
		}
	
	
	
	
}
