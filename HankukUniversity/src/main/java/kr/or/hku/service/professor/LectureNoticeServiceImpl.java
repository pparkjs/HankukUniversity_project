package kr.or.hku.service.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mapper.professor.LectureNoticeMapper;
import kr.or.hku.vo.LectureNoticeVO;

@Service
public class LectureNoticeServiceImpl implements ILectureNoticeService{
	
	@Autowired
	private LectureNoticeMapper lectureNoticeMapper;

	@Override
	public List<LectureNoticeVO> boardList() {
		return lectureNoticeMapper.boardList();
	}

	@Override
	public LectureNoticeVO boardDetail(int lecnt_no) {
		return lectureNoticeMapper.boardDetail(lecnt_no);
	}

	@Override
	public int insertBoard(LectureNoticeVO noticeVO) {
		return lectureNoticeMapper.insertBoard(noticeVO);
	}

	@Override
	public int updateBoard(LectureNoticeVO noticeVO) {
		return lectureNoticeMapper.updateBoard(noticeVO);
	}

	@Override
	public int deleteBoard(int lecnt_no) {
		return lectureNoticeMapper.deleteBoard(lecnt_no);
	}
	
}
