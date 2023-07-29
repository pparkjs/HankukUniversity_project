package kr.or.hku.student.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.ScholarshipVO;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.student.vo.SclsApPayVO;
import kr.or.hku.student.vo.StdScholarshipVO;

@Mapper
public interface StdScholarshipMapper {

	public List<ScholarshipVO> selectScholarList();

	public List<StdScholarshipVO> selectSclsAplyList(String stdNo);

	public int sclsAplyInsert(StdScholarshipVO sclsAplyVO);

	public StdScholarshipVO sclsAplyDetail(String sclsapNo);

	public AttachFileVO getAtchFileInfo(HashMap<String, String> hashMap);

	public void deleteSclsAplyFile(HashMap<String, String> hashMap);

	public List<AttachFileVO> getAtchFileInfoList(String atchFileNo);

	public int deleteSclsAplyFile2(String atchFileNo);

	public int deleteSclsAply(String sclsapNo);

	public List<SclsApPayVO> selectSclsapPayList(HashMap<String, String> sclsapPaySearchData);

}
