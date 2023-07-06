package kr.or.hku.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.service.admin.IAdminNoticeService;
import kr.or.hku.vo.NoticeVO;

@Controller
@RequestMapping("/hankuk/admin")
public class AdminNoticeController {

	@Autowired
	private IAdminNoticeService noticeService;
	
	@GetMapping("/academicnotice")
	public String academicNoticeList() {
		return "admin/notice";
	}
	
	@ResponseBody
	@GetMapping(value = "/noticeList", produces = "application/json;charset=utf-8")
	public ResponseEntity<List<NoticeVO>> getNoticeList(){
		ResponseEntity<List<NoticeVO>> entity = null;
		List<NoticeVO> noticeList = noticeService.noticeList();
		entity = new ResponseEntity<List<NoticeVO>>(noticeList, HttpStatus.OK);
		return entity;
	}
}
