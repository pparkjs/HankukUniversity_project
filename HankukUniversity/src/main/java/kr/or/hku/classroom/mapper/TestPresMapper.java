package kr.or.hku.classroom.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.TestAnswerVO;
import kr.or.hku.classroom.vo.TestVO;

@Mapper
public interface TestPresMapper {
	public int testInsert(TestVO test);
	public int testCheck(TestVO test);
	public void testAnswerInsert(TestAnswerVO answer);
	public int middleCheck(Map<String, Object> map);
	public int finalCheck(Map<String, Object> map);
	public TestVO testDetail(TestVO test);
	public int testUpdate(TestVO test);
	public void testAnswerUpdate(TestAnswerVO answer);
	public void testAnswerDelete(String testNo);
}
