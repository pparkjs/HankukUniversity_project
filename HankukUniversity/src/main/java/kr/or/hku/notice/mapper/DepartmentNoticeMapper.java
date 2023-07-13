package kr.or.hku.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.notice.vo.DeptNoticeVO;
import kr.or.hku.notice.vo.PaginationInfoVO;

@Mapper
public interface DepartmentNoticeMapper {

	public List<Map<String, Object>> getCollege();

	public List<Map<String, Object>> getDeptList(String colData);

	public int selectDeptNoticeCount(PaginationInfoVO<DeptNoticeVO> pagingVO);

	public List<DeptNoticeVO> selectDeptNoticeList(PaginationInfoVO<DeptNoticeVO> pagingVO);

	public DeptNoticeVO deptNoticeDetail(int depntNo);

	public void incrementReadCnt(int depntNo);

	public int insertDeptNotice(DeptNoticeVO deptNoticeVO);

	public int updateDeptNotice(DeptNoticeVO deptNoticeVO);

	public int deleteDeptNotice(int depntNo);

}
