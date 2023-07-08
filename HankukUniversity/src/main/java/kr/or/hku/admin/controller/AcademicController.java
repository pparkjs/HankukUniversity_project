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

import kr.or.hku.admin.service.IAcademicAdm;
import kr.or.hku.admin.serviceImpl.AcademicAdmImpl;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.common.vo.SearchInfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/admin")
@Slf4j
public class AcademicController {
	
	@Autowired
	private AcademicAdmImpl academicAdmService;

	@GetMapping("/dept-administration")
	public String depAdministration(Model model) {
		log.info("dept-administration 실행~!");
		
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
		List<DepartmentVO> deptList = academicAdmService.selectDepartment(searchInfoVO);
		if(deptList != null && deptList.size() > 0) {
			entity = new ResponseEntity<List<DepartmentVO>>(deptList, HttpStatus.OK);
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
}
