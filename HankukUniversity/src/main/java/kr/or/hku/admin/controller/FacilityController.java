package kr.or.hku.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.service.FacilityManageService;
import kr.or.hku.admin.vo.FacilitiesVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.admin.vo.FlctFloorVO;
import kr.or.hku.admin.vo.NextCodeVO;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.common.vo.SearchInfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku/admin")
public class FacilityController {

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private FacilityManageService fcltService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/facility-administration")
	public String facility(Model model) {
		log.info("facility() 실행...!");
		
		List<CommonVO> commonList = commonService.getAllCommonData();
		
		model.addAttribute("commonList",commonList);
		return "admin/facility-administration";
	}
	
	@PostMapping("/fcltList")
	@ResponseBody
	public ResponseEntity<List<FacilityVO>> fcltList(
			@RequestBody HashMap<String, String> searchData
			){
		String searchType = searchData.get("searchType");
		String searchWord = searchData.get("searchWord");
		log.info("searchType : " + searchType);
		log.info("searchWord : " + searchWord);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(searchWord)) {
			searchInfoVO.setSearchType(searchType);
			searchInfoVO.setSearchWord(searchWord);
		}
		
		List<FacilityVO> fcltList = fcltService.selectFcltList(searchInfoVO);
		log.info("fcltList : " + fcltList.toString());
		return new ResponseEntity<List<FacilityVO>>(fcltList, HttpStatus.OK);
		
	}
	@PostMapping("/fcltsList")
	@ResponseBody
	public ResponseEntity<List<FacilitiesVO>> fcltsList(
			@RequestBody HashMap<String, String> searchData
			){
		String searchType = searchData.get("searchType");
		String searchWord = searchData.get("searchWord");
		log.info("searchType : " + searchType);
		log.info("searchWord : " + searchWord);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(searchWord)) {
			searchInfoVO.setSearchType(searchType);
			searchInfoVO.setSearchWord(searchWord);
		}
		
		List<FacilitiesVO> fcltsList = fcltService.selectFcltsList(searchInfoVO);
		log.info("fcltsList : " + fcltsList.toString());
		return new ResponseEntity<List<FacilitiesVO>>(fcltsList, HttpStatus.OK);
		
	}
	
	@PostMapping("/fcltRsvList")
	@ResponseBody
	public ResponseEntity<List<FacilitiesVO>> fcltRsvList(
			@RequestBody HashMap<String, String> searchData
			){
		String searchType = searchData.get("searchType");
		String searchWord = searchData.get("searchWord");
		log.info("searchType : " + searchType);
		log.info("searchWord : " + searchWord);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(searchWord)) {
			searchInfoVO.setSearchType(searchType);
			searchInfoVO.setSearchWord(searchWord);
		}
		
		List<FacilitiesVO> fcltRsvList = fcltService.selectFcltRsvList(searchInfoVO);
		log.info("fcltRsvList : " + fcltRsvList.toString());
		return new ResponseEntity<List<FacilitiesVO>>(fcltRsvList, HttpStatus.OK);
		
	}
	
	@GetMapping("/flctNoSet")
	@ResponseBody
	public ResponseEntity<String> flctNoSet(){
		NextCodeVO nextCode = fcltService.flctNoSet();
		log.info(nextCode.toString());
		
		return new ResponseEntity<String>(nextCode.getNextCode(), HttpStatus.OK);
	}
	
	@PostMapping("/flctInsert")
	@ResponseBody
	public ResponseEntity<String> flctInsert(@RequestBody FacilityVO flctVO){
		ResponseEntity<String> entity = null;
		int successFlag = 1;
		
		log.info("flctVO : " + flctVO.toString());
		
		int status = fcltService.flctInsert(flctVO);
		if(status == 0) {
			successFlag = 0;
		}
		if(flctVO.getFlctClsfCd().equals("clsf01")) {
			int maxFloor = flctVO.getFloor();
			FlctFloorVO flctFloorVO = new FlctFloorVO();
			flctFloorVO.setFlctNo(flctVO.getFlctNo());
			for(int i=1; i<=maxFloor; i++) {
				flctFloorVO.setFloor(i);
				int floorStatus = fcltService.insertFloor(flctFloorVO);
				
				if(floorStatus == 0) {
					successFlag = 0;
				}
			}
		}
		log.info("status : " + status);
		if(successFlag > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@DeleteMapping("/deleteFlct")
	@ResponseBody
	public ResponseEntity<String> deleteFlct(@RequestBody List<FacilityVO> delFlctList){
		ResponseEntity<String> entity = null;
		int successFlag = 1;
		
//		log.info("deptDelete() 실행...!");
//		log.info("delDeptArr : "+delDeptArr);
		
		for(int i=0; i<delFlctList.size(); i++) {
//			log.info(delFlctArr.get(i));
			FacilityVO flctVO = delFlctList.get(i);
			String flctClsfCd = flctVO.getFlctClsfCd();
			if(flctClsfCd.equals("clsf01")) {
				int delFloorStatus = fcltService.deleteFloor(flctVO.getFlctNo());
				if(delFloorStatus == 0) {
					successFlag = 0;
				}
			}
			int status = fcltService.deleteFlct(flctVO.getFlctNo());
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
	
	@GetMapping("/selectFlct")
	@ResponseBody
	public ResponseEntity<FacilityVO> selectFlct(String flctNo){
		ResponseEntity<FacilityVO> entity = null;
		log.info("flctNo : " + flctNo);
		
		FacilityVO flctVO = fcltService.selectFlct(flctNo);
		log.info("flctVO : " + flctVO.toString());
		entity = new ResponseEntity<FacilityVO>(flctVO, HttpStatus.OK);
		
		return entity;
	}
	
	@PutMapping("/flctModify")
	@ResponseBody
	public ResponseEntity<String> updateFlct(@RequestBody FacilityVO flctVO){
		ResponseEntity<String> entity = null;
		log.info("수정 flctVO : " + flctVO.toString());
		int status = fcltService.updateFlct(flctVO);
		
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
	
	@GetMapping("/flctsModalSelectBoxSet")
	public ResponseEntity<List<FacilityVO>> flctsModalSelectBoxSet() {
		List<FacilityVO> flctList = fcltService.flctsModalSelectBoxSet();
		
		return new ResponseEntity<List<FacilityVO>>(flctList, HttpStatus.OK);
	}
	
	@GetMapping("/flctsNoSet")
	public ResponseEntity<String> flctsNoSet(){
		NextCodeVO nextCode = fcltService.flctsNoSet();
		log.info(nextCode.toString());
		
		return new ResponseEntity<String>(nextCode.getNextCode(), HttpStatus.OK);
	}
	
	@PostMapping("/flctsInsert")
	@ResponseBody
	public ResponseEntity<String> flctsInsert(@RequestBody FacilitiesVO flctsVO){
		ResponseEntity<String> entity = null;
//		log.info("flctsVO : " + flctsVO.toString());
		
		int status = fcltService.flctsInsert(flctsVO);
		
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@DeleteMapping("/deleteFlcts")
	@ResponseBody
	public ResponseEntity<String> deleteFlcts(@RequestBody List<String> delFlctsList){
		ResponseEntity<String> entity = null;
		int successFlag = 1;
		
		for(int i=0; i<delFlctsList.size(); i++) {
			String flctsNo = delFlctsList.get(i);
			int status = fcltService.deleteFlcts(flctsNo);
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
	
	@GetMapping("/selectFlcts")
	@ResponseBody
	public ResponseEntity<FacilitiesVO> selectFlcts(String flctsNo){
		ResponseEntity<FacilitiesVO> entity = null;
		log.info("flctsNo : " + flctsNo);
		
		FacilitiesVO flctsVO = fcltService.selectFlcts(flctsNo);
		log.info("flctsVO : " + flctsVO.toString());
		entity = new ResponseEntity<FacilitiesVO>(flctsVO, HttpStatus.OK);
		
		return entity;
	}
	
	@PutMapping("/flctsModify")
	@ResponseBody
	public ResponseEntity<String> updateFlcts(@RequestBody FacilitiesVO flctsVO){
		ResponseEntity<String> entity = null;
		log.info("수정 flctsVO : " + flctsVO.toString());
		int status = fcltService.updateFlcts(flctsVO);
		
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
	
	@DeleteMapping("/deleteFlctsRsvt")
	@ResponseBody
	public ResponseEntity<String> deleteFlctsRsvt(@RequestBody List<String> delFlctsRsvtList){
		ResponseEntity<String> entity = null;
		int successFlag = 1;
		
		for(int i=0; i<delFlctsRsvtList.size(); i++) {
			String flctsRsvtNo = delFlctsRsvtList.get(i);
			int status = fcltService.deleteFlctsRsvt(flctsRsvtNo);
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
}
