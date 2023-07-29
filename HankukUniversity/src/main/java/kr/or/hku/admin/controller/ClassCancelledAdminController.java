package kr.or.hku.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.service.ClassCancelledService;
import kr.or.hku.admin.vo.StudentVO;
import kr.or.hku.admin.vo.SubjectCancelVO;
import kr.or.hku.common.service.CommonSMSService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/admin")
public class ClassCancelledAdminController {

	@Autowired
	private ClassCancelledService classCancelledService;
	
	@Autowired
	private CommonSMSService smsService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/lecture-canceled/management")
	public String lectureCanceledManagement(Model model) {
		// 휴강신청 목록 가져오기
		List<SubjectCancelVO> lecCancelList = classCancelledService.getClassCancelledList();
		List<Map<String, String>> msgMap = classCancelledService.getTextDetail();
		log.info("모델에 담을 데이터" + lecCancelList.toString());
		log.info("모델에 담을 데이터 22" + msgMap.toString());
		model.addAttribute("lecCancelList", lecCancelList);
		model.addAttribute("msgMap", msgMap);
		return "admin/lecCanceledManagement";
	}
	
	@ResponseBody
	@GetMapping("/student-in-lecture")
	public List<StudentVO> getStdInLecture(@RequestParam Map<String, String> map){
		List<StudentVO> lecInStdList = classCancelledService.getStdInLecture(map);
		return lecInStdList;
	}
	
	@ResponseBody
	@PostMapping("/lec-cancel-TextMsg-spread")
	public String lecCancelTextMsgSpread(@RequestBody Map<String, Object> dataMap) {
		ServiceResult res = null;
		log.info("전송 데이터 시작 ================================");
		// 첫번쨰 학생들을 뽑고
		log.info("학생들 => " +  dataMap.get("stdList").toString());
		// 여기서 내용과 휴강신청 번호를 꺼낸다.
		log.info("내용  => " +  dataMap.get("content").toString());
		log.info("전송 데이터 시작 ================================");
		List<Map<String, String>> dataMapList = (List<Map<String, String>>) dataMap.get("stdList");
		Map<String, String> cnMap = (Map<String, String>)dataMap.get("content");
		if (dataMapList != null && dataMapList.size() > 0) {
			res = smsService.sendMsgToStudents(dataMapList, cnMap.get("msg"));
		}
		String msg = "";
		if (res.equals(ServiceResult.OK)) {
			classCancelledService.calcelProccess(cnMap.get("subclNo"));
			msg = "success";
		}else {
			msg = "failed";
		}
		
		return msg;
	}
}
