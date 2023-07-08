package kr.or.hku.classroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hku/professor")
public class ProClassroomController {
	
	@GetMapping("/proClassroomList")
	public String classroom() {
		return "professor/classroomMain";
	}
}
