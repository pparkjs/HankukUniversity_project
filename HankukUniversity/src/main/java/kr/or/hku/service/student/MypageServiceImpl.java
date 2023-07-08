package kr.or.hku.service.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mapper.student.StdMypageMapper;
import kr.or.hku.vo.StudentVO;

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
