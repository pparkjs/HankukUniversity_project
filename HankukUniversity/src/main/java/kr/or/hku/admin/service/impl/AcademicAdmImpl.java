package kr.or.hku.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.AcademicMapper;
import kr.or.hku.admin.service.IAcademicAdm;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.common.vo.SearchInfoVO;

@Service
public class AcademicAdmImpl implements IAcademicAdm {
	
	@Autowired
	private AcademicMapper mapper;

	@Override
	public List<DepartmentVO> selectDepartment(SearchInfoVO searchInfoVO) {
		return mapper.selectDepartment(searchInfoVO);
	}

	@Override
	public int deleteDept(String deptCd) {
		return mapper.deleteDept(deptCd);
	}

}
