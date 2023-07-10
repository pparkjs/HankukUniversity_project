package kr.or.hku.lectureInfo.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.lectureInfo.vo.CartVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;

public interface CourseInfoService {
	public List<SubjectVO> getList(Map<String, Object> map);
	public List<DepartmentVO> getAllDept();
	public List<LectureAplyVO> getLecture(Map<String, Object> map);
	public ServiceResult cartInsert(CartVO cart);
	public List<CartVO> cartList(String stdNo);
	public ServiceResult cartCancle(Map<String, Object> map);
	public ServiceResult cartRegister(Map<String, Object> map);
}
