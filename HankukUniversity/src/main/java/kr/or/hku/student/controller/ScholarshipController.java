package kr.or.hku.student.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.admin.vo.ScholarshipVO;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.student.service.StdScholarshipService;
import kr.or.hku.student.vo.SclsApPayVO;
import kr.or.hku.student.vo.StdScholarshipVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku")
public class ScholarshipController {
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private CommonFileService fileService;
	
	@Autowired
	private StdScholarshipService scholarshipService;

	@GetMapping("/scholarship-apply")
	public String scholarshipApply(HttpSession session, Model model) {
		log.info("scholarshipApply() 실행...!");
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		
		List<ScholarshipVO> scholarList = scholarshipService.selectScholarList();
		List<StdScholarshipVO> sclsAplyList = scholarshipService.selectSclsAplyList(vo.getStdNo());
		
		model.addAttribute("std", vo);
		model.addAttribute("scholarList", scholarList);
		model.addAttribute("sclsAplyList", sclsAplyList);
		return "student/scholarship-apply";
	}
	
	@GetMapping("/sclsAplyListSet")
	@ResponseBody
	public List<StdScholarshipVO> sclsAplyListSet(@RequestParam String stdNo){
		log.info("sclsAplyListSet 실행...!");
		log.info("stdNo : " + stdNo);
		
		List<StdScholarshipVO> sclsAplyList = scholarshipService.selectSclsAplyList(stdNo);
		
		return sclsAplyList;
	}
	
	@PostMapping("/sclsAplyInsert")
	@ResponseBody
	public String sclsAplyInsert(StdScholarshipVO sclsAplyVO) {
		log.info("sclsAplyInsert() 실행...!");
		log.info("sclsAplyVO : " + sclsAplyVO.toString());
		
//		String atchFileNo = commonService.get
		
		int status = scholarshipService.sclsAplyInsert(sclsAplyVO);
		
		if(status > 0) {
			return "SUCCESS";
		} else {
			return "FAILED";
		}
	}
	
	@GetMapping("/sclsAplyDetail")
	@ResponseBody
	public StdScholarshipVO sclsAplyDetail(@RequestParam String sclsapNo) {
		log.info("sclsAplyDetail() 실행...!");
		log.info("sclsapNo : " + sclsapNo);
		
		StdScholarshipVO sclsAplyDetail = scholarshipService.sclsAplyDetail(sclsapNo);
		log.info("sclsAplyDetail : " + sclsAplyDetail.toString());
		
		List<AttachFileVO> fileList = fileService.getFileList(Integer.parseInt(sclsAplyDetail.getAtchFileNo()));
		log.info("fileList : " + fileList.toString());
		
		sclsAplyDetail.setAplyDetailFiles(fileList);
		
		return sclsAplyDetail;
	}
	
	@PostMapping(value = "/sclsAplyModify")
	@ResponseBody
	public String sclsAplyModify(
			@RequestPart(value = "delFileInfoList", required = false) List<HashMap<String, String>> delFileInfoList,
			@RequestPart(value = "atchFileNo") HashMap<String, String> atchFileNoMap,
//			@RequestPart(value = "key") List<StdScholarshipVO> delFileInfoList,
			@RequestPart(value = "aplyFiles", required = false) List<MultipartFile> aplyFiles
			) {
		// StdScholarshipVO sclsAplyModiVO
//		log.info("delFileInfoList : " + sclsAplyModiVO.getDelFileInfoList().toString());
//		log.info("aplyFiles : " + sclsAplyModiVO.getAplyFiles().toString());
		
//		log.info("delFileInfoList : " + delFileInfoList.toString());
		log.info("atchFileNoMap : " + atchFileNoMap.toString());
//		log.info("aplyFiles : " + aplyFiles.toString());
		
		StdScholarshipVO sclsAplyModiVO = new StdScholarshipVO();
		sclsAplyModiVO.setDelFileInfoList(delFileInfoList);
		sclsAplyModiVO.setAplyFiles(aplyFiles);
		sclsAplyModiVO.setAtchFileNo(atchFileNoMap.get("atchFileNo"));
		
		int status = scholarshipService.sclsAplyModify(sclsAplyModiVO);
		if(status > 0) {
			return "SUCCESS";
		} else {
			return "FAILED";
		}
	}
	
	@DeleteMapping("/deleteSclsAply")
	@ResponseBody
	public String deleteSclsAply(@RequestBody HashMap<String, String> delData) {
		log.info("deleteSclsAply 실행...!");
		log.info("delData : " + delData.toString());
		
		int status = scholarshipService.deleteSclsAply(delData);
		if(status > 0) {
			return "SUCCESS";
		} else {
			return "FAILED";
		}
	}
	

	@GetMapping("/scholarship-list")
	public String scholarshipList(HttpSession session, Model model) {
		log.info("scholarshipList() 실행...!");
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		
		model.addAttribute("std", vo);
		return "student/scholarship-list";
	}
	
	@PostMapping("/selectSclsapPayList")
	@ResponseBody
	public List<SclsApPayVO> selectSclsapPayList(@RequestBody HashMap<String, String> sclsapPaySearchData){
		log.info("selectSclsapPayList() 실행...!");
		log.info("sclsapPaySearchData : " + sclsapPaySearchData.toString());
		
		List<SclsApPayVO> sclsApPayList = scholarshipService.selectSclsapPayList(sclsapPaySearchData);
		log.info("sclsApPayList : " + sclsApPayList.toString());
		return sclsApPayList;
	}
}
