package kr.or.hku.controller.student;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hankuk")
public class RecordController {
	
	@GetMapping(value = "/record")
	public String record() {
		return "student/record";
	}

	@GetMapping(value = "/recordChange")
	public String recordChange() {
		return "student/recordChange";
	}
	
	@GetMapping(value = "/graduate")
	public String gradute() {
		return "student/graduate";
	}
	
}
