package kr.or.hku.login.service;

import kr.or.hku.admin.vo.EmployeeVO;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;

public interface ILoginService {
	
	public UsersVO loginUser(String username) ;

	public StudentVO studentUser(String userNo);

	public ProfessorVO professorUser(String userNo);

	public EmployeeVO employeeUser(String userNo);
	

}
