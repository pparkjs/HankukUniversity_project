package kr.or.hku.classroom.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.classroom.mapper.LectureNoticeMapper;
import kr.or.hku.classroom.service.LectureNoticeService;
import kr.or.hku.classroom.vo.LectureNoticeVO;
import kr.or.hku.notice.vo.NoticeVO;

@Service
public class LectureNoticeServiceImpl implements LectureNoticeService{
	
	@Autowired
	LectureNoticeMapper noticeMapper;
	
	@Override
	public List<LectureNoticeVO> getNoticeList(String lecapNo) {
		return noticeMapper.getNoticeList(lecapNo);
	}
	
	@Override
	public int insertNotice(LectureNoticeVO noticeVO) {
		return noticeMapper.insertNotice(noticeVO);
	}
	
	@Override
	public LectureNoticeVO getNotcieDetail(int lecntNo) {
		noticeMapper.updateReadCnt(lecntNo);
		LectureNoticeVO vo = noticeMapper.getNoticeDetail(lecntNo);
		return vo;
	}
	
	@Override
	public int updateNotice(LectureNoticeVO noticeVO) {
		return noticeMapper.updateNotice(noticeVO);
	}
	@Override
	public int deleteNotice(int lecntNo) {
		// TODO Auto-generated method stub
		return noticeMapper.deleteNotice(lecntNo);
	}
	
	@Override
	public List<NoticeVO> getSearchList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return noticeMapper.getSearchList(map);
	}
	
}
