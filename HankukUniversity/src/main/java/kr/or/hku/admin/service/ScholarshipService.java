package kr.or.hku.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.admin.vo.ScholarshipVO;

public interface ScholarshipService {
	public List<ScholarshipVO> getSclsList();
	public int modifyScls(ScholarshipVO sclsVO);
	public int insertScls(ScholarshipVO sclsVO);
	public int deleteScls(Map<String, Object> map);
}
