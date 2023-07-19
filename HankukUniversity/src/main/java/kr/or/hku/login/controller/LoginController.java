package kr.or.hku.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.vo.EmployeeVO;
import kr.or.hku.login.service.ILoginService;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;

@Controller
@RequestMapping("/main")
public class LoginController {
	@Autowired
	private ILoginService loginService;
	
	
	//로그인페이지 호출 
	@GetMapping("/login")
	public String loginPage() {
		
		return "login/loginPage";
	}
	
	//로그인 처리 로직	
	@PostMapping(value="/login")
	public String loginProcess(Model model,UsersVO usersVo,HttpServletRequest request) {
		String goPage = "";
		HttpSession session = request.getSession();
		UsersVO userVo = loginService.loginUser(usersVo);
		System.out.println("userVO"+usersVo.getUserClsCd());
//		model.addAttribute("cls", userVo.getUserClsCd());
		
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
			EmployeeVO empVo = loginService.employeeUser(usersVo.getUserNo());
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
	@GetMapping("/portal")
	public String goPortal() {
		return "student/main";
	}
	
	@GetMapping("/emp")
	public String adminMain() {
		return "admin/main";
	}
	
	@GetMapping("/pro")
	public String professorMain() {
		return "professor/main";
	}
	
	
	@GetMapping("/student")
	public String studentMain() {
		return "student/main";
	}


}
