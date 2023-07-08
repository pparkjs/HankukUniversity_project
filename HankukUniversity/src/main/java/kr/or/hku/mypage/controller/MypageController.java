package kr.or.hku.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hku/student")
public class MypageController {
	
	@GetMapping("/mypage")
	public String mypage() {
		return "student/mypage";
	}
	
}
