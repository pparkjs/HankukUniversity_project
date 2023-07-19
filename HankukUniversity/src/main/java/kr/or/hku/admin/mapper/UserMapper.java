package kr.or.hku.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.UserVO;
import kr.or.hku.common.vo.SearchInfoVO;

@Mapper
public interface UserMapper {

	public int insertUser(UserVO userVO);

	public int insertStudent(UserVO userVO);

	public int insertProfessor(UserVO userVO);

	public int insertEmployee(UserVO userVO);

	public int insertUserAuth(UserVO userVO);

	public List<UserVO> getAllUsers(SearchInfoVO searchInfoVO);

	public List<UserVO> getAllStudents(SearchInfoVO searchInfoVO);

	public List<UserVO> getAllProfessors(SearchInfoVO searchInfoVO);

	public List<UserVO> getAllAdmins(SearchInfoVO searchInfoVO);

	public int deleteUser(String userNo);

	public int deleteEmployee(String userNo);

	public int deleteProfessor(String userNo);

	public int deleteStudent(String userNo);

	public int deleteAuth(String userNo);

	public UserVO studentDetail(String userNo);

	public UserVO professorDetail(String userNo);

	public UserVO employeeDetail(String userNo);

	public int updateStudent(UserVO userVO);

	public int updateProfessor(UserVO userVO);

	public int updateEmployee(UserVO userVO);

}
