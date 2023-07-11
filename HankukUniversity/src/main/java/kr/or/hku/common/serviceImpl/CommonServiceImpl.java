package kr.or.hku.common.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.common.mapper.CommonMapper;
import kr.or.hku.common.service.ICommonService;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.student.vo.StudentVO;

@Service
public class CommonServiceImpl implements ICommonService{
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public List<CommonVO> getAllCommonData() {
		return commonMapper.getAllCommonData();
	}

	@Override
	public StudentVO myAllInfo(String stdNo) {
		return commonMapper.myAllInfo(stdNo);
	}

}
