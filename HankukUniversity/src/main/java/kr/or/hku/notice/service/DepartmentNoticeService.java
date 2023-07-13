package kr.or.hku.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.notice.vo.DeptNoticeVO;
import kr.or.hku.notice.vo.PaginationInfoVO;

public interface DepartmentNoticeService {

	public List<Map<String, Object>> getCollege();

	public List<Map<String, Object>> getDeptList(String colData);

	public int selectDeptNoticeCount(PaginationInfoVO<DeptNoticeVO> pagingVO);

	public List<DeptNoticeVO> selectDeptNoticeList(PaginationInfoVO<DeptNoticeVO> pagingVO);

	public DeptNoticeVO deptNoticeDetail(int depntNo);

	public ServiceResult insertDeptNotice(DeptNoticeVO deptNoticeVO);

	public int updateDeptNotice(DeptNoticeVO deptNoticeVO);

	public int deleteDeptNotice(int depntNo);

}
