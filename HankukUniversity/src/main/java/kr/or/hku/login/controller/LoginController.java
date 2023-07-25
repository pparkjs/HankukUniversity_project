package kr.or.hku.login.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@Inject
	BCryptPasswordEncoder pe;
	
	//로그인페이지 호출 
	@GetMapping("/login")
	public String loginPage() {
		return "login/loginPage";
	}
	
	//로그인 처리 로직
	@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_PROFESSOR','ROLE_ADMIN')")
	@GetMapping("/loginProcess")
	public String loginProcess(HttpServletRequest request,RedirectAttributes re) {
		String goPage = "";
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		HttpSession session = request.getSession();
		UsersVO userVo = loginService.loginUser(users.getUsername());
		
		System.out.println("첫번째로긴"+userVo.getUserFirstLogin());
		if(userVo.getUserFirstLogin().equals("0")) {
			re.addFlashAttribute("first",'0');
		}
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

	
//	계정찾기페이지호출
	@PermitAll
	@GetMapping("/forget")
	public String forgetPage() {
		return "login/forgetPage";
	}
//	계정찾기페이지호출
	@PermitAll
	@GetMapping("/changePopup")
	public String changePopup() {
		return "login/changePopup";
	}
	
//	계정 찾기
	@PermitAll
	@ResponseBody
	@PostMapping("/forgetProcess")
	public String forgetProcess(String userName, String type, String userBd) {
		String userNo = loginService.forgetProcess(userName,type,userBd);
		
		return userNo;
	}
	
//	임시비밀번호 발급
	@PermitAll
	@PostMapping("/sendPassword")
	@ResponseBody
	public String sendPassword(String userNo, String userEmail) throws Exception {
		String result="";
		int res = loginService.sendPassword(userNo,userEmail);
		if(res > 0) {
			result="success";
		}else {
			result="failed";
		}
		return result;
	}
	@PermitAll
	@ResponseBody
	@PostMapping("/changePassword")
	public String changePassword(String temporary, String userNo, String newPw) {
		System.out.println("확인!!!!!!!!!!"+temporary+userNo+newPw);
		Map<String, String> map = new HashMap<String, String>();
		map.put("temporary", temporary);
		map.put("userNo", userNo);
		map.put("newPw", newPw);
		int res = loginService.changePassword(map);
		String result ="";
		if(res > 0 ) {
			result="success";
		}else {
		result="fail";
		}
		return result;
	}
	
}
