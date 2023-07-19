package kr.or.hku.classroom.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.classroom.mapper.LectureNoticeMapper;
import kr.or.hku.classroom.service.LectureNoticeService;
import kr.or.hku.classroom.vo.LectureNoticeVO;

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
		LectureNoticeVO vo = noticeMapper.getNoticeDetail(lecntNo);
		noticeMapper.updateReadCnt(lecntNo);
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
	
}
