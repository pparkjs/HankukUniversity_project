package kr.or.hku.mypage.service;

import kr.or.hku.student.vo.StudentVO;

public interface IMypageService {

	public StudentVO detailInfo(String stdNo);
	public int updateInfo(StudentVO studentVO);
}
