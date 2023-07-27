package kr.or.hku.student.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.TuitionVO;

public interface TuitionService {

	public List<TuitionVO> selectTuitionList(StudentVO vo);

	public String tuitionCertifi(HashMap<String, String> tutCertifiMap, HttpServletRequest request);

	public TuitionVO selectTuition(String stdNo);

	public String tuiBillPrint(HashMap<String, String> tutBillMap, HttpServletRequest request);

}
