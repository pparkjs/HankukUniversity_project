package kr.or.hku.notice.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
import kr.or.hku.notice.vo.PaginationInfoVO;
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
	@GetMapping("/noticeList")
	public ResponseEntity<PaginationInfoVO> getNoticeList(
			@RequestParam Map<String, String> map
			){
//		ResponseEntity<List<NoticeVO>> entity = null;
		ResponseEntity<PaginationInfoVO> entity = null;
		log.info("map 바인딩" + map.toString());
		// stype, sword
		
		PaginationInfoVO<NoticeVO> pagingVO = new PaginationInfoVO<NoticeVO>();
		
		if (StringUtils.isBlank(map.get("stype"))) { // 디펄트 밸류
			map.put("stype", "title");
		}
		
		int currentPage = 1;
		if (StringUtils.isNotBlank(map.get("page"))) { // 값이 있을떄
			currentPage = Integer.parseInt(map.get("page"));
		}
		
		if (StringUtils.isNotBlank(map.get("sword"))) { // 검색 했을때
			pagingVO.setSearchType(map.get("stype"));
			pagingVO.setSearchWord(map.get("sword"));
		}
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = noticeService.selectNoticeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<NoticeVO> dataList = noticeService.selectNoticeList(pagingVO);
		pagingVO.setDataList(dataList);
		
		log.info("===리스트 출력===");
		log.info("리스트 출력 전달 파라미터 : " + map.get("noticeClsf"));
//		List<NoticeVO> noticeList = noticeService.noticeList(map.get("noticeClsf"));
//		List<NoticeVO> noticeList = noticeService.noticeList2(map);
		entity = new ResponseEntity<PaginationInfoVO>(pagingVO, HttpStatus.OK);
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
		if (files != null) {
			if (files.size() > 0) {
				for (int i = 0; i < files.size(); i++) {
					MultipartFile file = files.get(i);
					log.info(file.getOriginalFilename());
				}
			}
		}
		
		// 파일 시퀀스 생성
		int attachFileNo = fileService.getAttachFileNo();
		boolean flag = false;
		// 파일 등록
		
		if (files != null) {
			if (files.size() > 0) {
				for (int i = 0; i < files.size(); i++) {
					MultipartFile file = files.get(i);
					int insertFile = fileService.insertFile(file,attachFileNo, i);
					if (insertFile == 0) {
						flag = true;
					}
				}
			}
		}
		
		log.info("학사공지 등록했을떄 오는 데이터 : " + noticeVO.toString());
		// 플래그가 트루이면 값이 안들어간거고 false이면 값이 들어간거다.
		if (!flag) {
			noticeVO.setAtchFileNo(attachFileNo);
		}else {
			// 파일이 안들어왔을떄
			noticeVO.setAtchFileNo(-1);
		}
		
		log.info("노티스 파일 번호"+noticeVO.getAtchFileNo());
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
		if (fileList != null || fileList.size() > 0) {
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
	
	// 수정 로직
	@ResponseBody
	@PutMapping("/updateNotice")
	public ResponseEntity<NoticeVO> updateNotice(NoticeVO noticeVO){
		/*
		 	1. 파일이 들어왔을 떄 기존에 있던 파일 다 지우고 새로 업데이트 한다.
		 	
		 	2. 파일이 안들어왔을떄 기존에 있던 파일그냥 놔두고 다른거만 업데이트 한다.
		 */
		log.info("===================업데이트 실행====================");
		ResponseEntity<NoticeVO> entity = null;
		log.info(noticeVO.toString());
		// 1 파일 들어왔는지 안들어왔는지 확인
		List<MultipartFile> files = noticeVO.getFiles();
		
		List<AttachFileVO> fileList = null;
		// 파일 있는지 없는지 체크
		boolean isFileNone = false;
		
		if (files == null) { // 파일이 없으면 true 있으면 false
			isFileNone = true;
		}
		
		if (!isFileNone) { // 파일 있을때 로직
			// 파일이 있을떄는 기존에 있던거 지우고 새로 등록 한다.
			
			// 파일 지우기
			int fileNo = noticeVO.getAtchFileNo();
			int result = fileService.deleteFile(fileNo);
			if (result > 0) {
				log.info("========파일 삭제 완료=======");
			}
			// 파일 시퀀스 생성
			int attachFileNo = fileService.getAttachFileNo();
			
			// 파일을 다시 등록한다.
			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = files.get(i);
				int insertFile = fileService.insertFile(file,attachFileNo, i);
				if (insertFile > 0) {
					log.info("파일 업데이트 완료");
				}
			}
			noticeVO.setAtchFileNo(attachFileNo);
			int updateNoticeRes = noticeService.updateNotice(noticeVO); // 여기 오류
			if (updateNoticeRes > 0) {
				log.info("====공지사항 업데이트 성공====");
			}
			// 파일이 변경되었을떄 새로운 파일 번호로 파일들 가져오기
			fileList = fileService.getNoticeFile(attachFileNo);
		}else { // 파일 없을떄 로직
			// 파일이 없을떄는 flag 로 -1 파일이 변경 안됬다는 뜻
			noticeVO.setAtchFileNo(-1);
			int updateNoticeRes = noticeService.updateNotice(noticeVO);
			if (updateNoticeRes > 0) { // 여기가 실행 안된다고
				log.info("공지사항 업데이트 완료");
			}
			// 파일이 변경 안되었을떄 기존에 있던 파일 다시 가져오기
			fileList = fileService.getNoticeFile(noticeVO.getAtchFileNo());
		}
		// 공지사항 번호 가져오기
		int noticeNo = noticeVO.getNoticeNo();
		// 공지사항번호로 다시 공지사항 가져오기
		NoticeVO updateCompletNotice = noticeService.getNoticeOne(noticeNo);
		
		// 위에서 처리된 로직으로 파일들 넣어주기
		updateCompletNotice.setFileList(fileList);
		// 공지사항 리턴
		entity = new ResponseEntity<NoticeVO>(updateCompletNotice,HttpStatus.OK);
		return entity;
	}
	
	
	@ResponseBody
	@DeleteMapping(value = "/deleteNotice", produces = "application/json;charset=utf-8")
	public String deleteNotice(@RequestBody Map<String, String> map) {
		String msg = "";
		log.info(map.toString());
		if (map.get("atchFileNo") != null) {
			int deleteFile = fileService.deleteFile(Integer.parseInt(map.get("atchFileNo")));
		}
		int deleteNotice = noticeService.deleteNotice(Integer.parseInt(map.get("noticeNo")));
		if (deleteNotice > 0) {
			log.info("삭제 완료");
			msg = "게시글이 삭제되었습니다.";
		}else {
			log.info("삭제 에러!!!!!!!!!!!!!!!!!!!!!");
			msg = "서버오류 다시 시도해주세요.";
		}
		return msg;
	}
}





