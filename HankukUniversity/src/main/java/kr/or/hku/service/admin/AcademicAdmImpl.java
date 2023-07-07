package kr.or.hku.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mapper.admin.AcademicMapper;
import kr.or.hku.vo.DepartmentVO;

@Service
public class AcademicAdmImpl implements IAcademicAdm {
	
	@Autowired
	private AcademicMapper mapper;

	@Override
	public List<DepartmentVO> selectDepartment() {
		return mapper.selectDepartment();
	}

}
