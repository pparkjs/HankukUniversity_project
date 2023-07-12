package kr.or.hku.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.notice.vo.NoticeVO;
import kr.or.hku.notice.vo.PaginationInfoVO;

@Mapper
public interface AdminNoticeMapper {
	public int addNotice(NoticeVO noticeVO);
	public List<NoticeVO> noticeList(String noticeClsf);
	public NoticeVO getNoticeOne(int noticeNo);
	public void incrementNotice(int noticeNo);
	public int updateNotice(NoticeVO noticeVO);
	public int deleteNotice(int noticeNo);
	public List<NoticeVO> noticeList2(Map<String, String> map);
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO);
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO);
}
