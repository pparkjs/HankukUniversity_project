package kr.or.hku.mapper.admin;

import java.util.List;

import kr.or.hku.vo.NoticeVO;

public interface AdminNoticeMapper {
	public int addNotice(NoticeVO noticeVO);
	public List<NoticeVO> noticeList();
	public NoticeVO getNoticeOne(int noticeNo);
	public void incrementNotice(int noticeNo);
}
