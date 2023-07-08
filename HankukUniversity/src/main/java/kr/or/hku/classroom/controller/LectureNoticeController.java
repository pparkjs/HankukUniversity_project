package kr.or.hku.classroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.classroom.vo.LectureNoticeVO;

@Controller
@RequestMapping("/hku/professor")
public class LectureNoticeController {
	
//	@GetMapping("/noticeList")
//	public String noticeList() {
//		return "professor/lectureNoticeList";
//	}
	
//	@GetMapping("/boardDetail")
//	public String boardDetail(int lecntNo) {
//		return "professor/boardDetail";
//	}
	
	@PostMapping("/form")
	public String insertBoard(LectureNoticeVO noticeVO){
		return "professor/lectureNoticeForm";
	}
}
