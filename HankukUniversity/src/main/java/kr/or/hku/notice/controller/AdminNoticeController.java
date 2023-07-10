package kr.or.hku.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.ServiceResult;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.service.ICommonService;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.notice.service.AdminNoticeService;
import kr.or.hku.notice.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hankuk/admin")
@Slf4j
public class AdminNoticeController {

	@Autowired
	private AdminNoticeService noticeService;
	
	@Autowired
	private CommonFileService fileService;
	
	
	@Autowired
	private ICommonService commonService;
	
	@GetMapping("/academicnotice")
	public String academicNoticeList(Model model) {
		List<CommonVO> commonData = commonService.getAllCommonData();
		model.addAttribute("commonData", commonData);
		return "admin/notice";
	}
	
	@ResponseBody
	@GetMapping("/noticeList/{clsf}")
	public ResponseEntity<List<NoticeVO>> getNoticeList(@PathVariable("clsf") String noticeClsf){
		log.info("===리스트 출력===");
		log.info("리스트 출력 전달 파라미터 : " + noticeClsf);
		ResponseEntity<List<NoticeVO>> entity = null;
		List<NoticeVO> noticeList = noticeService.noticeList(noticeClsf);
		entity = new ResponseEntity<List<NoticeVO>>(noticeList, HttpStatus.OK);
		return entity;
	}
	
	// 등록 로직
	@ResponseBody
	@RequestMapping(value = "/addNotice",method = RequestMethod.POST)
	public ResponseEntity<String> addNotice(NoticeVO noticeVO){
		log.info("===================등록 실행====================");
		ResponseEntity<String> entity = null;
		log.info(noticeVO.toString());
		List<MultipartFile> files = noticeVO.getFiles();
		if (files.size() > 0 && files != null) {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = files.get(i);
				log.info(file.getOriginalFilename());
			}
		}
		
		// 파일 시퀀스 생성
		int attachFileNo = fileService.getAttachFileNo();
		boolean flag = false;
		// 파일 등록
		if (files.size() > 0 && files != null) {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = files.get(i);
				int insertFile = fileService.insertFile(file,attachFileNo, i);
				if (insertFile == 0) {
					flag = true;
				}
			}
		}
		log.info("학사공지 등록했을떄 오는 데이터 : " + noticeVO.toString());
		
		
		noticeVO.setAtchFileNo(attachFileNo);
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
		log.info(noticeVO.toString());
		List<AttachFileVO> fileList = fileService.getNoticeFile(noticeVO.getAtchFileNo());
		noticeVO.setFileList(fileList);
		log.info("몇개 들어오는지  " + fileList.size());
		if (fileList != null && fileList.size() > 0) {
			for (AttachFileVO file : fileList) {
				log.info("노티스 상세보기 " + file.getFileOrgnlFileNm());
			}
		}
		if (noticeVO != null) {
			entity = new ResponseEntity<NoticeVO>(noticeVO ,HttpStatus.OK);
		}else {
			entity = null;
		}
		return entity;
	}
}
