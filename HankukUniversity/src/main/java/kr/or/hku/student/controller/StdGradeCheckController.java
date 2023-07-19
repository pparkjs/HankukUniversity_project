package kr.or.hku.student.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
import kr.or.hku.lectureInfo.vo.CourseRegistVO;
import kr.or.hku.login.service.ILoginService;
import kr.or.hku.student.service.StdGradeCheckService;
import kr.or.hku.student.vo.DepartmentCrtrVO;
import kr.or.hku.student.vo.EvaluationVO;
import kr.or.hku.student.vo.StudentInfoVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/student")
@Slf4j
public class StdGradeCheckController {
	@Autowired
	private StdGradeCheckService gradeCheckService;

	@GetMapping("/subject-grade")
	public String goCheckPage(HttpSession session, Model model) {
		StudentVO stdVO = (StudentVO) session.getAttribute("std");
		Map<String, List<?>> map = gradeCheckService.getGradeInfo(stdVO.getStdNo());
		model.addAttribute("map", map);

		return "student/stdGradeCheck";
	}

	@ResponseBody
	@PostMapping("/submitObjec")
	public String submitobjections(CourseRegistVO courseVO) {
		log.info("lecapNO", courseVO.getLecapNo());
		log.info("content", courseVO.getGrdDmrCn());
		log.info("getStdNo", courseVO.getStdNo());
		log.info("getLecapNo", courseVO.getLecapNo());

		String result = "";
		ServiceResult sResult = gradeCheckService.submitobjections(courseVO);
		if (sResult.equals(ServiceResult.OK)) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

	@PostMapping("/insertEvaluation")
	@ResponseBody
	public ServiceResult insertEvaluation(EvaluationVO evalVO) {
		ServiceResult result;
		result = gradeCheckService.insertEvaluation(evalVO);

		return result;
	}

	@GetMapping("/all-grade")
	public String goAllGradePage(HttpSession session, Model model) {
		StudentVO stdVO = (StudentVO) session.getAttribute("std");
		DepartmentCrtrVO crtrVO = gradeCheckService.getDeptCrtr(stdVO.getDeptCd());
		Map<String, List<?>> map = gradeCheckService.getAllGradeInfo(stdVO.getStdNo());
		model.addAttribute("crtrVO", crtrVO);
		model.addAttribute("map", map);
		return "student/allStdGradeCheck";
	}
	
	@ResponseBody
	@PostMapping("/getAllgrade")
	public List<CourseRegistVO> getAllgrade(@RequestBody Map<String,String> mymap){
		log.info("전달 파라미터==> " + mymap.toString());
		List<CourseRegistVO> list = gradeCheckService.getAllgrade(mymap);
		return list;
	}
	

}
