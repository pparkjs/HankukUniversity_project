package kr.or.hku.service.common;

import kr.or.hku.vo.EmployeeVO;
import kr.or.hku.vo.ProfessorVO;
import kr.or.hku.vo.StudentVO;
import kr.or.hku.vo.UsersVO;

public interface ILoginService {
	
	public UsersVO loginUser(UsersVO userVo) ;

	public StudentVO studentUser(String userNo);

	public ProfessorVO professorUser(String userNo);

	public EmployeeVO employeeUser(String userNo);
	
}
