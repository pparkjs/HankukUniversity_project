package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.AssignmentVO;

@Mapper
public interface AssignmentMapper {
	// 과제테이블
	public List<AssignmentVO> assignList(String lecapNo);
	public AssignmentVO detail(String lecapNo);
	public ServiceResult regi(AssignmentVO assignVO);
	public int update(AssignmentVO assignmentVO);
	public int delete(String proNo);
	public AssignmentVO getAssignOne(int lecapNo);
	
	// 과제제출테이블
	public int assignSubmit();	 
	
	// 알람테이블
	public int alarm(String userNo);
	
}
