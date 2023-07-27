package kr.or.hku.classroom.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.service.TestPresService;
import kr.or.hku.classroom.vo.StudentAnswerVO;
import kr.or.hku.classroom.vo.TestAnswerVO;
import kr.or.hku.classroom.vo.TestResultVO;
import kr.or.hku.classroom.vo.TestVO;
import kr.or.hku.common.controller.file.UploadFileUtils;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku")
public class testPresController {
	
	@Resource(name="uploadPath")
	private String resourcesPath;

	@Autowired
	private TestPresService testPresService;
	
	@PreAuthorize("hasRole('ROLE_PROFESSOR')") 
	@GetMapping("/test-presentation")
	public String testForm() {
		return "professor/test-form";
	}
	
	// 시험 출제
	@PreAuthorize("hasRole('ROLE_PROFESSOR')") 
	@PostMapping("/test-insert")
	public String testInsert(TestVO test, Model model, HttpSession session, RedirectAttributes redi) throws IOException {
		log.info("시험지 vo : " + test);
		
		// 시간 분해한 것
		TestVO testVO = testPresService.timeChange(test);
		
		MultipartFile file = testVO.getPdfFile(); // pdf파일 객체 가져옴
		
		if(file != null && file.getSize() > 0) {
			// 해당 경로에 uuid 이름으로 변경후 파일 복사 한다음 저장파일이름 가져오기
			String savedFileName = UploadFileUtils.uploadFileVer2(resourcesPath, file.getOriginalFilename(), file.getBytes());
			test.setTestFile(savedFileName); // DB에 해당 파일 이름 저장 위해 설정
			
			log.info("저장파일이름 : " + savedFileName);
			log.info("답안 리스트 : " + test.getAnswerList());
			
			ServiceResult result = testPresService.testInsert(test);
			
			if(result.equals(ServiceResult.EXIST)) {
				model.addAttribute("msg", "exist");
				model.addAttribute("test", testVO);
				model.addAttribute("cnt", testVO.getAnswerList().size());
				return "professor/test-form";
			}else if(result.equals(ServiceResult.OK)) {
				redi.addFlashAttribute("msg", "success");
				return "redirect:/hku/professor/classroomMain/"+testVO.getLecapNo();
			}else {
				model.addAttribute("msg", "failed");
				model.addAttribute("test", testVO);
				model.addAttribute("cnt", testVO.getAnswerList().size());
				return "professor/test-form";
			}
		}else {
			model.addAttribute("msg", "notFile");
			model.addAttribute("test", testVO);
			model.addAttribute("cnt", testVO.getAnswerList().size());
			return "professor/test-form";
		}
		
	}
	
	// 이미 출제한 시험이지 체크
	@ResponseBody
	@GetMapping("/testCheck")
	public String middleCheck(TestVO test) {
		int check = testPresService.testCheck(test);
		
		if(check > 0) {
			return "exist";
		}else {
			return "notexist";
		}
		
	}
	
	// 수정하기폼으로 이동
	@PreAuthorize("hasRole('ROLE_PROFESSOR')") 
	@GetMapping("/testUpdate")
	public String testUpdateForm(TestVO test, Model model) {
		log.info("시험!! : " + test);
		
		TestVO vo = testPresService.testDetail(test);
		
		log.info("시험지 상세 : " + vo);
		log.info("시험지 답안 : " + vo.getAnswerList());
		
		model.addAttribute("test", vo);
		model.addAttribute("type", "update");
		model.addAttribute("cnt", vo.getAnswerList().size());
		return "professor/test-form";
	}
	
	// 수정하기 처리
	@PreAuthorize("hasRole('ROLE_PROFESSOR')") 
	@PostMapping("/test-update")
	public String testUpdate(TestVO test, Model model, HttpSession session, RedirectAttributes redi) throws IOException {
		
		// 시간 분해한 것
		TestVO testVO = testPresService.timeChange(test);
		
		MultipartFile file = testVO.getPdfFile(); // pdf파일 객체 가져옴
		
		// 파일 객체 있는 경우만
		if(file != null && file.getSize() > 0) {
			// 해당 경로에 uuid 이름으로 변경후 파일 복사 한다음 저장파일이름 가져오기
			String savedFileName = UploadFileUtils.uploadFileVer2(resourcesPath, file.getOriginalFilename(), file.getBytes());
			testVO.setTestFile(savedFileName); // DB에 해당 파일 이름 저장 위해 설정
		}
		
		ServiceResult result = testPresService.testUpdate(testVO);
		
		if(result.equals(ServiceResult.OK)) {
			redi.addFlashAttribute("msg", "update-success");
			return "redirect:/hku/professor/classroomMain/"+testVO.getLecapNo();
		}else {
			model.addAttribute("msg", "update-failed");
			model.addAttribute("test", testVO);
			model.addAttribute("cnt", testVO.getAnswerList().size());
			model.addAttribute("type", "update");
			return "professor/test-form";
		}
	}
	
	// 응시과목 정보폼 이동
	@GetMapping("/test-info")
	public String testInfoForm() {
		return "student/test-info";
	}
	
	@ResponseBody
	@GetMapping("/getTestList")
	public List<TestVO> getTestList(String stdNo){
		List<TestVO> list = testPresService.getTestList(stdNo);
		return list;
	}
	
	// 시험에 응시 했는지 체크
	@ResponseBody
	@GetMapping("/preTest-check")
	public String preTestCheck(TestVO test) {
		int cnt = testPresService.preTestCheck(test);
		if(cnt > 0) {
			return "exist";
		}else {
			return "notExist";
		}
	}
	
	// 시험응시 시작
	@GetMapping("/open-test")
	public String openTest(TestVO test, Model model, HttpSession session, RedirectAttributes redi) {
		TestVO testVO = testPresService.timeChange(test);
		
		int cnt = testPresService.preTestCheck(test);
		if(cnt > 0) {
			redi.addFlashAttribute("msg", "exist");
			return "redirect:/hku/test-info";
		}else {
			// 시험 응시 버튼 클릭 시 시험 응시테이블에 삽입 (응시번호 selectKey로 가져옴)
			testPresService.testTakeInsert(test);
			
			int maxCh = testPresService.getMaxCh(test); // 선지의 최대 수 가져오기
			
			// 해당시험 답지 리스트 가져오기
			List<TestAnswerVO> list = testPresService.getAnswerList(test);
			
			log.info("ttNo : " + test.getTtNo());
			session.setAttribute("testVO", test); // 시험지 정보 세션에 담기
			session.setAttribute("ttNo", test.getTtNo());
			
			model.addAttribute("answerList", list);
			model.addAttribute("maxCh", maxCh);
			return "open-test";
		}
		
		
	}
	
	// 시험 답안 제출
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_STUDENT')") 
	@PostMapping("/studentAnswerInsert")
	public String studentAnswerInsert(@RequestBody List<StudentAnswerVO> studentAnsList, HttpSession session) {
		
		String result = "";
		TestVO test = (TestVO)session.getAttribute("testVO");
		int ttNo = (int)session.getAttribute("ttNo");
		
		log.info("세션테스트 : " + test);
		List<TestAnswerVO> answerList = testPresService.getAnswerList(test);
		
		log.info("모범답 : " + answerList);
		log.info("제출답 : " + studentAnsList);
		
		int scoreSum = 0;
		// 정답 체크
		for(int i = 0; i < answerList.size(); i++) {
			
			if(studentAnsList.size() <= i && studentAnsList.size() != answerList.size()) {
				result = "over";
				break;
			}
			
			if(answerList.get(i).getTaAns().equals(studentAnsList.get(i).getStaAns())) {
				scoreSum += answerList.get(i).getTaScr();
			}
		}
		log.info("총 점수 : " + scoreSum);
		
		for (StudentAnswerVO answer : studentAnsList) {
			answer.setLecapNo(test.getLecapNo());
			answer.setTestNo(test.getTestNo());
			answer.setTtNo(ttNo);
//			sAnsVO.setStaNo(answer.getStaNo());
//			sAnsVO.setStaAns(answer.getStaAns());
			
			testPresService.studentTestAnswerInsert(answer); //학생 답안 등록
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ttScr", scoreSum);
		map.put("ttNo", ttNo);
		int cnt = testPresService.scoreUpdate(map);
		
		if(result.equals("over")) {
			return result;
		}else {
			if(cnt > 0) {
				return "success";
			}else {
				return "failed";
			}
		}
		
	}
	
	@ResponseBody
	@GetMapping("/test-record")
	public TestResultVO testRecord(TestVO test) {
		
		TestResultVO result = new TestResultVO();
		
		// 응시번호 가져오기
		TestVO vo = testPresService.getTtNo(test);
		
		if(vo != null) {
			int ttNo = vo.getTtNo(); //응시번호
			
			// 해당시험 답지 리스트 가져오기
			List<TestAnswerVO> ansList = testPresService.getAnswerList(test);
			
			List<StudentAnswerVO> stuAnsList = testPresService.getStuAnsList(ttNo);
			
			int answerCnt = 0;
			int wrongCnt = 0;
			// 정답 체크
			for(int i = 0; i < ansList.size(); i++) {
				
				if(stuAnsList.size() <= i && stuAnsList.size() != ansList.size()) {
					log.info("틀린 개수 전 : " + wrongCnt);
					wrongCnt = ansList.size() - answerCnt ; // 만약 제한시간에 풀지 못한 답안일경우
					log.info("틀린 개수 후 : " + wrongCnt);
					break;
				}
				
				if(ansList.get(i).getTaAns().equals(stuAnsList.get(i).getStaAns())) {
					answerCnt++;
				}else {
					wrongCnt++;
				}
			}
			
			int examTotalScore = 0; // 총점
			for(int i = 0; i < ansList.size(); i++) {
				examTotalScore += ansList.get(i).getTaScr();
			}
			
			result.setExamTotalScore(examTotalScore);
			result.setAnswerCnt(answerCnt); //맞은개수
			result.setWrongCnt(wrongCnt); // 틀린개수
			result.setTaTotal(ansList.size());// 총 문제 수 
			result.setTestDate(test.getTestBgngYmd()); //시험일자 저장
			result.setTakeDate(vo.getTtDt()); //응시일자 저장
			result.setMyScore(vo.getTtScr()); // 나의점수 저장
			
			log.info("여기 시험결과 있어요 : " + result);
		}
		return result;
	}
	
}
