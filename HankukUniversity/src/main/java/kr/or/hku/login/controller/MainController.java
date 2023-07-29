package kr.or.hku.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.hku.login.service.ILoginService;
import kr.or.hku.login.vo.UsersVO;

// 시큐리티 타겟이 없을 때 요청 되는 localhost ( / ) controller
@Controller
public class MainController {
	
	@Autowired
	private ILoginService loginService;
	
	@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_PROFESSOR','ROLE_ADMIN')")
	@GetMapping("/")
	public String loginProcess(HttpServletRequest request,RedirectAttributes re, Model model) {
		String goPage = "";
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UsersVO userVo = loginService.loginUser(users.getUsername());
		
		//사용자식별코드가 학생일경우
		if(userVo.getUserClsCd().equals("student")) {
			
			goPage = "redirect:/main/portal";
		}else if(userVo.getUserClsCd().equals("professor")) {//사용자식별코드가 교수일경우
			
			goPage = "redirect:/main/pro";
		}else{//사용자식별코드가 직원일경우
			
			goPage = "redirect:/main/emp";
		}
		
		return goPage;
	}
	
}
