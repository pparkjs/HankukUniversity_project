package kr.or.hku.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.service.ScholarshipService;
import kr.or.hku.admin.vo.ScholarshipAplyVO;
import kr.or.hku.admin.vo.ScholarshipVO;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.vo.AttachFileVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/admin")
@Slf4j
public class ScholarshipAdminController {

	@Autowired
	private ScholarshipService scholarshipService;
	
	@Autowired 
	private CommonFileService fileService;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/scholarship-info")
	public String scholarshipRegister(Model model) {
		List<ScholarshipVO> sclsList = scholarshipService.getSclsList();
		model.addAttribute("sclsList", sclsList);
		return "admin/sclsRegister";
	}
	
	@ResponseBody
	@PutMapping(value = "/scholarship-info")
	public int modifyScls(ScholarshipVO sclsVO) {
		log.info(sclsVO.toString());
		int res = scholarshipService.modifyScls(sclsVO);
		return res;
	}
	
	@ResponseBody
	@PostMapping(value = "/scholarship-info")
	public int insertScls(ScholarshipVO sclsVO) {
		log.info(sclsVO.toString());
		int res = scholarshipService.insertScls(sclsVO);
		return res;
	}
	
	@ResponseBody
	@DeleteMapping("/scholarship-info")
	public int deleteScls(@RequestBody Map<String, Object> map) {
		log.info("delete 전달 파라미터 > " + map.toString());
		int res = scholarshipService.deleteScls(map);
		return res;
	}
	
	//장학 신청 관리
	@GetMapping("/scholarship-aply-list")
	public String showScholarshipAplyList(Model model) {
		List<ScholarshipAplyVO> sclsAplyList = scholarshipService.getAllSclsAplyList();
		log.info("장학금신청 내역 가져오기"  + sclsAplyList.toString());
		model.addAttribute("sclsAplyList", sclsAplyList);
		return "admin/scholarshipAplyList";
	}
	
	@ResponseBody
	@GetMapping("/scholarship/SupportingFile-list/{atchFileNo}")
	public List<AttachFileVO> getSupportingFile(@PathVariable("atchFileNo") int atchFileNo){
		if (atchFileNo == 0) {
			return null;
		}
		log.info("파일 가져오기 => " + atchFileNo);
		List<AttachFileVO> fileList = fileService.getFileList(atchFileNo);
		return fileList;
	}
	
	@ResponseBody
	@PostMapping("/sclsAplyProccess")
	public String handleScholarshipApplicationOutcome(@RequestBody Map<String, String> map) {
		log.info("전달 파라미터 => " + map.toString());
		return scholarshipService.handleScholarshipApplicationOutcome(map);
	}
}
