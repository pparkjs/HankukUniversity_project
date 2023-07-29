package kr.or.hku.classroom.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.AssignmentVO;

public interface AssignmentService {
	
	public AssignmentVO assignOne(String asmNo);
	
	public int regi(AssignmentVO assignVO, HttpSession session);
	
	public ServiceResult update(AssignmentVO vo);
	
	public int delete(String asmNo);
	
	public AssignmentVO getAssignOne(String lecapNo);
	
	public List<String> getStdList(String lecapNo);
	
	public ServiceResult giveAssignToStds(List<String> stdList, String asmNo);
	
	//과제 상세페이지 학생 리스트
	public List<AssignmentVO> getStdListByAssign(String asmNo);
	
	//과제 상세페이지 성적 부여 
	public int giveScore(AssignmentVO assignmentVO);
	
	// 학생 과제 상세페이지 
	public AssignmentVO stdAssignDetail(AssignmentVO vo);
	
	// 학생 과제 제출 
	public int assignmentSubmit(AssignmentVO vo);
	
	// 과제 제출 현황
	public List<AssignmentVO> submitList(AssignmentVO vo);

	public ServiceResult deleteAssignment(int asmNo);
	
	// 과제 수정 
	public ServiceResult modifyAssignment(AssignmentVO vo);



}
