package kr.or.hku.student.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.common.service.CommonService;
import kr.or.hku.student.service.TuitionService;
import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.TuitionVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku")
public class TuitionController {
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private TuitionService tuitionService;

	@GetMapping("/tuition-payment-details")
	public String tuitionPaymentDetails(HttpSession session, Model model) {
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		
		List<TuitionVO> tuitionList = tuitionService.selectTuitionList(vo);
		log.info("tuitionList : " + tuitionList.toString());
		model.addAttribute("std", vo);
		model.addAttribute("tuitionList",tuitionList);
		return "student/tuition-payment-details";
	}
}
