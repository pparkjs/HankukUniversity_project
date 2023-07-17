package kr.or.hku.admin.service;

import java.util.List;

import kr.or.hku.admin.vo.UserVO;

public interface UserService {

	public int insertUser(UserVO userVO);

	public int insertStudent(UserVO userVO);

	public int insertProfessor(UserVO userVO);

	public int insertEmployee(UserVO userVO);

	public int insertUserAuth(UserVO userVO);

	public List<UserVO> getAllUsers();

	public List<UserVO> getAllStudents();

	public List<UserVO> getAllProfessors();

	public List<UserVO> getAllAdmins();

	public int deleteUser(String userNo);

	public int deleteEmployee(String userNo);

	public int deleteProfessor(String userNo);

	public int deleteStudent(String userNo);

	public int deleteAuth(String userNo);


}
