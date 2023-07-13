package kr.or.hku.student.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.student.service.FacilityService;
import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku")
public class FaciltyReservationController {
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private FacilityService facilityService;
	
	@GetMapping("/locker-rsvt")
	public String lockerRsvt(HttpSession session, Model model) {
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		List<FacilityVO> flctList = commonService.floorListFlct(vo.getFlctNo());
		
		model.addAttribute("std", vo);
		model.addAttribute("flctList", flctList);
		return "student/locker-rsvt";
	}
	
	// 사물함 리스트 가져오기
	@ResponseBody
	@GetMapping("/locker-list")
	public ResponseEntity<List<LockerVO>> lockerList(@RequestParam Map<String, Object> map){
		
		log.info("맵확인 : " + map);
		
		List<LockerVO> list = facilityService.lockerList(map);
		
		return new ResponseEntity<List<LockerVO>>(list, HttpStatus.OK);
	}
	
	// 사물함 예약하기
	@ResponseBody
	@PostMapping(value="/locker-reservation",  produces = "application/json;charset=utf-8")
	public ResponseEntity<String> lockerReservation(@RequestBody LockerRsvtVO locker){
		log.info("사물함 예약 정보: " + locker);
		
		ServiceResult result = facilityService.lockerReservation(locker);
		
		if(result.equals(ServiceResult.EXIST)) {
			return new ResponseEntity<String>("exist", HttpStatus.OK);
		}else if(result.equals(ServiceResult.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}
	}
	
	// 시설물예약으로 이동
	@GetMapping("/facility-rsvt")
	public String facilityRsvtForm(){
		return "student/facility-rsvt";
	}
	
	// 나의 예약현황으로 이동
	@GetMapping("/my-reservation")
	public String myReservation() {
		return "student/my-reservation";
	}
}
