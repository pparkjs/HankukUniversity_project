package kr.or.hku.portal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.portal.vo.DetailNoticeVO;

@Mapper
public interface PortalMapper {
	// 학사 공지 가져오기
	public List<Map<String, String>> getAcadmicNoticeList();
	// 학고 공지
	public List<Map<String, String>> getDeptNoticeList(String deptCd);
	// 채용공지
	public List<Map<String, String>> getEmploymentNoticeList();
	// 공지사항 조회수 증가
	public void incrementReadCnt(Map<String, String> paramMap);
	// 공지사항 상세보기
	public DetailNoticeVO getNoticeDetail(Map<String, String> paramMap);
}
