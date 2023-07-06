package kr.or.hku.controller.student;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/hankuk")
public class StudyController {
	
	@GetMapping(value = "/studyRoom")
	public String record() {
		return "student/studyRoom";
	}
}
