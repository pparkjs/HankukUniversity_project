package kr.or.hku.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku/admin")
public class FacilityController {

	@GetMapping("/facility-administration")
	public String facility() {
		log.info("facility() 실행...!");
		return "admin/facility-administration";
	}
}
