package kr.or.hku.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mapper.common.CommonMapper;
import kr.or.hku.vo.CommonVO;

@Service
public class CommonServiceImpl implements ICommonService{
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public List<CommonVO> getAllCommonData() {
		return commonMapper.getAllCommonData();
	}

}
