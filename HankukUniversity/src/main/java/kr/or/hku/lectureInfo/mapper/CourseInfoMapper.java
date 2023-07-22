package kr.or.hku.lectureInfo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.lectureInfo.vo.CartVO;
import kr.or.hku.lectureInfo.vo.CourseRegistVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;

@Mapper
public interface CourseInfoMapper {
	public List<SubjectVO> getList(Map<String, Object> map);
	public List<DepartmentVO> getAllDept();
	public List<LectureAplyVO> getLecture(Map<String, Object> map);
	public int cartInsert(CartVO cart);
	public int checkCart(CartVO cart);
	public List<CartVO> cartList(String stdNo);
	public int cartCancle(Map<String, Object> map);
	public int craditSum(CartVO cart);
	public int cartApplUpdate(Map<String, Object> map);
	public int cartRegister(Map<String, Object> map);
	public void courseCancle(Map<String, Object> map);
	public int getRemainder(Map<String, Object> map);
	public List<CourseRegistVO> craditHistory(String stdNo);
	public List<CourseRegistVO> getSubRecord(CourseRegistVO vo);
	public List<LectureAplyVO> getPresentList(Map<String, Object> map);
	public void attendInsert(Map<String, Object> map);
}
