package kr.or.hku.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.AcademicMapper;
import kr.or.hku.admin.service.AcademicAdm;
import kr.or.hku.admin.vo.CollegeVO;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.admin.vo.NextCodeVO;
import kr.or.hku.common.vo.SearchInfoVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;

@Service
public class AcademicAdmImpl implements AcademicAdm {
	
	@Autowired
	private AcademicMapper mapper;

	@Override
	public List<DepartmentVO> selectDeptList(SearchInfoVO searchInfoVO) {
		return mapper.selectDeptList(searchInfoVO);
	}

	@Override
	public int deleteDept(String deptCd) {
		return mapper.deleteDept(deptCd);
	}

	@Override
	public int insertDept(DepartmentVO deptVO) {
		return mapper.insertDept(deptVO);
	}

	@Override
	public DepartmentVO selectDept(String deptCd) {
		return mapper.selectDept(deptCd);
	}

	@Override
	public int updateDept(DepartmentVO deptVO) {
		return mapper.updateDept(deptVO);
	}

	@Override
	public List<CollegeVO> colList() {
		return mapper.colList();
	}

	@Override
	public List<FacilityVO> flctList() {
		return mapper.flctList();
	}

	@Override
	public NextCodeVO deptCdSet() {
		return mapper.deptCdSet();
	}

	@Override
	public List<SubjectVO> selectSubjectList(SearchInfoVO searchInfoVO) {
		return mapper.selectSubjectList(searchInfoVO);
	}

	@Override
	public int insertSubject(SubjectVO subjectVO) {
		return mapper.insertSubject(subjectVO);
	}

	@Override
	public int deleteSubject(String subNo) {
		return mapper.deleteSubject(subNo);
	}

	@Override
	public NextCodeVO subNoSet() {
		return mapper.subNoSet();
	}

	@Override
	public SubjectVO selectSubject(String subNo) {
		return mapper.selectSubject(subNo);
	}

	@Override
	public int updateSubject(SubjectVO subjectVO) {
		return mapper.updateSubject(subjectVO);
	}

}
