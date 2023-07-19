package kr.or.hku.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.ScholarshipMapper;
import kr.or.hku.admin.service.ScholarshipService;
import kr.or.hku.admin.vo.ScholarshipAplyVO;
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
	
	@Override
	public List<ScholarshipAplyVO> getAllSclsAplyList() {
		return scholarshipMapper.getAllSclsAplyList();
	}
	
	@Override
	public String handleScholarshipApplicationOutcome(Map<String, String> map) {
		String resMsg = null;
		int res = scholarshipMapper.handleScholarshipApplicationOutcome(map);
		if (res > 0) {
			if (map.get("aprvSttsCd").equals("appv")) {
				resMsg = "appvSuccess";
			}else {
				resMsg = "rejSuccess";
			}
		}
		return resMsg;
	}
}
