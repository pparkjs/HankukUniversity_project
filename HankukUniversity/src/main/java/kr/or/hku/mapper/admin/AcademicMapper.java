package kr.or.hku.mapper.admin;

import java.util.List;

import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.SearchInfoVO;

public interface AcademicMapper {
	public List<DepartmentVO> selectDepartment(SearchInfoVO searchInfoVO);

	public int deleteDept(String deptCd);
}
