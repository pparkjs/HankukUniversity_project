package kr.or.hku.portal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.hc.client5.http.fluent.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.portal.service.PortalService;
import kr.or.hku.portal.vo.DetailNoticeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 포탈 에서 공지사항, 시간표 등등 가져오는 controller
 * @author PC-09
 *
 */
@Slf4j
@Controller
@RequestMapping("/hku/portal")
public class PortalController {

	@Autowired
	private PortalService portalService;

	@Autowired
	private CommonFileService fileService;
	
	@ResponseBody
	@GetMapping(value = "/all-notice")
	public Map<String, Object> getAllNoticeList(String deptCd){
		log.info("학과 번호" + deptCd);
		List<Map<String, String>> academicNoticeList = portalService.getAcadmicNoticeList();
		List<Map<String, String>> employmentNoticeList = portalService.getEmploymentNoticeList();
		List<Map<String, String>> deptNoticeList = portalService.getDeptNoticeList(deptCd);
		Map<String, Object> allNoticeData = new HashMap<String, Object>();
		allNoticeData.put("acNotice", academicNoticeList);
		allNoticeData.put("epNotice", employmentNoticeList);
		allNoticeData.put("deptNotice", deptNoticeList);
		log.info("리턴할 공지사항 정보들 > " + allNoticeData.toString());
		return allNoticeData;
	}
	
	// 공지사항 보러 가는 페이지
	@GetMapping("/all-notice-list")
	public String goAllNoticeList() {
		return "portal/allNotice";
	}
	
	// 공지사항 상세보기
	@GetMapping("/notice-detail")
	public String showDetailNotice(@RequestParam Map<String, String> paramMap
			, Model model) {
		log.info("학생 공지 상세보기 전달 파라미터 => " + paramMap.toString());
		DetailNoticeVO noticeVO = portalService.getNoticeDetail(paramMap);
		int fileNo = noticeVO.getAtchFileNo();
		List<AttachFileVO> fileList = fileService.getFileList(fileNo);
		noticeVO.setFileList(fileList);
		model.addAttribute("notice", noticeVO);
		return "portal/allNoticeDetail";
	}
	
	
	// 혀니 네이버 날씽 가져오깅
	@ResponseBody
	@GetMapping(value="/naver", produces = "application/json;chaset=utf-8")
	public String getWeatherInfo() throws Exception {
		log.info("혀니 네이버 날씨 가져왔응");
		return Request.get("https://weather.naver.com").execute().returnContent().asString();
	}
}
