package kr.or.hku.mapper.admin;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.or.hku.notice.mapper.AdminNoticeMapper;
import kr.or.hku.notice.vo.NoticeVO;

//Junit5 사용
@ExtendWith(SpringExtension.class)
//Context설정파일 지정 classpath를 사용해도 됨
@ContextConfiguration("file:src/test/resources/root-context.xml")
public class AdminNoticeMapperTest {

	@Autowired
	private AdminNoticeMapper noticeMapper;
	
	@Test
	public void addNoticeTest() {
		
		
		for (int i = 2; i <= 22; i++) {
			NoticeVO noticeVO = new NoticeVO();
			noticeVO.setNoticeTtl("제목" + i);
			noticeVO.setNoticeCn("내용" + i);
			noticeVO.setNoticeWrtrNm("관리자");
			noticeVO.setNoticeClsf("uni");
			assertEquals(1, noticeMapper.addNotice(noticeVO));
		}
		
		
	}
}
