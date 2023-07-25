package kr.or.hku.classroom.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.hku.classroom.service.LectureNoticeService;
import kr.or.hku.classroom.vo.LectureNoticeVO;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.notice.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/professor")
@Slf4j
public class LectureNoticeController {

	@Autowired
	private LectureNoticeService noticeService;

	@Autowired
	private CommonFileService fileService;

	//교수클래스룸 공지리스트 출력
	@GetMapping("/noticeList")
	public String noticeList(HttpSession session, Model model) {
		String lecapNo = session.getAttribute("lecapNo").toString();
		List<LectureNoticeVO> noticeList = noticeService.getNoticeList(lecapNo);
		model.addAttribute("noticeList", noticeList);
		return "professor/lectureNoticeList";
	}
	//교수클래스룸 공지상세 페이지
	@GetMapping("/detailNotice/{lecntNo}")
	public String detailNotice(@PathVariable int lecntNo,Model model) {
		LectureNoticeVO noticeVO = noticeService.getNotcieDetail(lecntNo);
		List<AttachFileVO> fileList = fileService.getFileList(noticeVO.getAtchFileNo());
		noticeVO.setFileList(fileList);
		log.info("디테일가져왔냐!!!!!"+noticeVO.toString());
		model.addAttribute("noticeVO",noticeVO);
		return "professor/lectureNoticeDetail";
	}
	//교수클래스룸 공지등록 페이지
	@GetMapping("/noticeform")
	public String noticeRegForom(HttpSession session, LectureNoticeVO noticeVO) {
		log.info("lecapNo +> " + session.getAttribute("lecapNo").toString());
		return "professor/lectureNoticeForm";
	}
	//교수클래스룸 공지 수정 페이지
	@GetMapping("/noticemodForm/{lecntNo}")
	public String noticeModForm(Model model,@PathVariable int lecntNo) {
		LectureNoticeVO noticeVO = noticeService.getNotcieDetail(lecntNo);
		List<AttachFileVO> fileList = fileService.getFileList(noticeVO.getAtchFileNo());
		noticeVO.setFileList(fileList);
		model.addAttribute("notice",noticeVO);
		return "professor/lectureNoticeForm";
	}
	//교수클래스룸 공지등록 메소드
	@PostMapping("/insertNotice")
	public String insertNotice(HttpSession session, LectureNoticeVO noticeVO,RedirectAttributes re) {

		log.info("교수이름!!!!!!" + noticeVO.toString());
		List<MultipartFile> attchNotice = noticeVO.getAttchNotice();

		// 처음에 파일 -1 초기화 -1 = 파일이 없다 라는걸 명시

		int fileNo = fileService.getAttachFileNo();
		for (int i = 0; i < attchNotice.size(); i++) {
			MultipartFile multipartFile = attchNotice.get(i);
			if (multipartFile.getSize() > 0) {
				fileService.insertFile(multipartFile, fileNo, i);
				noticeVO.setAtchFileNo(fileNo);
			}
		}
		int res = noticeService.insertNotice(noticeVO);
		String goPage = "";
		if (res >0 ) {
			goPage = "redirect:/hku/professor/noticeList";
			re.addFlashAttribute("ok", "성공");
		}else {
			goPage = "redirect:/hku/professor/noticeform";
			re.addFlashAttribute("fail", noticeVO);
		}

		return goPage;

	}
	//교수클래스룸 공지수정 메소드
	@PostMapping("/updateNotice")
	public String updateNotice(HttpSession session, LectureNoticeVO noticeVO,RedirectAttributes re) {

		List<MultipartFile> attchNotice = noticeVO.getAttchNotice();

		int fileNo = fileService.getAttachFileNo();
		for (int i = 0; i < attchNotice.size(); i++) {
			MultipartFile multipartFile = attchNotice.get(i);
			if (multipartFile.getSize() > 0) {
				fileService.insertFile(multipartFile, fileNo, i);
				noticeVO.setAtchFileNo(fileNo);
			}
		}
		int res = noticeService.updateNotice(noticeVO);
		String goPage = "";
		if (res >0 ) {
			goPage = "redirect:/hku/professor/noticeList";
			re.addFlashAttribute("ok", "성공");
		}else {
			goPage = "redirect:/hku/professor/noticeform";
			re.addFlashAttribute("fail", noticeVO);
		}

		return goPage;

	}
	@GetMapping("/deleteNotice/{lecntNo}")
	public String deleteNotice(@PathVariable int lecntNo, RedirectAttributes re) {
		LectureNoticeVO noticeVO = noticeService.getNotcieDetail(lecntNo);
		fileService.deleteFile(noticeVO.getAtchFileNo());
		int res = noticeService.deleteNotice(lecntNo);
		
		String goPage = "";
		if (res >0 ) {
			goPage = "redirect:/hku/professor/noticeList";
			re.addFlashAttribute("ok", "성공");
		}else {
			goPage = "redirect:/hku/professor/detailNotice/"+lecntNo;
			re.addFlashAttribute("fail","실패");
		}

		return goPage;
	}
	
	@GetMapping("/search")
	@ResponseBody
	public List<NoticeVO> search(HttpSession session,String searchWord) {
		log.info("검색어"+searchWord);
		Map<String, String> map = new HashMap<String,String>();
		String lecapNo = session.getAttribute("lecapNo").toString();
		map.put("lecapNo", lecapNo);
		map.put("searchWord", searchWord);
		List<NoticeVO> searchList = noticeService.getSearchList(map);
		
		return searchList;
	}
	
}
