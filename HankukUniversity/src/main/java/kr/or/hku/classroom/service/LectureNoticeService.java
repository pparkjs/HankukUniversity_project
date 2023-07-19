package kr.or.hku.classroom.service;

import java.util.List;

import kr.or.hku.classroom.vo.LectureNoticeVO;

public interface LectureNoticeService {

	public List<LectureNoticeVO> getNoticeList(String lecapNo);

	public int insertNotice(LectureNoticeVO noticeVO);

	public LectureNoticeVO getNotcieDetail(int lecntNo);

	public int updateNotice(LectureNoticeVO noticeVO);

	public int deleteNotice(int lecntNo);
	
}
