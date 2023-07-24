package kr.or.hku.portal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PortalMapper {
	// 학사 공지 가져오기
	public List<Map<String, String>> getAcadmicNoticeList();
	// 학고 공지
	public List<Map<String, String>> getDeptNoticeList(String deptCd);
	// 채용공지
	public List<Map<String, String>> getEmploymentNoticeList();
}
