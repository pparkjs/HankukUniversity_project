package kr.or.hku.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.service.ClassCancelledService;
import kr.or.hku.admin.vo.StudentVO;
import kr.or.hku.admin.vo.SubjectCancelVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/admin")
public class ClassCancelledAdminController {

	@Autowired
	private ClassCancelledService classCancelledService;
	
	@GetMapping("/lecture-canceled/management")
	public String lectureCanceledManagement(Model model) {
		// 휴강신청 목록 가져오기
		List<SubjectCancelVO> lecCancelList = classCancelledService.getClassCancelledList();
		log.info("모델에 담을 데이터" + lecCancelList.toString());
		model.addAttribute("lecCancelList", lecCancelList);
		return "admin/lecCanceledManagement";
	}
	
	@ResponseBody
	@GetMapping("/student-in-lecture")
	public List<StudentVO> getStdInLecture(@RequestParam Map<String, String> map){
		List<StudentVO> lecInStdList = classCancelledService.getStdInLecture(map);
		return lecInStdList;
	}
}
