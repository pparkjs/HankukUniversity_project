package kr.or.hku.service.student;

import kr.or.hku.vo.StudentVO;

public interface IMypageService {

	public StudentVO detailInfo(String stdNo);
	public int updateInfo(StudentVO studentVO);
}
