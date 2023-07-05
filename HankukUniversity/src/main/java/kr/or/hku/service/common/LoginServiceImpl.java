package kr.or.hku.service.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mapper.common.LoginMapper;
import kr.or.hku.vo.EmployeeVO;
import kr.or.hku.vo.ProfessorVO;
import kr.or.hku.vo.StudentVO;
import kr.or.hku.vo.UsersVO;

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
