package kr.or.hku.controller.student;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku/student")
public class CourseInfoController {
	
	@GetMapping("/search-subject")
	public String subjectForm() {
		return "student/search-subject";
	}
}
