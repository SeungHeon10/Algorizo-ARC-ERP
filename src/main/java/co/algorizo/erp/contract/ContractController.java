package co.algorizo.erp.contract;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.algorizo.erp.contract.ContractDTO;

@Controller
public class ContractController {
	
	@Inject
	ContractService contractService;
	
	@GetMapping(value="contract/list")
	public String list(Model model, HttpSession session) {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		
		List<ContractDTO> list = contractService.getAllContracts();
		
		model.addAttribute("list", list);
		
		
		return "contractList";
	}
	
	@GetMapping(value="contract/register")
	public String register(Model model, HttpSession session) {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		
		 String nextContractCode = contractService.generateNextContractCode();
	        model.addAttribute("nextContractCode", nextContractCode);
		
		return "contractRegister";
	}
	
	@PostMapping(value="contract/register")
	public String register(@RequestParam Map<String, Object> map, HttpSession session) {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		
		System.out.println("cr_code: " + map.get("cr_code"));
	    System.out.println("cr_qty: " + map.get("cr_qty"));
	    
	    
		contractService.register(map);
		
		return "redirect:/contract/list";
	}
	
	@GetMapping(value="contract/detail")
	public String detail(@RequestParam("cr_code") String cr_code, Model model) {
		
		ContractDTO contract = contractService.getContractDetail(cr_code);
		
		model.addAttribute("contract", contract);
		
		return "contractDetail";
	}
	
	@GetMapping(value="contract/update")
	public String update(@RequestParam("cr_code") String cr_code, Model model) {
		ContractDTO contract = contractService.getContractDetail(cr_code);
		
		model.addAttribute("contract", contract);
		
		return "contractUpdate";
	}
	
	@PostMapping(value="contract/update")
	public String update(@RequestParam Map<String, Object> map) {
		
		contractService.updateContract(map);
		
		return "redirect:/contract/detail?cr_code=" + map.get("cr_code");
	}
	
	@GetMapping(value="contract/delete")
	public String delete(@RequestParam("cr_code")String cr_code) {
		
		contractService.deleteContract(cr_code);
		
		return "redirect:/contract/list";
	}
	

}
