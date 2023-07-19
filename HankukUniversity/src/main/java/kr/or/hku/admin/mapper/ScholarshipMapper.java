package kr.or.hku.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.ScholarshipAplyVO;
import kr.or.hku.admin.vo.ScholarshipVO;

@Mapper
public interface ScholarshipMapper {
	public List<ScholarshipVO> getSclsList();
	public int modifyScls(ScholarshipVO sclsVO);
	public int insertScls(ScholarshipVO sclsVO);
	public int deleteScls(Map<String, Object> map);
	public List<ScholarshipAplyVO> getAllSclsAplyList();
	public int handleScholarshipApplicationOutcome(Map<String, String> map);
}
