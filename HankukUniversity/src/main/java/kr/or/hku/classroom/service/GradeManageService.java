package kr.or.hku.classroom.service;

import java.util.List;

import kr.or.hku.classroom.vo.GradeVO;

public interface GradeManageService {
	
	// 성적 페이지 학생 리스트 불러오기
	public List<GradeVO> getStdList(String lecapNo); 
	 
	 

}
