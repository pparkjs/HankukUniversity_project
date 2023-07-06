package kr.or.hku.controller.portal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hku")
public class MypageController {
	
	@GetMapping("/mypage")
	public String myPage() {
		return "portal/mypage";
	}
}
