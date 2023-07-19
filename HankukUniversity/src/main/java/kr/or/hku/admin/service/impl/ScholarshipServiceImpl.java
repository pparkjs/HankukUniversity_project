package kr.or.hku.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.ScholarshipMapper;
import kr.or.hku.admin.service.ScholarshipService;
import kr.or.hku.admin.vo.ScholarshipVO;

@Service
public class ScholarshipServiceImpl implements ScholarshipService {

	@Autowired
	private ScholarshipMapper scholarshipMapper;

	@Override
	public List<ScholarshipVO> getSclsList() {
		return scholarshipMapper.getSclsList();
	}

	@Override
	public int modifyScls(ScholarshipVO sclsVO) {
		return scholarshipMapper.modifyScls(sclsVO);
	}

	@Override
	public int insertScls(ScholarshipVO sclsVO) {
		return scholarshipMapper.insertScls(sclsVO);
	}

	@Override
	public int deleteScls(Map<String, Object> map) {
		return scholarshipMapper.deleteScls(map);
	}
}
