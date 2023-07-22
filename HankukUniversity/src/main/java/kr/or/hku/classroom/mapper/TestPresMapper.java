package kr.or.hku.classroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.StudentAnswerVO;
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
	public List<TestVO> getTestList(String stdNo);
	public List<TestAnswerVO> getAnswerList(TestVO test);
	public int getMaxCh(TestVO test);
	public int testTakeInsert(TestVO test);
	public void studentTestAnswerInsert(StudentAnswerVO sAnsVO);
	public int scoreUpdate(Map<String, Object> map);
	public int preTestCheck(Map<String, Object> map);
	public TestVO getTtNo(TestVO test);
	public List<StudentAnswerVO> getStuAnsList(int ttNo);
}
