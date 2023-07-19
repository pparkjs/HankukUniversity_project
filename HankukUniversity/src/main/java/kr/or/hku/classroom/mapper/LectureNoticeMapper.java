package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.LectureNoticeVO;

@Mapper
public interface LectureNoticeMapper {
	
	public List<LectureNoticeVO> getNoticeList(String lecapNo);
	public int insertNotice(LectureNoticeVO noticeVO);
	public LectureNoticeVO getNoticeDetail(int lecntNo);
	public void updateReadCnt(int lecntNo);
	public int updateNotice(LectureNoticeVO noticeVO);
	public int deleteNotice(int lecntNo);
}
