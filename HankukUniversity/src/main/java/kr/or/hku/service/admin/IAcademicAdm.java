package kr.or.hku.service.admin;

import java.util.List;

import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.SearchInfoVO;

public interface IAcademicAdm {

	/**
	 * 전체 학과 리스트를 가져오는 메서드
	 * @고길동
	 */
	public List<DepartmentVO> selectDepartment(SearchInfoVO searchInfoVO);

	public int deleteDept(String deptCd);

}
