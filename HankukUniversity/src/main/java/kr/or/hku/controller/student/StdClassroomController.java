package kr.or.hku.controller.student;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hku")
public class StdClassroomController {
	
	@GetMapping("/stdClassroomList")
	public String classroom() {
		return "student/classroomList";
	}
}
