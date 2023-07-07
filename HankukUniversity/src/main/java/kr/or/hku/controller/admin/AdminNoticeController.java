package kr.or.hku.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
import kr.or.hku.service.admin.IAdminNoticeService;
import kr.or.hku.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hankuk/admin")
@Slf4j
public class AdminNoticeController {

	@Autowired
	private IAdminNoticeService noticeService;
	
	@GetMapping("/academicnotice")
	public String academicNoticeList(Model model) {
		
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
	
	// 등록 로직
	@ResponseBody
	@PostMapping(value = "/addNotice", produces = "application/json;charset=utf-8")
	public ResponseEntity<String> addNotice(@RequestBody NoticeVO noticeVO){
		ResponseEntity<String> entity = null;
//		log.info("학사공지 등록했을떄 오는 데이터 : " + noticeVO.toString());
		
		noticeVO.setNoticeClsf("uni");
		ServiceResult res = noticeService.addNotice(noticeVO);
		if (res.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("failed", HttpStatus.OK);
		}
		return entity;
	}
	
	// 노티스 상세 보기
	@ResponseBody
	@GetMapping(value = "/getNoticeOne", produces = "application/json;charset=utf-8")
	public ResponseEntity<NoticeVO> getNoticeOne(int noticeNo){
		ResponseEntity<NoticeVO> entity = null;
		log.info("노티스 번호  " +noticeNo);
		NoticeVO noticeVO = noticeService.getNoticeOne(noticeNo);
		if (noticeVO != null) {
			entity = new ResponseEntity<NoticeVO>(noticeVO ,HttpStatus.OK);
		}else {
			entity = null;
		}
		return entity;
	}
}
