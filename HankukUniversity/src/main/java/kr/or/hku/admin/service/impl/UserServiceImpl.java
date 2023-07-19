package kr.or.hku.admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.admin.mapper.UserMapper;
import kr.or.hku.admin.service.UserService;
import kr.or.hku.admin.vo.UserVO;
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
	public int insertUser(UserVO userVO) {
		return mapper.insertUser(userVO);
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
		
		String proFileImg = "";		// memberVO안에 프로필 이미지 경로를 담을 변수
		MultipartFile proFileImgFile = userVO.getProfile();
		log.info("원본파일 이름 : " + proFileImgFile.getOriginalFilename());
		if(proFileImgFile.getOriginalFilename() != null && !proFileImgFile.getOriginalFilename().equals("")) {
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + proFileImgFile.getOriginalFilename();
			
			uploadPath += "/" + fileName;
			
			try {
				proFileImgFile.transferTo(new File(uploadPath));	// 파일 복사
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			proFileImg = resourcePath+ "/" + fileName;
		}
		return proFileImg;
	}

	@Override
	public int insertUserAuth(UserVO userVO) {
		return mapper.insertUserAuth(userVO);
	}

	@Override
	public List<UserVO> getAllUsers() {
		return mapper.getAllUsers();
	}

	@Override
	public List<UserVO> getAllStudents() {
		return mapper.getAllStudents();
	}

	@Override
	public List<UserVO> getAllProfessors() {
		return mapper.getAllProfessors();
	}

	@Override
	public List<UserVO> getAllAdmins() {
		return mapper.getAllAdmins();
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

}
