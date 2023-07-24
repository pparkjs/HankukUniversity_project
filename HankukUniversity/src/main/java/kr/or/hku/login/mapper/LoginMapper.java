package kr.or.hku.login.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.EmployeeVO;
import kr.or.hku.login.vo.ApiVO;
import kr.or.hku.login.vo.SecUserVO;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;

@Mapper
public interface LoginMapper {

	public UsersVO loginUser(String username);

	public StudentVO studentUser(String userNo);

	public ProfessorVO professorUser(String userNo);

	public EmployeeVO employeeUser(String userNo);
	

	public SecUserVO readByUserNo(UsersVO uVO);

	// 접속 요청한 사용자의 권한 구분을 조회
	public String selectUserClsCd(String username);

	public String forgetProcess(Map<String, String> map);

	public int getIsEmail(Map<String, String> map);

	public ApiVO getAuthInfo(String string);

	public int updatePw(UsersVO user);

	public int changePassword(Map<String, String> map);

	public String selectUserPw(String userNo);
	
	
}
