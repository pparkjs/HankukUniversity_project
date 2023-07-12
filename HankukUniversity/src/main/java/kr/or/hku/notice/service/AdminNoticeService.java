package kr.or.hku.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.notice.vo.NoticeVO;
import kr.or.hku.notice.vo.PaginationInfoVO;

public interface AdminNoticeService {
	public List<NoticeVO> noticeList(String noticeClsf);
	public ServiceResult addNotice(NoticeVO noticeVO);
	public NoticeVO getNoticeOne(int noticeNo);
	public int updateNotice(NoticeVO noticeVO);
	public int deleteNotice(int noticeNo);
	public List<NoticeVO> noticeList2(Map<String, String> map);
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO);
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO);
}
