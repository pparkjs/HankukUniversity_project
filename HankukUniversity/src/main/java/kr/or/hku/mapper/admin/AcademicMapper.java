package kr.or.hku.mapper.admin;

import java.util.List;

import kr.or.hku.vo.DepartmentVO;

public interface AcademicMapper {
	public List<DepartmentVO> selectDepartment();
}
