package kr.or.hku.mypage.service.impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.ServiceResult;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.mypage.mapper.MypageMapper;
import kr.or.hku.mypage.service.IMypageService;
import kr.or.hku.student.vo.StudentVO;

@Service
public class MypageServiceImpl implements IMypageService {
	
	@Autowired
	private MypageMapper mypageMapper;
	
	@Autowired
	private CommonFileService fileService;
	
	@Inject
	BCryptPasswordEncoder pe;
	
	@Override
	public StudentVO detailInfo(String stdNo) {
		return mypageMapper.detailInfo(stdNo);
	}
	
	@Override
	public int myInfo(StudentVO studentVO) {
		return mypageMapper.myInfo(studentVO);
	}
	
	@Override
	public boolean checkPassword(UsersVO usersVO) {
		UsersVO user = mypageMapper.loginUser(usersVO.getUserNo());
		return pe.matches(usersVO.getUserPw(), user.getUserPw());
	}

	@Override
	public int modifyInfo(StudentVO vo) {
		MultipartFile stdMultipartFile = vo.getStdMultipartFile();
		if (stdMultipartFile != null && stdMultipartFile.getSize() > 0) {
			String profilePath = fileService.updateProfile(stdMultipartFile);
			vo.setStdProfilePath(profilePath);
		}
		return mypageMapper.modifyInfo(vo);
	}


	@Override
	public int changePassword(Map<String, String> map) {
		return mypageMapper.changePassword(map);
	}

	@Override
	public ServiceResult updateProfile(StudentVO vo) {
		return mypageMapper.updateProfile(vo);
	}


	


}
