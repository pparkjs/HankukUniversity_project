package kr.or.hku.notice.service;

import java.util.List;

import kr.or.hku.ServiceResult;
import kr.or.hku.notice.vo.NoticeVO;

public interface IAdminNoticeService {

	public List<NoticeVO> noticeList();

	public ServiceResult addNotice(NoticeVO noticeVO);

	public NoticeVO getNoticeOne(int noticeNo);
	
}
