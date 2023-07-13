package kr.or.hku.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.LecAplyAdminMapper;
import kr.or.hku.admin.service.LecAplyAdminService;
import kr.or.hku.admin.vo.LectureBasicVO;
import kr.or.hku.admin.vo.LectureProgramVO;

@Service
public class LecAplyAdminServiceImpl implements LecAplyAdminService{
	
	@Autowired
	private LecAplyAdminMapper lecApAdminMapper;
	
	@Override
	public List<Map<String, Object>> getLecApList() {
		return lecApAdminMapper.getLecApList();
	}
	
	@Override
	public LectureBasicVO getLecBasicOne(int lecApNo) {
		return lecApAdminMapper.getLecBasicOne(lecApNo);
	}
	
	@Override
	public LectureProgramVO getLecProgam(int lecApNo) {
		return lecApAdminMapper.getLecProgam(lecApNo);
	}
}
