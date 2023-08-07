package kr.or.hku.student.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.vo.FacilitiesVO;
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
	
	@PreAuthorize("hasRole('ROLE_STUDENT')")
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
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		locker.setStdNo(users.getUsername());
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
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/facility-rsvt")
	public String facilityRsvtForm(Model model){
		return "student/facility-rsvt";
	}
	
	// 시설에 해당하는 시설물 리스트 가져오기
	@ResponseBody
	@GetMapping("/flct-list")
	public ResponseEntity<List<FacilitiesVO>> fcltsList(@RequestParam Map<String, Object> map){
		log.info("시설물 맵 : " + map);
		List<FacilitiesVO> list = facilityService.fcltsList(map);
		return new ResponseEntity<List<FacilitiesVO>>(list, HttpStatus.OK);
	}
	
	// 나의 예약현황으로 이동
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/my-reservation")
	public String myReservation(HttpSession session, Model model) {
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		
		List<FacilitiesVO> flctsRsvtList = facilityService.getFlctsRsvtList(std.getStdNo());
		List<LockerRsvtVO> lockerRsvtList = facilityService.getLockerRsvtList(std.getStdNo());
		
		model.addAttribute("flctsRsvtList", flctsRsvtList);
		model.addAttribute("lockerRsvtList", lockerRsvtList);
		model.addAttribute("std", vo);
		
		return "student/my-reservation";
	}
	
	// 예약테이블 리스트 가져오기
	@ResponseBody
	@GetMapping("/rsvt-list")
	public ResponseEntity<List<FacilitiesVO>> rsvtList(@RequestParam Map<String, Object> map){
		List<FacilitiesVO> list = facilityService.rsvtList(map);
		return new ResponseEntity<List<FacilitiesVO>>(list, HttpStatus.OK);
	}
	
	// 예약 신청하기
	@ResponseBody
	@PostMapping("/flcts-reservation")
	public String flctsReservation(@RequestBody FacilitiesVO vo) {
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setStdNo(users.getUsername());
		log.info("시설물 예약 : " + vo);
		
		ServiceResult result = facilityService.flctsReservation(vo);
		
		if(result.equals(ServiceResult.OK)) {
			return "success";
		}else {
			return "failed";
		}
		
	}
	
	// 사물함 사용취소
	@ResponseBody
	@DeleteMapping("/locker-cancle")
	public ResponseEntity<String> lockerCancle(@RequestBody LockerRsvtVO vo){
		log.info("브이오"  + vo);
		ServiceResult result = facilityService.lockerCancle(vo);
		
		if(result.equals(ServiceResult.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("faild", HttpStatus.OK);
		}
		
	}	
	// 시설물 예약취소
	@ResponseBody
	@DeleteMapping("/flcts-cancle/{flctsRsvtNo}")
	public ResponseEntity<String> flctsCancle(@PathVariable("flctsRsvtNo") String flctsRsvtNo){
		log.info("시설물 번호"  + flctsRsvtNo);
		ServiceResult result = facilityService.flctsCancle(flctsRsvtNo);
		
		if(result.equals(ServiceResult.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("faild", HttpStatus.OK);
		}
	}
}
