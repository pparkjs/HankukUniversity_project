package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.AssignmentVO;

@Mapper
public interface AssignmentMapper {
	// 과제 
	public List<AssignmentVO> assignList(String proNm);
	public AssignmentVO detail(String proNo);
	public int regi(AssignmentVO assignmentVO);
	public int update(AssignmentVO assignmentVO);
	public int delete(String proNo);
	
	// 과제제출
	public int assignSubmit();	 
	
	// 알람
	public int alarm(String userNo);
	
}
