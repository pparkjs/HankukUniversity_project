package kr.or.hku.mypage.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
import kr.or.hku.login.service.ILoginService;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.mypage.service.IMypageService;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku")
public class MypageController {
	
	@Autowired
	private IMypageService service;
	
	@Autowired
	private ILoginService loginService;
	
	@Autowired
	private BCryptPasswordEncoder pe;
	
	@GetMapping("/mypage")
	public String mypage() {
		return "portal/mypage";
	}
	
	@PostMapping("/mypage")
	public String myInfo(UsersVO usersVO, Model model) {
		String myId = SecurityContextHolder.getContext().getAuthentication().getName();
		usersVO.setUserNo(myId);
		boolean isOk = service.checkPassword(usersVO);
		String goPage = "";
		
		log.info("검증이 됬냐?" + isOk + usersVO.getUserPw());
		if(isOk) {
			model.addAttribute("checkPass", "checkOk");
			
		}
		return "portal/mypage";
	}
	
	@GetMapping("/mypage/security")
	public String mypageSecurityProcess() {
		return "login/myPagePasswordCheck";
	}
	
	@ResponseBody
	@PostMapping("/mypage/modifyInfo")
	public String modifyInfo(HttpSession session, StudentVO vo) {
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		vo.setStdNo(stdVo.getStdNo());
		log.info("vo!!! : " + vo.toString());
		int result = service.modifyInfo(vo);
		String msg = null;
		if(result > 0) {
			msg = "success";
			StudentVO reVO = loginService.studentUser(vo.getStdNo());
			session.setAttribute("std", reVO);
		}
		return msg;
	}
	
	@GetMapping("/mypage/changePw")
	public String changePw() {
		return "/portal/changePw";
	}
	
	@ResponseBody
	@PostMapping("/mypage/changePassword")
	public String changePassword(String userNo, String newPw) {
		Map<String , String> map = new HashMap<String, String>();
		
		map.put("stdNo", userNo);
		map.put("newPw", pe.encode(newPw));
		int res = service.changePassword(map);
		String msg = null;
		if(res > 0) {
			msg = "success";
		}
		return msg;
	}

	
	
	
}
