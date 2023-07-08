package kr.or.hku.controller.student;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.hku.vo.StudentVO;

@Controller
@RequestMapping("/hku/student")
public class MypageController {
	
	@GetMapping("/mypage")
	public String mypage() {
		return "student/mypage";
	}
	
}
