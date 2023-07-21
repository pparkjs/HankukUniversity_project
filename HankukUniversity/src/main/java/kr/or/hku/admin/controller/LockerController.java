package kr.or.hku.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.service.LockerService;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.common.vo.SearchInfoVO;
import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku/admin")
public class LockerController {
	@Autowired
	private LockerService lockerService;

	@GetMapping("/locker-administration")
	public String locker(Model model) {
		log.info("locker-administration 실행...!");
		List<FacilityVO> lockerFlctList = lockerService.getFlctList();
		
		model.addAttribute("flctList",lockerFlctList);
		
		return "admin/locker-administration";
	}
	
	@GetMapping("/floorSet")
	@ResponseBody
	public ResponseEntity<List<String>> floorSet(String flctNo){
		log.info("floorSet 실행...!");
		log.info("flctNo : " + flctNo);
		List<String> floorList = lockerService.floorSet(flctNo);
		log.info("floorList : " + floorList.toString());
		
		return new ResponseEntity<List<String>>(floorList, HttpStatus.OK);
//		return null;
	}
	
	@PostMapping("lockerList")
	@ResponseBody
	public ResponseEntity<List<LockerVO>> lockerList(@RequestBody HashMap<String, String> searchData){
		log.info("lockerList 실행...!");
		String flctNo = searchData.get("flctNo");
		String floor = searchData.get("floor");
		String avlCd = searchData.get("avlCd");
		log.info("flctNo : "+flctNo);
		log.info("floor : "+floor);
		log.info("avlCd : "+avlCd);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(flctNo)) {
			searchInfoVO.setFlctNo(flctNo);
		}
		if(StringUtils.isNotBlank(floor)) {
			searchInfoVO.setFloor(floor);
		}
		if(StringUtils.isNotBlank(avlCd)) {
			searchInfoVO.setAvlCd(avlCd);
		}
		
		List<LockerVO> lockerList = lockerService.selectLockers(searchInfoVO);
		log.info("lockerList : " + lockerList);
		log.info("lockerList 사이즈 : " + lockerList.size());
		
		return new ResponseEntity<List<LockerVO>>(lockerList, HttpStatus.OK);
	}
	
	@PostMapping("lockerRsvtList")
	@ResponseBody
	public ResponseEntity<List<LockerRsvtVO>> lockerRsvtList(@RequestBody HashMap<String, String> searchData){
		log.info("lockerRsvtList 실행...!");
		String flctNo = searchData.get("flctNo");
		String floor = searchData.get("floor");
		String lockerYr = searchData.get("lockerYr");
		String rsvtSem = searchData.get("rsvtSem");
		String avlCd = searchData.get("avlCd");
		String stdNo = searchData.get("stdNo");
		
		log.info("flctNo : "+flctNo);
		log.info("floor : "+floor);
		log.info("avlCd : "+avlCd);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(flctNo)) {
			searchInfoVO.setFlctNo(flctNo);
		}
		if(StringUtils.isNotBlank(floor)) {
			searchInfoVO.setFloor(floor);
		}
		if(StringUtils.isNotBlank(lockerYr)) {
			searchInfoVO.setLockerYr(lockerYr);
		}
		if(StringUtils.isNotBlank(rsvtSem)) {
			searchInfoVO.setRsvtSem(rsvtSem);
		}
		if(StringUtils.isNotBlank(avlCd)) {
			searchInfoVO.setAvlCd(avlCd);
		}
		if(StringUtils.isNotBlank(stdNo)) {	/////
			searchInfoVO.setStdNo(stdNo);
		}
		
		List<LockerRsvtVO> lockerRsvtList = lockerService.selectLockerRsvts(searchInfoVO);
		log.info("lockerList : " + lockerRsvtList);
		log.info("lockerList 사이즈 : " + lockerRsvtList.size());
		
		return new ResponseEntity<List<LockerRsvtVO>>(lockerRsvtList, HttpStatus.OK);
	}
	
	@PostMapping("/lockerInsert")
	@ResponseBody
	public ResponseEntity<String> lockerInsert(@RequestBody HashMap<String, String> insertLockerData){
		ResponseEntity<String> entity = null;
		log.info("insertLockerData : " + insertLockerData.toString());
		String flctNo = insertLockerData.get("flctNo");
		int floor = Integer.parseInt(insertLockerData.get("floor"));
		int count = Integer.parseInt(insertLockerData.get("lockerInsertCount"));
		
		LockerVO lockerVO = new LockerVO();
		lockerVO.setFlctNo(flctNo);
		lockerVO.setFloor(floor);
		
		int status = 1;
		for(int i=1; i<=count; i++) {
			status = lockerService.insertLocker(lockerVO);
		}
		
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@DeleteMapping("/deleteLocker")
	@ResponseBody
	public ResponseEntity<String> deleteLocker(@RequestBody List<HashMap<String, String>> delLockerList){
		ResponseEntity<String> entity = null;
		int successFlag = 1;
		
		for(int i=0; i<delLockerList.size(); i++) {
			HashMap<String, String> delLocker = delLockerList.get(i);
			int status = lockerService.deleteLocker(delLocker);
			if(status == 0) {
				successFlag = 0;
			}
		}
		
		if(successFlag == 1) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@PostMapping("/btnSwitch")
	@ResponseBody
	public ResponseEntity<String> btnSwitch(@RequestBody HashMap<String, String> kywData){
		ResponseEntity<String> entity = null;
		log.info("kywData : " + kywData.toString());
		int status = lockerService.btnSwitch(kywData);
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		return entity;
		
	}
	
	@PostMapping("/rsvtBtnSwitch")
	@ResponseBody
	public ResponseEntity<String> rsvtBtnSwitch(@RequestBody HashMap<String, String> kywkywData){
		ResponseEntity<String> entity = null;
		log.info("kywkywData : " + kywkywData.toString());
		int status = lockerService.rsvtBtnSwitch(kywkywData);
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		return entity;
		
	}
}
