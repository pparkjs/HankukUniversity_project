package kr.or.hku.login.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.vo.EmployeeVO;
import kr.or.hku.login.mapper.LoginMapper;
import kr.or.hku.login.service.ILoginService;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;

@Service
public class LoginServiceImpl implements ILoginService {
	@Autowired
	private LoginMapper loginMapper;
	@Override
	public UsersVO loginUser(UsersVO usersVo) {
		return loginMapper.loginUser(usersVo);
	}
	@Override
	public StudentVO studentUser(String userNo) {
		return loginMapper.studentUser(userNo);
	}
	@Override
	public ProfessorVO professorUser(String userNo) {
		// TODO Auto-generated method stub
		return loginMapper.professorUser(userNo);
	}

	@Override
	public EmployeeVO employeeUser(String userNo) {
		// TODO Auto-generated method stub
		return loginMapper.employeeUser(userNo);
	}
}
