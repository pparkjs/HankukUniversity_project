package kr.or.hku.classroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.AssignmentVO;

@Mapper
public interface AssignmentMapper {
	// 과제테이블
	public List<AssignmentVO> assignList(String lecapNo);
	public AssignmentVO assignOne(String asmNo);
	public int regi(AssignmentVO vo);
	public int update(AssignmentVO vo);
	public int delete(String lecapNo);
	public AssignmentVO getAssignOne(String lecapNo);
	public List<String> getStdList(String lecapNo); 
	public int giveAssignToStd(Map<String, Object> map);
	
	//과제 상세페이지 학생 리스트
	public List<AssignmentVO> getStdListByAssign(String asmNo);
	
	// 과제제출테이블
	public int insertAssignSubmit(AssignmentVO vo);	 
	
	// 알람테이블
	public int insertAlarm(AssignmentVO vo);
	
}
