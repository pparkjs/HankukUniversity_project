package kr.or.hku.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.portal.service.WeatherService;

@Controller
@RequestMapping("/weather")
public class WeatherController {
	
	@Autowired
	WeatherService weatherService;
	
	@GetMapping("/test")
	public String goWeather(Model model) {
		String key = weatherService.getApiKey();
		model.addAttribute("key", key);
		return "weather";
	}

}
