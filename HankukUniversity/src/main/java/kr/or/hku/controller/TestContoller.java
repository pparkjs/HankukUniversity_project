package kr.or.hku.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/hankuk")
public class TestContoller {
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String totalTest() {
		return "student/blank";
	}
	
}
