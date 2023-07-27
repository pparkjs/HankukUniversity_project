package kr.or.hku.admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.admin.mapper.UserMapper;
import kr.or.hku.admin.service.UserService;
import kr.or.hku.admin.vo.SmsTemplateVO;
import kr.or.hku.admin.vo.SmsVO;
import kr.or.hku.admin.vo.UserVO;
import kr.or.hku.common.vo.SearchInfoVO;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.m;

@Service
@Slf4j
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	// root-context.xml에서 설정한 uploadPath 빈등록 path 경로를 사용한다.
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	@Override
	public List<SmsVO> getSmsDetailList() {
		return mapper.getSmsDetailList();
	}
	
	@Override
	public int insertUser(UserVO userVO) {
		return mapper.insertUser(userVO);
	}
	
	@Override
	public List<SmsTemplateVO> getSmsTemplateList() {
		return mapper.getSmsTemplateList();
	}
	
	@Override
	public int sendMsgStatus(String empName) {
		return mapper.sendMsgStatus(empName);
	}
	
	@Override
	public String getMyName(String username) {
		return mapper.getMyName(username);
	}
	
	@Override
	public SmsTemplateVO settingMsg(SmsTemplateVO paramVO) {
		return mapper.settingMsg(paramVO);
	}
	
	@Override
	public List<Map<String, String>> getEmpList(Map<String, String> paramMap) {
		return mapper.getEmpList(paramMap);
	}

	@Override
	public List<Map<String, String>> getProList(Map<String, String> paramMap) {
		return mapper.getProList(paramMap);
	}

	@Override
	public List<Map<String, String>> getStdList(Map<String, String> paramMap) {
		return mapper.getStdList(paramMap);
	}
	
	@Override
	public List<Map<String, String>> getDeptList() {
		return mapper.getDeptList();
	}
	
	@Override
	public List<Map<String, String>> getEmpDeptList() {
		return mapper.getEmpDeptList();
	}

	@Override
	public int insertStudent(UserVO userVO) {
		// 현재년도 가져오기
		LocalDate now = LocalDate.now();
		int year_ = now.getYear();
		String year = year_ + "";
		userVO.setStdMtcltnYr(year);
		
		// 메서드를 활용해서 프로필 경로 받아오기
		if(userVO.getProfile() != null) {
			String proFileImg = getProfileImgPath(userVO);
			userVO.setProfilePath(proFileImg);
		}
		
		
		return mapper.insertStudent(userVO);
	}

	@Override
	public int insertProfessor(UserVO userVO) {
		String proFileImg = getProfileImgPath(userVO);
		
		userVO.setProfilePath(proFileImg);
		
		return mapper.insertProfessor(userVO);
	}
	
	@Override
	public int insertEmployee(UserVO userVO) {
		String proFileImg = getProfileImgPath(userVO);
		
		userVO.setProfilePath(proFileImg);
		
		return mapper.insertEmployee(userVO);
	}
	
	private String getProfileImgPath(UserVO userVO) {
		// 프로필 이미지 파일을 업로드할 경로 설정
		String uploadPath = resourcePath;
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String saveFileName = "";		// memberVO안에 프로필 이미지 경로를 담을 변수
		MultipartFile proFileImgFile = userVO.getProfile();
		
		log.info("원본파일 이름 : " + proFileImgFile.getOriginalFilename());
		if(proFileImgFile.getOriginalFilename() != null && !proFileImgFile.getOriginalFilename().equals("")) {
			String uuid = UUID.randomUUID().toString();
			saveFileName += "/" + uuid + "_" + proFileImgFile.getOriginalFilename();
			uploadPath += "/" + saveFileName;
			log.info("uploadPath : " + uploadPath);
			try {
				proFileImgFile.transferTo(new File(uploadPath));	// 파일 복사
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return saveFileName;
	}

	@Override
	public int insertUserAuth(UserVO userVO) {
		return mapper.insertUserAuth(userVO);
	}

	@Override
	public List<UserVO> getAllUsers(SearchInfoVO searchInfoVO) {
		return mapper.getAllUsers(searchInfoVO);
	}

	@Override
	public List<UserVO> getAllStudents(SearchInfoVO searchInfoVO) {
		return mapper.getAllStudents(searchInfoVO);
	}

	@Override
	public List<UserVO> getAllProfessors(SearchInfoVO searchInfoVO) {
		return mapper.getAllProfessors(searchInfoVO);
	}

	@Override
	public List<UserVO> getAllAdmins(SearchInfoVO searchInfoVO) {
		return mapper.getAllAdmins(searchInfoVO);
	}

	@Override
	public int deleteUser(String userNo) {
		return mapper.deleteUser(userNo);
	}

	@Override
	public int deleteEmployee(String userNo) {
		return mapper.deleteEmployee(userNo);
	}

	@Override
	public int deleteProfessor(String userNo) {
		return mapper.deleteProfessor(userNo);
	}

	@Override
	public int deleteStudent(String userNo) {
		return mapper.deleteStudent(userNo);
	}

	@Override
	public int deleteAuth(String userNo) {
		return mapper.deleteAuth(userNo);
	}

	@Override
	public UserVO studentDetail(String userNo) {
		return mapper.studentDetail(userNo);
	}

	@Override
	public UserVO professorDetail(String userNo) {
		return mapper.professorDetail(userNo);
	}

	@Override
	public UserVO employeeDetail(String userNo) {
		return mapper.employeeDetail(userNo);
	}

	@Override
	public int updateStudent(UserVO userVO) {
		String proFileImg = getProfileImgPath(userVO);
		userVO.setProfilePath(proFileImg);
		
		return mapper.updateStudent(userVO);
	}

	@Override
	public int updateProfessor(UserVO userVO) {
		String proFileImg = getProfileImgPath(userVO);
		userVO.setProfilePath(proFileImg);
		
		return mapper.updateProfessor(userVO);
	}

	@Override
	public int updateEmployee(UserVO userVO) {
		String proFileImg = getProfileImgPath(userVO);
		userVO.setProfilePath(proFileImg);
		
		return mapper.updateEmployee(userVO);
	}

}
