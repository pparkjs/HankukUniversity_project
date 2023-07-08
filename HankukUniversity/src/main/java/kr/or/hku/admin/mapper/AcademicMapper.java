package kr.or.hku.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.common.vo.SearchInfoVO;

@Mapper
public interface AcademicMapper {
	public List<DepartmentVO> selectDepartment(SearchInfoVO searchInfoVO);

	public int deleteDept(String deptCd);
}
