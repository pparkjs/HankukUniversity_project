package kr.or.hku.classroom.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.service.TestPresService;
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
	
	@GetMapping("/test-presentation")
	public String testForm() {
		return "professor/test-form";
	}
	
	// 시험 출제
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
	
}
