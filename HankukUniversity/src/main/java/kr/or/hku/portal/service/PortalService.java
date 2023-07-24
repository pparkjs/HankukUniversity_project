package kr.or.hku.portal.service;

import java.util.List;
import java.util.Map;

public interface PortalService {
	// 학사 공지 가져오기
	public List<Map<String, String>> getAcadmicNoticeList();
	// 채용 공지 가져오기
	public List<Map<String, String>> getEmploymentNoticeList();
	// 학고 공지 가져오기
	public List<Map<String, String>> getDeptNoticeList(String deptCd);
}
