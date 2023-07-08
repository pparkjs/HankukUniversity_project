package kr.or.hku.classroom.service;

import java.util.List;

import kr.or.hku.classroom.vo.LectureNoticeVO;


public interface ILectureNoticeService {
	
	public List<LectureNoticeVO> boardList(); 
	public LectureNoticeVO boardDetail(int lecnt_no);
	public int insertBoard(LectureNoticeVO noticeVO);
	public int updateBoard(LectureNoticeVO noticeVO);
	public int deleteBoard(int lecnt_no);
}
