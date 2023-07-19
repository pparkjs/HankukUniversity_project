package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.LectureNoticeVO;

@Mapper
public interface LectureNoticeMapper {
	
	public List<LectureNoticeVO> boardList(); 
	public LectureNoticeVO boardDetail(int lecnt_no);
	public int insertBoard(LectureNoticeVO noticeVO);
	public int updateBoard(LectureNoticeVO noticeVO);
	public int deleteBoard(int lecnt_no);
}
