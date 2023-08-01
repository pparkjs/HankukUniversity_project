package kr.or.hku.student.service;

import java.util.HashMap;
import java.util.List;

import kr.or.hku.admin.vo.ScholarshipVO;
import kr.or.hku.student.vo.SclsApPayVO;
import kr.or.hku.student.vo.StdScholarshipVO;

public interface StdScholarshipService {

	public List<ScholarshipVO> selectScholarList();

	public List<StdScholarshipVO> selectSclsAplyList(String stdNo);

	public int sclsAplyInsert(StdScholarshipVO sclsAplyVO);

	public StdScholarshipVO sclsAplyDetail(String sclsapNo);

	public int sclsAplyModify(StdScholarshipVO sclsAplyModiVO);

	public int deleteSclsAply(HashMap<String, String> delData);

	public List<SclsApPayVO> selectSclsapPayList(HashMap<String, String> sclsapPaySearchData);

}
