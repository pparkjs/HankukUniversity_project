package kr.or.hku.controller.student;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.vo.StudyVO;

@Controller
@RequestMapping(value = "/hankuk")
public class StudyController {
	
	@GetMapping(value = "student/study")
	public String record() {
		return "student/study";
	}
	
	@PostMapping(value = "student/study")
	public int addStudy( StudyVO vo, Model model) {
		
	}
}
