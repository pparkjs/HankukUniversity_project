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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.service.AcademicAdm;
import kr.or.hku.admin.vo.CollegeVO;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.admin.vo.NextCodeVO;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.common.vo.SearchInfoVO;
import kr.or.hku.lectureInfo.service.CourseInfoService;
import kr.or.hku.lectureInfo.vo.SubjectVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/admin")
@Slf4j
public class AcademicController {
	
	@Autowired
	private AcademicAdm academicAdmService;
	
	@Autowired
	private CourseInfoService courseService;
	
	@Autowired
	private CommonService commonService;

	@GetMapping("/dept-administration")
	public String deptAdministration(Model model) {
		log.info("dept-administration 실행~!");
		
		List<CollegeVO> colList = academicAdmService.colList();
		List<FacilityVO> flctList = academicAdmService.flctList();
		log.info(colList.toString());
		log.info(flctList.toString());
		model.addAttribute("colList",colList);
		model.addAttribute("flctList",flctList);
		
		return "admin/dept-administration";
	}
	
	@PostMapping("/dept-list")
	@ResponseBody
	public ResponseEntity<List<DepartmentVO>> deptList(
			@RequestBody HashMap<String, String> searchData,
			Model model) {
		String searchType = searchData.get("searchType");
		String searchWord = searchData.get("searchWord");
		
		log.info("dept-list 실행~!");
		log.info("searchType"+searchType);
		log.info("searchWord"+searchWord);
		
		ResponseEntity<List<DepartmentVO>> entity = null;
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(searchWord)) {
			searchInfoVO.setSearchType(searchType);
			searchInfoVO.setSearchWord(searchWord);
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchWord",searchWord);
		}
		log.info("1"+searchInfoVO.getSearchType());
		log.info("2"+searchInfoVO.getSearchWord());
		List<DepartmentVO> deptList = academicAdmService.selectDeptList(searchInfoVO);
		if(deptList != null && deptList.size() > 0) {
			entity = new ResponseEntity<List<DepartmentVO>>(deptList, HttpStatus.OK);
		}
		return entity; 
	}
	
	@GetMapping("/deptCdSet")
	public ResponseEntity<String> deptCdSet(){
		ResponseEntity<String> entity = null;
		NextCodeVO nextCode = academicAdmService.deptCdSet();
		log.info(nextCode.toString());
		entity = new ResponseEntity<String>(nextCode.getNextCode(), HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/dept-select")
	public ResponseEntity<DepartmentVO> selectDept(String deptCd){
		ResponseEntity<DepartmentVO> entity = null;
		log.info("deptCd : " + deptCd);
		DepartmentVO deptVO = academicAdmService.selectDept(deptCd);
		log.info(deptVO.toString());
		entity = new ResponseEntity<DepartmentVO>(deptVO, HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("/dept-administration")
	@ResponseBody
	public ResponseEntity<String> insertDept(@RequestBody DepartmentVO deptVO){
		ResponseEntity<String> entity = null;
		log.info(deptVO.toString());
		int status = academicAdmService.insertDept(deptVO);
		log.info("insert status : " + status);
		
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@DeleteMapping("/dept-administration")
	@ResponseBody
	public ResponseEntity<String> deptDelete(
			@RequestBody List<String> delDeptArr
			){
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		int successFlag = 1;
		
//		log.info("deptDelete() 실행...!");
//		log.info("delDeptArr : "+delDeptArr);
		
		for(int i=0; i<delDeptArr.size(); i++) {
			log.info(delDeptArr.get(i));
			String deptCd = delDeptArr.get(i);
			int status = academicAdmService.deleteDept(deptCd);
			if(status == 0) {
				successFlag = 0;
			}
		}
		
		if(successFlag == 0) {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
	
	@PostMapping("/dept-update")
	@ResponseBody
	public ResponseEntity<String> deptUpdate(@RequestBody DepartmentVO deptVO){
		ResponseEntity<String> entity = null;
		log.info(deptVO.toString());
		int status = academicAdmService.updateDept(deptVO);
		log.info("updateStatus : " + status);
		
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@GetMapping("/subject-administration")
	public String lecAdministration(Model model) {
//		List<DepartmentVO> deptList = academicAdmService.deptList();
		List<CommonVO> commonList = commonService.getAllCommonData();
		List<DepartmentVO> deptList = courseService.getAllDept();
		
		model.addAttribute("commonList",commonList);
		model.addAttribute("deptList",deptList);
		
		return "admin/subject-administration";
	}
	
	@PostMapping("/subject-list")
	@ResponseBody
	public ResponseEntity<List<SubjectVO>> subjectList(
			@RequestBody HashMap<String, String> searchData,
			Model model
			){
		ResponseEntity<List<SubjectVO>> entity = null;
		
//		String searchType = searchData.get("searchType");
//		String searchWord = searchData.get("searchWord");
		
		String comCdNm = searchData.get("comCdNm");
		String deptNm = searchData.get("deptNm");
		String subGrade = searchData.get("subGrade");
		String subNm = searchData.get("subNm");
		
		log.info("subject-list 실행~!");
//		log.info("searchType"+searchType);
//		log.info("searchWord"+searchWord);
		log.info("comCdNm : "+comCdNm);
		log.info("deptNm : "+deptNm);
		log.info("subGrade : "+subGrade);
		log.info("subNm : "+subNm);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(comCdNm)) {
			searchInfoVO.setComCdNm(comCdNm);
		}
		if(StringUtils.isNotBlank(deptNm)) {
			searchInfoVO.setDeptNm(deptNm);
		}
		if(StringUtils.isNotBlank(subGrade)) {
			searchInfoVO.setSubGrade(subGrade);
		}
		if(StringUtils.isNotBlank(subNm)) {
			searchInfoVO.setSubNm(subNm);
		}
		log.info("1"+searchInfoVO.getComCdNm());
		log.info("2"+searchInfoVO.getDeptNm());
		log.info("3"+searchInfoVO.getSubGrade());
		log.info("4"+searchInfoVO.getSubNm());
		
		List<SubjectVO> subjectList = academicAdmService.selectSubjectList(searchInfoVO);
		if(subjectList != null && subjectList.size() > 0) {
			entity = new ResponseEntity<List<SubjectVO>>(subjectList, HttpStatus.OK);
		}
		
		return entity;
	}
	
	@GetMapping("/subNoSet")
	public ResponseEntity<String> subNoSet(){
		ResponseEntity<String> entity = null;
		NextCodeVO nextCode = academicAdmService.subNoSet();
		log.info(nextCode.toString());
		entity = new ResponseEntity<String>(nextCode.getNextCode(), HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/subject-administration")
	@ResponseBody
	public ResponseEntity<String> insertSubject(@RequestBody SubjectVO subjectVO){
		ResponseEntity<String> entity = null;
		log.info("insertSubject() 실행...!");
//		log.info("체킁!!  " + subjectVO.toString());
		
		int status = academicAdmService.insertSubject(subjectVO);
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
	
	@DeleteMapping("/subject-administration")
	@ResponseBody
	public ResponseEntity<String> deleteSubject(
			@RequestBody List<String> delSubjectArr
			){
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		int successFlag = 1;
		
//		log.info("deleteSubject() 실행...!");
//		log.info("delSubjectArr : "+delSubjectArr);
		
		for(int i=0; i<delSubjectArr.size(); i++) {
			log.info(delSubjectArr.get(i));
			String subNo = delSubjectArr.get(i);
			int status = academicAdmService.deleteSubject(subNo);
			if(status == 0) {
				successFlag = 0;
			}
		}
		
		if(successFlag == 0) {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
	
	@GetMapping("/subject-select")
	public ResponseEntity<SubjectVO> selectSubject(String subNo){
		ResponseEntity<SubjectVO> entity = null;
		log.info("subNo : " + subNo);
		SubjectVO subjectVO = academicAdmService.selectSubject(subNo);
		log.info(subjectVO.toString());
		
		entity = new ResponseEntity<SubjectVO>(subjectVO, HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("/subject-update")
	@ResponseBody
	public ResponseEntity<String> updateSubject(@RequestBody SubjectVO subjectVO){
		ResponseEntity<String> entity = null;
		log.info(subjectVO.toString());
		int status = academicAdmService.updateSubject(subjectVO);
		log.info("updateStatus : " + status);
		
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
}
