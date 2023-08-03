package kr.or.hku.mypage.service;

import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.student.vo.StudentVO;


public interface IMypageService {

	public StudentVO detailInfo(String stdNo);
	public int myInfo(StudentVO studentVO);
	public boolean checkPassword(UsersVO usersVO);
	public int modifyInfo(StudentVO vo);
	public int changePassword(Map<String, String> map);
	public ServiceResult updateProfile(StudentVO vo);
}
