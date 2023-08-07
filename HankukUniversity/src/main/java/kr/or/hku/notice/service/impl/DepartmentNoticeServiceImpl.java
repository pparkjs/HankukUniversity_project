package kr.or.hku.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.notice.mapper.DepartmentNoticeMapper;
import kr.or.hku.notice.service.DepartmentNoticeService;
import kr.or.hku.notice.vo.DeptNoticeVO;
import kr.or.hku.notice.vo.PaginationInfoVO;

@Service
public class DepartmentNoticeServiceImpl implements DepartmentNoticeService {

	@Autowired
	private DepartmentNoticeMapper deptNoticeMapper;

	@Override
	public List<Map<String, Object>> getCollege() {
		return deptNoticeMapper.getCollege();
	}

	@Override
	public List<Map<String, Object>> getDeptList(String colData) {
		return deptNoticeMapper.getDeptList(colData);
	}

	@Override
	public int selectDeptNoticeCount(PaginationInfoVO<DeptNoticeVO> pagingVO) {
		return deptNoticeMapper.selectDeptNoticeCount(pagingVO);
	}

	@Override
	public List<DeptNoticeVO> selectDeptNoticeList(PaginationInfoVO<DeptNoticeVO> pagingVO) {
		return deptNoticeMapper.selectDeptNoticeList(pagingVO);
	}

	@Override
	public DeptNoticeVO deptNoticeDetail(int depntNo) {
		deptNoticeMapper.incrementReadCnt(depntNo);
		return deptNoticeMapper.deptNoticeDetail(depntNo);
	}

	@Override
	public ServiceResult insertDeptNotice(DeptNoticeVO deptNoticeVO) {
		ServiceResult res = null;
		int cnt = deptNoticeMapper.insertDeptNotice(deptNoticeVO);
		if (cnt > 0) {
			res = ServiceResult.OK;
		} else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public int updateDeptNotice(DeptNoticeVO deptNoticeVO) {
		return deptNoticeMapper.updateDeptNotice(deptNoticeVO);
	}
	
	@Override
	public int deleteDeptNotice(int depntNo) {
		return deptNoticeMapper.deleteDeptNotice(depntNo);
	}

}
