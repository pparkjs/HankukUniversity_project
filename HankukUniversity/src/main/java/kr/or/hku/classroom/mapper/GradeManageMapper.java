package kr.or.hku.classroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.GradeVO;

@Mapper
public interface GradeManageMapper {
	
	// 학생 리스트
	public List<GradeVO> getStdList(String lecapNo);
	
	// 성적 확정
	public ServiceResult confirmScore(GradeVO vo);
	
	// 성적수정
	public GradeVO modifyScore(Map<String, String> myMap);
	
	// 시험번호 가져오기
	public List<Map<String, String>> getTestNos(GradeVO vo);
	
	// 중간점수 확정
	public int confirmMiddleScore(GradeVO vo);
	
	// 기말점수 확정
	public int confirmFinalScore(GradeVO vo);
	
	// 최종점수 확정
	public int confirmRealScore(GradeVO vo);
	
	
}
