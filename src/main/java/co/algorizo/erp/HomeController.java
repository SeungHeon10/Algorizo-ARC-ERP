package co.algorizo.erp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.algorizo.erp.register.dto.MemberDTO;
import co.algorizo.erp.register.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		logger.info("login page");
		return "login";
	}
	// 로그인 처리
	@PostMapping(value="/")
	public String login(HttpServletRequest request,
			@ModelAttribute MemberDTO dto,
			Model model,
			HttpSession session) {
		logger.info("로그인 처리");
		
		if (dto.getM_id() == null || dto.getM_password() == null) {
	        model.addAttribute("error", "true");
	        return "login";
	    }

	    MemberDTO memberFromDb = service.selectMember(dto.getM_id());
	    if (memberFromDb == null) {
	        model.addAttribute("error", "true");
	        return "login";
	    }
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    if (!encoder.matches(dto.getM_password(), memberFromDb.getM_password())) {
	        model.addAttribute("error", "true");
	        return "login";
	    }

	    session.setAttribute("m_id", memberFromDb.getM_id());
	    session.setAttribute("m_name", memberFromDb.getM_name());
	    session.setAttribute("d_id", memberFromDb.getDept_d_id());
	    logger.info("m_id : " + session.getAttribute("m_id"));
	    logger.info("d_id : " + session.getAttribute("d_id"));
		
		return "home";
	}
	@RequestMapping("/members")
	public String showMembers(HttpSession session) {
	    if (session.getAttribute("m_id") == null) {
	        return "redirect:/";  // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
	    }

	    logger.info("show member test");
	    return "members";
	}
	
	
	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		session.invalidate();
		
		return "login";
	}
		
	
	@RequestMapping(value="/error-500", method=RequestMethod.GET)
	String error500() {
		logger.info("error test");
		
		return "error-500";
	}
	
	@RequestMapping("/home")
	public String goHome() {
		logger.info("go home");
		
		return "home";
	}
	
	
	

	
	
}
