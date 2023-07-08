package kr.or.hku.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.EmployeeVO;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;

@Mapper
public interface LoginMapper {

	public UsersVO loginUser(UsersVO usersVo);

	public StudentVO studentUser(String userNo);

	public ProfessorVO professorUser(String userNo);

	public EmployeeVO employeeUser(String userNo);
	
	
}
