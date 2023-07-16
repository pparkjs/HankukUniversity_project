package kr.or.hku.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.service.ScholarshipService;
import kr.or.hku.admin.vo.ScholarshipVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/admin")
@Slf4j
public class ScholarshipAdminController {

	@Autowired
	private ScholarshipService scholarshipService;

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
}
