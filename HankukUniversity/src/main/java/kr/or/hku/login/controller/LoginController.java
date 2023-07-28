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
import kr.or.hku.common.service.CommonService;
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
	
	@Autowired
	private CommonService commonService;
	
	@Inject
	BCryptPasswordEncoder pe;
	
	boolean firstFlag = false;
	
	//로그인페이지 호출 
	@GetMapping("/login")
	public String loginPage() {
		return "login/loginPage";
	}
	
	//로그인 처리 로직
	@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_PROFESSOR','ROLE_ADMIN')")
	@GetMapping("/")
	public String loginProcess(
			HttpSession session,
			HttpServletRequest request,Model model) {
		return sessionProcess(session, model);
	}
	
	public String sessionProcess(HttpSession session, Model model) {
		String goPage = "";
		
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UsersVO userVo = loginService.loginUser(users.getUsername());
		
		System.out.println("첫번째로긴"+userVo.getUserFirstLogin());
		if(userVo.getUserFirstLogin().equals("0") && !firstFlag) {
			model.addAttribute("first", "0");
			firstFlag = true;
		}
		
		//사용자식별코드가 학생일경우
		if(userVo.getUserClsCd().equals("student")) {
			StudentVO stdVo = loginService.studentUser(userVo.getUserNo());
			StudentVO stuInfo = commonService.myAllInfo(stdVo.getStdNo()); // student테이블 뿐만 아니라 나의 관련 모든 정보 가져오기
			session.setAttribute("std", stdVo);
			session.setAttribute("stdInfo", stuInfo); 
			
			goPage = "portal/home";
		}else if(userVo.getUserClsCd().equals("professor")) {//사용자식별코드가 교수일경우
			ProfessorVO proVo = loginService.professorUser(userVo.getUserNo());
			ProfessorVO proInfo = commonService.myProInfo(proVo.getProNo());
			session.setAttribute("pro", proVo);
			session.setAttribute("proInfo", proInfo);
			
			goPage = "professor/main";
		}else{//사용자식별코드가 직원일경우
			EmployeeVO empVo = loginService.employeeUser(userVo.getUserNo());
			session.setAttribute("emp", empVo);
			goPage = "admin/main";
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
	public String goPortal(
			HttpSession session, Model model
			) {
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ProfessorVO proVo = loginService.professorUser(users.getUsername());
		System.out.println("유저네임!!!!!"+users.getUsername());
		
		String goPage = sessionProcess(session, model);
		
		log.info("user.password : "+users.getPassword());
		
		return goPage;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/emp")
	public String adminMain(Principal principal,
			HttpSession session, Model model) {
		return sessionProcess(session, model);
	}
	
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/pro")
	public String professorMain(
			HttpSession session, Model model) {
		return sessionProcess(session, model);
	}
	
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/student")
	public String studentMain() {
		return "redirect:/hku/student/record";
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
