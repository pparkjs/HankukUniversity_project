package kr.or.hku.login.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.admin.vo.EmployeeVO;
import kr.or.hku.login.service.ILoginService;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/main")
@Slf4j
public class LoginController {
	@Autowired
	private ILoginService loginService;
	
	//로그인페이지 호출 
	@GetMapping("/login")
	public String loginPage() {
		return "login/loginPage";
	}
	
	//로그인 처리 로직
	@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_PROFESSOR','ROLE_ADMIN')")
	@GetMapping("/loginProcess")
	public String loginProcess(HttpServletRequest request) {
		String goPage = "";
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		HttpSession session = request.getSession();
		UsersVO userVo = loginService.loginUser(users.getUsername());
		
		//사용자식별코드가 학생일경우
		if(userVo.getUserClsCd().equals("student")) {
			StudentVO stdVo = loginService.studentUser(userVo.getUserNo());
			session.setAttribute("std", stdVo);
	
			goPage = "redirect:/main/portal";
		}else if(userVo.getUserClsCd().equals("professor")) {//사용자식별코드가 교수일경우
			ProfessorVO proVo = loginService.professorUser(userVo.getUserNo());
			session.setAttribute("pro", proVo);
			goPage = "redirect:/main/pro";
		}else{//사용자식별코드가 직원일경우
			EmployeeVO empVo = loginService.employeeUser(userVo.getUserNo());
			session.setAttribute("emp", empVo);
			goPage = "redirect:/main/emp";
		}
		
		return goPage;
	}
	
	//로그아웃 처리로직
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/login";
	}
	
	//포탈페이지 호출 
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/portal")
	public String goPortal() {
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ProfessorVO proVo = loginService.professorUser(users.getUsername());
		System.out.println("유저네임!!!!!"+users.getUsername());
		log.info("user.password : "+users.getPassword());
		
		return "portal/home";
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/emp")
	public String adminMain(Principal principal) {
		return "admin/main";
	}
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/pro")
	public String professorMain() {
		return "professor/main";
	}
	
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/student")
	public String studentMain() {
		return "student/main";
	}


}
