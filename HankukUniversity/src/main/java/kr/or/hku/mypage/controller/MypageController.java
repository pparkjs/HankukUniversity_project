package kr.or.hku.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.mypage.service.IMypageService;
import kr.or.hku.student.vo.StudentVO;

@Controller
@RequestMapping("/hku/")
public class MypageController {
	
	@Autowired
	private IMypageService service;
	
	@GetMapping("/mypage")
	public String mypage() {
		return "student/mypage";
	}
	
	@PostMapping("/mypage")
	public String updateInfo() {
		return "student/mypage";
	}
	
}
