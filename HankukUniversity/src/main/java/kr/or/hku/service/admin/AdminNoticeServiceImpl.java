package kr.or.hku.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mapper.admin.AdminNoticeMapper;
import kr.or.hku.vo.NoticeVO;

@Service
public class AdminNoticeServiceImpl implements IAdminNoticeService{
	
	@Autowired
	private AdminNoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVO> noticeList() {
		return noticeMapper.noticeList();
	}
	
}
