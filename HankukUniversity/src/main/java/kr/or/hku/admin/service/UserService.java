package kr.or.hku.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.admin.vo.SmsTemplateVO;
import kr.or.hku.admin.vo.SmsVO;
import kr.or.hku.admin.vo.UserVO;
import kr.or.hku.common.vo.SearchInfoVO;

public interface UserService {

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

	public List<Map<String, String>> getDeptList();

	public List<Map<String, String>> getEmpDeptList();

	public List<Map<String, String>> getStdList(Map<String, String> paramMap);

	public List<Map<String, String>> getProList(Map<String, String> paramMap);

	public List<Map<String, String>> getEmpList(Map<String, String> paramMap);

	public List<SmsTemplateVO> getSmsTemplateList();

	public SmsTemplateVO settingMsg(SmsTemplateVO paramVO);

	public int sendMsgStatus(Map<String, Object> map);

	public String getMyName(String username);

	public List<SmsVO> getSmsDetailList();


}
