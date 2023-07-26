package kr.or.hku.student.service;

import java.util.HashMap;
import java.util.List;

import kr.or.hku.student.vo.CertificateIssuVO;
import kr.or.hku.student.vo.CertificateVO;

public interface CertificateService {

	public List<CertificateVO> selectCertifiList();

	public List<CertificateIssuVO> selectCertifiIssuList(String stdNo);

	public String jahakCertifiPrint(HashMap<String, String> certifiMap);

	public String sungjukCertifiPrint(HashMap<String, String> certifiMap);

	public String jolupCertifiPrint(HashMap<String, String> certifiMap);

	public String nextCtfctisNo();

	public int payInfoInsert(HashMap<String, String> payInfoMap);

}
