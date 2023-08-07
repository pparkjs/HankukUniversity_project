package kr.or.hku.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.notice.mapper.AdminNoticeMapper;
import kr.or.hku.notice.service.AdminNoticeService;
import kr.or.hku.notice.vo.NoticeVO;
import kr.or.hku.notice.vo.PaginationInfoVO;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeMapper noticeMapper;

	@Override
	public List<NoticeVO> noticeList(String noticeClsf) {
		return noticeMapper.noticeList(noticeClsf);
	}

	@Override
	public ServiceResult addNotice(NoticeVO noticeVO) {
		ServiceResult res = null;
		int cnt = noticeMapper.addNotice(noticeVO);
		if (cnt > 0) {
			res = ServiceResult.OK;
		} else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public NoticeVO getNoticeOne(int noticeNo) {
		noticeMapper.incrementNotice(noticeNo);
		return noticeMapper.getNoticeOne(noticeNo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return noticeMapper.updateNotice(noticeVO);
	}
	
	@Override
	public int deleteNotice(int noticeNo) {
		return noticeMapper.deleteNotice(noticeNo);
	}
	
	@Override
	public List<NoticeVO> noticeList2(Map<String, String> map) {
		return noticeMapper.noticeList2(map);
	}
	
	@Override
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO) {
		return noticeMapper.selectNoticeCount(pagingVO);
	}
	
	@Override
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO) {
		return noticeMapper.selectNoticeList(pagingVO);
	}
}
