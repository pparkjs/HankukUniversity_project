package kr.or.hku.portal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.hku.portal.service.PortalService;
import lombok.extern.slf4j.Slf4j;

/**
 * 포탈 에서 공지사항, 시간표 등등 가져오는 RestController
 * @author PC-09
 *
 */
@Slf4j
@RestController
@RequestMapping("/hku/portal")
public class PortalController {

	@Autowired
	private PortalService portalService;
	
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
}
