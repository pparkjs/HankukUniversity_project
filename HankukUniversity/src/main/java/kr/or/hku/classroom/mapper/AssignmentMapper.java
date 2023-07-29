package kr.or.hku.classroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.AssignmentVO;

@Mapper
public interface AssignmentMapper {
	
	public List<AssignmentVO> assignList(String lecapNo);
	public AssignmentVO assignOne(String asmNo);
	public int regi(AssignmentVO vo);
	public int update(AssignmentVO vo);
	public int delete(String asmNo);
	public AssignmentVO getAssignOne(String lecapNo);
	public List<String> getStdList(String lecapNo); 
	public int giveAssignToStd(Map<String, Object> map);
	
	//과제 상세페이지 학생 리스트
	public List<AssignmentVO> getStdListByAssign(String asmNo);
	
	//과제 상세페이지 성적 부여 
	public int giveScore(AssignmentVO assignmentVO);
	
	// 학생 과제 상세
	public AssignmentVO stdAssignDetail(AssignmentVO vo);
	
	// 학생 과제 제출 
	public int assignmentSubmit(AssignmentVO vo);
	
	// 과제 제출 현황
	public List<AssignmentVO> submitList(AssignmentVO vo);
	
	// 과제 수정 
	public int modifyAssignment(AssignmentVO vo);
	
	// 과제 삭제
	public int deleteAssignment(int asmNo);

	
}
