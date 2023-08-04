package kr.or.hku.mypage.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.ServiceResult;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.student.vo.StudentVO;


@Mapper
public interface MypageMapper {
	
	public StudentVO detailInfo(String stdNo);
	public int myInfo(StudentVO studentVO);
	public UsersVO loginUser(String userNo);
	public int modifyInfo(StudentVO vo);
	public int changePassword(Map<String, String> map);
	public ServiceResult updateProfile(StudentVO vo);
	
}
