package kr.or.hku.notice.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.ServiceResult;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.service.ICommonService;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.notice.service.DepartmentNoticeService;
import kr.or.hku.notice.vo.DeptNoticeVO;
import kr.or.hku.notice.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DepartmentNoticeController {

	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private DepartmentNoticeService deptNoticeService;
	
	@Autowired
	private CommonFileService fileService;
	
	@GetMapping("/hku/dept/notice")
	public String deptNotice(Model model) {
		List<CommonVO> commonData = commonService.getAllCommonData();
		List<Map<String, Object>> college = deptNoticeService.getCollege();
		log.info(college.toString());
		model.addAttribute("commonData", commonData);
		model.addAttribute("college", college);
		return "admin/deptNotice";
	}
	
	@ResponseBody
	@GetMapping("/hankuk/dept/list")
	public List<Map<String, Object>> getDeptList(@RequestParam String colData){
		log.info("getDeptList() 실행!!!" + colData);
		List<Map<String, Object>> deptList = deptNoticeService.getDeptList(colData);
		return deptList;
	}
	
	
	@ResponseBody
	@GetMapping(value = "/hankuk/dept/noticeList", produces = "application/json;charset=utf-8")
	public PaginationInfoVO deptNoticeList(@RequestParam Map<String, String> map){
		log.info("디이피티 노티스 리스트" + map.toString());
		
		PaginationInfoVO<DeptNoticeVO> pagingVO = new PaginationInfoVO<DeptNoticeVO>();
		
		pagingVO.setDeptCd(map.get("deptCd"));
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
		
		int totalRecord = deptNoticeService.selectDeptNoticeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<DeptNoticeVO> dataList = deptNoticeService.selectDeptNoticeList(pagingVO);
		pagingVO.setDataList(dataList);
		return pagingVO;
	}
	
	@ResponseBody
	@GetMapping("/hankuk/dept/deptNoticeDetail")
	public DeptNoticeVO deptNoticeDetail(@RequestParam int depntNo) {
		log.info("학과 공지 상세보기 실행! 번호는 => " + depntNo);
		DeptNoticeVO deptNoticeVO = deptNoticeService.deptNoticeDetail(depntNo);
		int fileNo = deptNoticeVO.getAtchFileNo();
		List<AttachFileVO> fileList = fileService.getFileList(fileNo);
		deptNoticeVO.setFileList(fileList);
		return deptNoticeVO;
	}
	
	@ResponseBody
	@PostMapping(value = "/hankuk/dept/notice")
	public String insertDeptNotice(DeptNoticeVO deptNoticeVO) {
		log.info("인서트 디이피티 노티스 => " + deptNoticeVO.toString());
		
		// 리턴 해줄 내용
		String msg = "";
		
		List<MultipartFile> files = deptNoticeVO.getFiles();
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
		
		if (!flag) {
			deptNoticeVO.setAtchFileNo(attachFileNo);
		}else {
			// 파일이 안들어왔을떄
			deptNoticeVO.setAtchFileNo(-1);
		}
		
		ServiceResult res = deptNoticeService.insertDeptNotice(deptNoticeVO);
		if (res.equals(ServiceResult.OK)) {
			msg = "success";
		}else {
			msg = "failed";
		}
		return msg;
	}
	
	@ResponseBody
	@PutMapping(value = "/hankuk/dept/notice")
	public DeptNoticeVO updateDeptNotice(DeptNoticeVO deptNoticeVO) {
		log.info("학과 공지 업데이트 실행 " + deptNoticeVO.toString());
		String msg = "";
		
		List<MultipartFile> files = deptNoticeVO.getFiles();
		List<AttachFileVO> fileList = null;
		
		// 파일 있는지 없는지 체크
		boolean isFileNone = false;
		
		if (files == null) { // 파일이 없으면 true 있으면 false
			isFileNone = true;
		}
		
		if (!isFileNone) { // 파일 있을때 로직
			// 파일이 있을떄는 기존에 있던거 지우고 새로 등록 한다.
			
			// 파일 지우기
			int fileNo = deptNoticeVO.getAtchFileNo();
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
			deptNoticeVO.setAtchFileNo(attachFileNo);
			int updateNoticeRes = deptNoticeService.updateDeptNotice(deptNoticeVO);
			if (updateNoticeRes > 0) {
				log.info("====공지사항 업데이트 성공====");
			}
			// 파일이 변경되었을떄 새로운 파일 번호로 파일들 가져오기
			fileList = fileService.getFileList(attachFileNo);
		}else { // 파일 없을떄 로직
			// 파일이 없을떄는 flag 로 -1 파일이 변경 안됬다는 뜻
			deptNoticeVO.setAtchFileNo(-1);
			int updateNoticeRes = deptNoticeService.updateDeptNotice(deptNoticeVO);
			if (updateNoticeRes > 0) { // 여기가 실행 안된다고
				log.info("공지사항 업데이트 완료");
			}
			// 파일이 변경 안되었을떄 기존에 있던 파일 다시 가져오기
			fileList = fileService.getFileList(deptNoticeVO.getAtchFileNo());
		}
		int depntNo = deptNoticeVO.getDepntNo();
		// 공지사항번호로 다시 공지사항 가져오기
		DeptNoticeVO updateCompletNotice = deptNoticeService.deptNoticeDetail(depntNo);
		
		// 위에서 처리된 로직으로 파일들 넣어주기
		updateCompletNotice.setFileList(fileList);
		return updateCompletNotice;
	}
	
	
	@ResponseBody
	@DeleteMapping("/hankuk/dept/notice")
	public String deleteDeptNotice(@RequestBody Map<String, String> map) {
		String msg = "";
		log.info("딜리트매서드   " + map.toString());
		if (map.get("atchFileNo") != null) {
			int deleteFile = fileService.deleteFile(Integer.parseInt(map.get("atchFileNo")));
		}
		int deleteNotice = deptNoticeService.deleteDeptNotice(Integer.parseInt(map.get("noticeNo")));
		if (deleteNotice > 0) {
			log.info("삭제 완료");
			msg = "success";
		}else {
			log.info("삭제 에러!!!!!!!!!!!!!!!!!!!!!");
			msg = "failed";
		}
		return msg;
	}
}
