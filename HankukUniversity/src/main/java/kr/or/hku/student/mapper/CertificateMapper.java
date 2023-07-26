package kr.or.hku.student.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.student.vo.CertificateIssuVO;
import kr.or.hku.student.vo.CertificateVO;
import kr.or.hku.student.vo.ScoreInfoVO;

@Mapper
public interface CertificateMapper {

	public List<CertificateVO> selectCertifiList();

	public List<CertificateIssuVO> selectCertifiIssuList(String stdNo);

	public String nextCtfctisNo();

	public int payInfoInsert(HashMap<String, String> payInfoMap);

	public List<String> getCompleteSemesters(String stdNo);

	public List<ScoreInfoVO> getScoreInfo(String stdNo);

}
