package kr.or.hku.classroom.service;

import java.util.List;

import kr.or.hku.classroom.vo.AssignmentVO;

public interface AssignmentService {
	public List<AssignmentVO> assignList(String proNm);
	public AssignmentVO detail(String proNo);
	public int regi(AssignmentVO assignmentVO);
	public int update(AssignmentVO assignmentVO);
	public int delete(String proNo);
}
