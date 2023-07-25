package kr.or.hku.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/hku/admin")
public class ChartController {
	@GetMapping(value = "/totalChart")
	public String studyList() {
		
		return "admin/totalChart";
	}
}
