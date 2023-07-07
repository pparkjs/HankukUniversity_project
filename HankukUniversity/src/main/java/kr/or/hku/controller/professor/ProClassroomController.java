package kr.or.hku.controller.professor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hku")
public class ProClassroomController {
	
	@GetMapping("/proClassroomList")
	public String classroom() {
		return "professor/classroomList";
	}
}
