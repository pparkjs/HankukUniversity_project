package kr.or.hku.student.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.student.vo.PaginationInfoVO;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.student.service.StudyService;
import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.StudyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/student")
public class StudyBoardController {
	
	@Inject
	private StudyService service;
	
	@Inject
	private CommonFileService fileService;
	
	@Inject
	private CommonService commonService;
	
	@GetMapping(value = "/studyBoard")
	public String studyBoard(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
	    
	    if (stdVo == null) {
	        return "redirect:/main/login";
	    }
	    String stdNo = stdVo.getStdNo();
	    log.info("userNo: "+ stdNo);
	    List<StudyVO> myStudy = service.myStudy(stdNo);
	    List<StudyVO> list =  service.studyBoardList();
	    String stdNm = stdVo.getStdNm();
	    model.addAttribute("list", list);
	    model.addAttribute("myStudy", myStudy);
	    model.addAttribute("stdNm", stdNm);
	    return "portal/studyBoard";
	}
	
	@ResponseBody
	@GetMapping("/studyBoardList")
	public ResponseEntity<PaginationInfoVO> studyBoardList(@RequestParam Map<String, String> map) {
		log.info("스터디게시판 전달 파라미터 > " + map.toString());
		ResponseEntity<PaginationInfoVO> entity = null;
		
		PaginationInfoVO<StudyVO> pagingVO = new PaginationInfoVO<StudyVO>();
		if (StringUtils.isBlank(map.get("stype"))) { 
			map.put("stype", "title");
		}
		int currentPage = 1;
		if (StringUtils.isNotBlank(map.get("page"))) { 
			currentPage = Integer.parseInt(map.get("page"));
		}
		
		if (StringUtils.isNotBlank(map.get("sword"))) {
			pagingVO.setSearchType(map.get("stype"));
			pagingVO.setSearchWord(map.get("sword"));
		}
		
		pagingVO.setCurrentPage(currentPage);
		
//		int totalRecord = service.boardCount(pagingVO);
//		log.info("총 게시글 수: " +totalRecord);
		
		List<StudyVO> dataList = service.boardSelect(pagingVO);
		if(!dataList.isEmpty()) {
			pagingVO.setTotalRecord(dataList.get(0).getTotalRecord());
			log.info("개수: " + pagingVO.getTotalRecord());
		}
		pagingVO.setDataList(dataList);
		
		entity = new ResponseEntity<PaginationInfoVO>(pagingVO, HttpStatus.OK);
		return entity;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_STUDENT')")
	@GetMapping("/studyBoardDetail")
	public String studyBoardDetail(@RequestParam int stboNo, Model model, HttpServletRequest request) {
		
		log.info("stboNo: "+ stboNo);
		HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
	    
	    String stdNo = stdVo.getStdNo();
	    log.info("myStdNo: "+ stdNo);
	    
		
		StudyVO studyBoard = service.studyBoardDetail(stboNo);
	    model.addAttribute("studyBoard", studyBoard);
	    model.addAttribute("stdNo", stdNo);
		return "portal/studyBoardDetail";
	}
	
	@ResponseBody
	@PostMapping(value = "/insertStudyBoard")
	public ResponseEntity<String> insertStudyBoard(StudyVO studyVo) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    
		log.info("스터디브이오: "+studyVo);
		List<MultipartFile> files = studyVo.getFiles();
		int attachFileNo = 0;
		if(files != null && files.size() > 0) {
			attachFileNo = fileService.getAttachFileNo();
			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = files.get(i);
				if (file.getSize() > 0) {
					int fileResult = fileService.insertFile(file, attachFileNo, i);
					if (fileResult == 0) {
						attachFileNo = 0;
						break;
					}
				}
			}
		}
		
		studyVo.setAtchFileNo(attachFileNo);
		
		int res = service.insertStudyBoard(studyVo);
	    
	    
	    log.info("insert status : " + res);
		
		if(res > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}

	@ResponseBody
	@PostMapping(value = "/deleteStudyBoard")
	public ResponseEntity<Integer> deleteStudyBoard(@RequestParam("stboNo") int stboNo) {
		int res = service.deleteStudyBoard(stboNo);
	    
		return new ResponseEntity<Integer>(res,HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "/modifyStudyBoard")
	public ResponseEntity<String> modifyStudyBoard(@RequestBody StudyVO studyVo) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    
	    int res = service.modifyStudyBoard(studyVo);
		
		if(res > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}

	@ResponseBody
	@PostMapping(value = "/intoStudy")
	public ResponseEntity<String> intoStudy(@RequestBody StudyVO studyVo, HttpServletRequest request) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
	  
	    String stdNo = stdVo.getStdNo();
	    studyVo.setStdNo(stdNo);
	    log.info(studyVo.getStdNo());
	    log.info(""+studyVo.getStudyNo());
	    log.info(studyVo.getJoinReason());
	    
	    List<StudyVO> joinList = service.joinCheck(studyVo);		
	    if (!joinList.isEmpty()) {
	    	entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
	    }else {
	    	int res = service.intoStudy(studyVo);
	    }		
		return entity;
	}

}
