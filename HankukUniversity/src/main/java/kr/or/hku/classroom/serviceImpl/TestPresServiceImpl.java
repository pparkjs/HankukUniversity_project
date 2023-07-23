package kr.or.hku.classroom.serviceImpl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.mapper.TestPresMapper;
import kr.or.hku.classroom.service.TestPresService;
import kr.or.hku.classroom.vo.StudentAnswerVO;
import kr.or.hku.classroom.vo.TestAnswerVO;
import kr.or.hku.classroom.vo.TestVO;

@Service
public class TestPresServiceImpl implements TestPresService {
	
	@Autowired
	private TestPresMapper testPresMapper;
	
	@Transactional(rollbackFor = SQLException.class)
	@Override
	public ServiceResult testInsert(TestVO test) {
		ServiceResult result = null;
		
		// 이미 출제한 시험인지 체크
		int check = testPresMapper.testCheck(test);
		
		if(check > 0) {
			result = ServiceResult.EXIST;
		}else {
			
			// 시험 테이블에 등록
			int cnt = testPresMapper.testInsert(test);
			
			for(TestAnswerVO answer : test.getAnswerList()) {
				answer.setLecapNo(test.getLecapNo());
				answer.setTestNo(test.getTestNo());
				testPresMapper.testAnswerInsert(answer);
			}
			
			if(cnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
			
		}
		
		return result;
	}
	
	@Override
	public int testCheck(TestVO test) {
		return testPresMapper.testCheck(test);
	}

	@Override
	public TestVO testDetail(TestVO test) {
		TestVO vo = testPresMapper.testDetail(test);
		if(vo.getTestSe().equals("middle")) {
			vo.setTestSe("중간고사");
		}else {
			vo.setTestSe("기말고사");
		}
		
		TestVO testVO = timeChange(vo);
		
		return testVO;
	}
	

	@Transactional(rollbackFor = SQLException.class)
	@Override
	public ServiceResult testUpdate(TestVO test) {
		ServiceResult result = null;
		// 시험 테이블 수정
		int cnt = testPresMapper.testUpdate(test);
		
		
		// 먼저 정답테이블에 있는거 삭제후 수정 이루어짐
		testPresMapper.testAnswerDelete(test.getTestNo());
		
		for(TestAnswerVO answer : test.getAnswerList()) {
			answer.setLecapNo(test.getLecapNo());
			answer.setTestNo(test.getTestNo());
			testPresMapper.testAnswerInsert(answer);
		}
		
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
			
		
		return result;
	}
	
	// 초합을 시 분 초 로 나누기
	public TestVO timeChange(TestVO vo) {
		int totalSeconds = vo.getTestTimeLimit();

		int hours = totalSeconds / 3600;
		int minutes = (totalSeconds % 3600) / 60;
		int seconds = totalSeconds % 60;

		System.out.println("시: " + hours);
		System.out.println("분: " + minutes);
		System.out.println("초: " + seconds);
		
		vo.setHours(hours);
		vo.setMinutes(minutes);
		vo.setSeconds(seconds);
		
		return vo;
	}

	@Override
	public List<TestVO> getTestList(String stdNo) {
		return testPresMapper.getTestList(stdNo);
	}

	@Override
	public List<TestAnswerVO> getAnswerList(TestVO test) {
		return testPresMapper.getAnswerList(test);
	}

	@Override
	public int getMaxCh(TestVO test) {
		return testPresMapper.getMaxCh(test);
	}

	@Override
	public int testTakeInsert(TestVO test) {
		return testPresMapper.testTakeInsert(test);
	}

	@Override
	public void studentTestAnswerInsert(StudentAnswerVO sAnsVO) {
		testPresMapper.studentTestAnswerInsert(sAnsVO);
	}

	@Override
	public int scoreUpdate(Map<String, Object> map) {
		return testPresMapper.scoreUpdate(map);
	}

	@Override
	public int preTestCheck(TestVO test) {
		return testPresMapper.preTestCheck(test);
	}

	@Override
	public TestVO getTtNo(TestVO test) {
		return testPresMapper.getTtNo(test);
	}

	@Override
	public List<StudentAnswerVO> getStuAnsList(int ttNo) {
		return testPresMapper.getStuAnsList(ttNo);
	}

}
