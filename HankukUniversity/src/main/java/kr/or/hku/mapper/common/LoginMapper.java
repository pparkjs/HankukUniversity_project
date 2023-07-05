package kr.or.hku.mapper.common;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.vo.EmployeeVO;
import kr.or.hku.vo.ProfessorVO;
import kr.or.hku.vo.StudentVO;
import kr.or.hku.vo.UsersVO;

@Mapper
public interface LoginMapper {

	public UsersVO loginUser(UsersVO usersVo);

	public StudentVO studentUser(String userNo);

	public ProfessorVO professorUser(String userNo);

	public EmployeeVO employeeUser(String userNo);
	
	
}
