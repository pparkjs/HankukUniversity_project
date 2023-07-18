package kr.or.hku.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mypage.mapper.StdMypageMapper;
import kr.or.hku.mypage.service.IMypageService;
import kr.or.hku.student.vo.StudentVO;

@Service
public class MypageServiceImpl implements IMypageService {
	
	@Autowired
	private StdMypageMapper mypageMapper;
	
	@Override
	public StudentVO detailInfo(String stdNo) {
		return mypageMapper.detailInfo(stdNo);
	}
	
	@Override
	public int updateInfo(StudentVO studentVO) {
		return mypageMapper.updateInfo(studentVO);
	}


}
