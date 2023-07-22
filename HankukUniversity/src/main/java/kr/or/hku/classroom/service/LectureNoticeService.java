package kr.or.hku.classroom.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.classroom.vo.LectureNoticeVO;
import kr.or.hku.notice.vo.NoticeVO;

public interface LectureNoticeService {

	public List<LectureNoticeVO> getNoticeList(String lecapNo);

	public int insertNotice(LectureNoticeVO noticeVO);

	public LectureNoticeVO getNotcieDetail(int lecntNo);

	public int updateNotice(LectureNoticeVO noticeVO);

	public int deleteNotice(int lecntNo);

	public List<NoticeVO> getSearchList(Map<String, String> map);
	
}
