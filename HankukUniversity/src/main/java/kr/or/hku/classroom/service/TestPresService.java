package kr.or.hku.classroom.service;


import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.TestVO;

public interface TestPresService {
	public ServiceResult testInsert(TestVO test);
	public int testCheck(TestVO test);
	public TestVO testDetail(TestVO test);
	public TestVO timeChange(TestVO test);
	public ServiceResult testUpdate(TestVO testVO);
}
