package kr.or.hku.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.AlarmVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku")
public class AlarmController {
	
	@Autowired
	private CommonService commonService;
	
	// 나의 알람 리스트 가져오기
	@ResponseBody
	@GetMapping("/getAlarmList")
	public List<AlarmVO> getAlarmList(){
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user아이디 : " + users.getUsername());
		log.info("user권한 : " + users.getAuthorities());
		return commonService.getAlarmList(users);
	}
}
