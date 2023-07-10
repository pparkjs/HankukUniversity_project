package kr.or.hku.notice.service;

import java.util.List;

import kr.or.hku.ServiceResult;
import kr.or.hku.notice.vo.NoticeVO;

public interface AdminNoticeService {
	public List<NoticeVO> noticeList(String noticeClsf);
	public ServiceResult addNotice(NoticeVO noticeVO);
	public NoticeVO getNoticeOne(int noticeNo);
}
