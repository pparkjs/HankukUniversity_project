package kr.or.hku.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.notice.vo.NoticeVO;

@Mapper
public interface AdminNoticeMapper {
	public int addNotice(NoticeVO noticeVO);
	public List<NoticeVO> noticeList(String noticeClsf);
	public NoticeVO getNoticeOne(int noticeNo);
	public void incrementNotice(int noticeNo);
}
