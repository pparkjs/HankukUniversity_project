package kr.or.hku.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.notice.mapper.AdminNoticeMapper;
import kr.or.hku.notice.service.IAdminNoticeService;
import kr.or.hku.notice.vo.NoticeVO;

@Service
public class AdminNoticeServiceImpl implements IAdminNoticeService{
	
	@Autowired
	private AdminNoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVO> noticeList() {	
		return noticeMapper.noticeList();
	}
	
	@Override
	public ServiceResult addNotice(NoticeVO noticeVO) {
		ServiceResult res = null;
		int cnt = noticeMapper.addNotice(noticeVO);
		if (cnt > 0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}
	
	
	@Override
	public NoticeVO getNoticeOne(int noticeNo) {
		noticeMapper.incrementNotice(noticeNo);
		return noticeMapper.getNoticeOne(noticeNo);
	}
}
