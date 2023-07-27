package kr.or.hku.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.ScholarshipVO;
import kr.or.hku.student.vo.StdScholarshipVO;

@Mapper
public interface StdScholarshipMapper {

	public List<ScholarshipVO> selectScholarList();

	public List<StdScholarshipVO> selectSclsAplyList(String stdNo);

	public int sclsAplyInsert(StdScholarshipVO sclsAplyVO);

	public StdScholarshipVO sclsAplyDetail(String sclsapNo);

}
