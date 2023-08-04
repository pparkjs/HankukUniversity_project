package kr.or.hku.classroom.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.GradeVO;
import kr.or.hku.lectureInfo.vo.LecturePlanVO;

public interface GradeManageService {
	
	// 성적 페이지 학생 리스트 불러오기
	public List<GradeVO> getStdList(String lecapNo);
	
	// 성적 확정하기
	public ServiceResult confirmScore(GradeVO vo);
	
	// 성적 수정하기
	public GradeVO modifyScore(Map<String, String> myMap);
	
	// 시험번호 가져오기
	public List<Map<String, String>> getTestNos(GradeVO vo);

	public LecturePlanVO getPercent(String lecapNo);

	public Map<String, String> getStdAtdCnt(GradeVO gradeVO);

	public Map<String, String> getStdAsignScr(GradeVO gradeVO);
		
	
		




}
