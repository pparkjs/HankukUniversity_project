package kr.or.hku.classroom.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.AssignmentVO;

public interface AssignmentService {
	
	public AssignmentVO assignOne(String asmNo);
	
	public int regi(AssignmentVO assignVO);
	
	public ServiceResult update(AssignmentVO vo);
	
	public int delete(String asmNo);
	
	public AssignmentVO getAssignOne(String lecapNo);
	
	public List<String> getStdList(String lecapNo);
	
	public ServiceResult giveAssignToStds(List<String> stdList, String asmNo);
	
	//과제 상세페이지 학생 리스트
	public List<AssignmentVO> getStdListByAssign(String asmNo);
	
	//과제 상세페이지 성적 부여 
	public int giveScore(AssignmentVO assignmentVO);
	
	// 과제 등록 시 알람테이블에 정보 insert
	//	public int insertAlarm();
	
	// 학생 과제 상세페이지 
	public AssignmentVO stdAssignDetail(AssignmentVO vo);
	
	// 학생 과제 제출 
	public int assignmentSubmit(AssignmentVO vo);



}
