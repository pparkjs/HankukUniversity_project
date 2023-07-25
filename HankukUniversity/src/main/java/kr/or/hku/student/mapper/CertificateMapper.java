package kr.or.hku.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.student.vo.CertificateIssuVO;
import kr.or.hku.student.vo.CertificateVO;

@Mapper
public interface CertificateMapper {

	public List<CertificateVO> selectCertifiList();

	public List<CertificateIssuVO> selectCertifiIssuList();

}
