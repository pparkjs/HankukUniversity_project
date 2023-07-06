package kr.or.hku.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.service.common.ILoginService;
import kr.or.hku.vo.EmployeeVO;
import kr.or.hku.vo.ProfessorVO;
import kr.or.hku.vo.StudentVO;
import kr.or.hku.vo.UsersVO;

@Controller
@RequestMapping("/main")
public class LoginController {
	@Autowired
	private ILoginService loginService;
	
	@GetMapping("/login")
	public String loginPage() {
		return "login/loginPage";
	}
	
	@PostMapping(value="/login")
	public String loginProcess(Model model,UsersVO usersVo,HttpServletRequest request) {
		String goPage = "";
		HttpSession session = request.getSession();
		UsersVO userVo = loginService.loginUser(usersVo);
		model.addAttribute("cls", userVo.getUserClsCd());
		

		if(userVo.getUserClsCd().equals("student")) {
			StudentVO stdVo = loginService.studentUser(userVo.getUserNo());
			session.setAttribute("std", stdVo);
	
			goPage = "portal/blank";
		}else if(userVo.getUserClsCd().equals("professor")) {
			ProfessorVO proVo = loginService.professorUser(userVo.getUserNo());
			session.setAttribute("pro", proVo);
			goPage = "admin/blank";
		}else{
			EmployeeVO empVo = loginService.employeeUser(usersVo.getUserNo());
			session.setAttribute("emp", userVo);
			goPage = "professor/blank";
		}
		
		return goPage;
	}

}
