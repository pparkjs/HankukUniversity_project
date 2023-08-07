package kr.or.hku.classroom.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
   // 서버단에서 pdf파일인지 체크!
   @ResponseBody
   @PostMapping(value="/pdfCheck", produces="text/plain; charset=utf-8")
    public String uploadFile(MultipartFile file) {
        if (isPdfFile(file)) {
            // 파일이 PDF인 경우 처리
            return "success";
        } else {
            // 파일이 PDF가 아닌 경우 에러 처리
            return "error";
        }
    }

   // pdf파일인지 체크하는 메소드
    private boolean isPdfFile(MultipartFile file ) {
        String originalFilename = file.getOriginalFilename();
        if (originalFilename != null) {
            String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
            return "pdf".equals(ext);
        }
        return false;
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
	public String testUpdateForm(TestVO test, Model model, RedirectAttributes ra) {
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		TestVO vo = testPresService.testDetail(test);
		
		// 해당 시험수정 폼이 출제한 교수가 아니면 접근 불가
		if(vo.getProNo().equals(users.getUsername())) {
			log.info("시험지 상세 : " + vo);
			log.info("시험지 답안 : " + vo.getAnswerList());
			
			model.addAttribute("test", vo);
			model.addAttribute("type", "update");
			model.addAttribute("cnt", vo.getAnswerList().size());
			return "professor/test-form";
		}else {
			ra.addFlashAttribute("authErr", "1");
			return "redirect:/main/login";
		}
		
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
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/test-info")
	public String testInfoForm() {
		return "student/test-info";
	}
	
	@ResponseBody
	@GetMapping("/getTestList")
	public List<TestVO> getTestList(){
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<TestVO> list = testPresService.getTestList(users.getUsername());
		return list;
	}
	
	// 시험에 응시 했는지 체크
	@ResponseBody
	@GetMapping("/preTest-check")
	public String preTestCheck(TestVO test) {
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		test.setStdNo(users.getUsername());
		int cnt = testPresService.preTestCheck(test);
		if(cnt > 0) {
			return "exist";
		}else {
			return "notExist";
		}
	}
	
	// 시험응시 시작
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/open-test")
	public String openTest(TestVO test, Model model, HttpSession session, RedirectAttributes redi) {
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		test.setStdNo(users.getUsername());
		
		int cnt = testPresService.preTestCheck(test);
		if(cnt > 0) {
			redi.addFlashAttribute("msg", "exist");
			return "redirect:/hku/test-info";
		}else {
			// 시험 응시 버튼 클릭 시 시험 응시테이블에 삽입 (응시번호 selectKey로 가져옴)
			testPresService.testTakeInsert(test);
			
			int maxCh = testPresService.getMaxCh(test); // 선지의 최대 수 가져오기
			
			// 해당시험 답지 리스트만 가져오기
			List<TestAnswerVO> list = testPresService.getAnswerList2(test);
			
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
		
		TestVO test = (TestVO)session.getAttribute("testVO");
		int ttNo = (int)session.getAttribute("ttNo");
		
		test.setTtNo(ttNo);
		
		log.info("세션테스트 : " + test);
	
		// 답안 리스트 가져옴과 동시에 답안 계산 후 등록
		String result = testPresService.getAnswerList(test, studentAnsList);

		return result;
	}
	
	// 응시내역 확인
	@ResponseBody
	@GetMapping("/test-record")
	public TestResultVO testRecord(TestVO test) {
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		test.setStdNo(users.getUsername());
		
		// 응시내역보기 위해 서비스 로직에서 응시내역에 필요한 계산 해서 가져오기
		TestResultVO result = testPresService.getTtNo(test);

		return result;
	}
	
}
