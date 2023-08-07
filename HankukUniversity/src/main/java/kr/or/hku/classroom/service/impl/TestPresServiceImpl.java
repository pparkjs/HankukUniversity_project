package kr.or.hku.classroom.service.impl;


import java.sql.SQLException;
import java.util.HashMap;
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
import kr.or.hku.classroom.vo.TestResultVO;
import kr.or.hku.classroom.vo.TestVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TestPresServiceImpl implements TestPresService {
	
	@Autowired
	private TestPresMapper testPresMapper;
	
	@Transactional(rollbackFor = Exception.class)
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
	

	@Transactional(rollbackFor = Exception.class)
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
	public String getAnswerList(TestVO test, List<StudentAnswerVO> studentAnsList) {
		String result = "";
		
		List<TestAnswerVO> answerList = testPresMapper.getAnswerList(test);
		log.info("모범답 : " + answerList);
		log.info("제출답 : " + studentAnsList);
		
		int scoreSum = 0;
		// 정답 체크
		for(int i = 0; i < answerList.size(); i++) {
			
			if(studentAnsList.size() <= i && studentAnsList.size() != answerList.size()) {
				result = "over"; // 답안 제출을 제한시간에 못한 경우
				break;
			}
			
			if(answerList.get(i).getTaAns().equals(studentAnsList.get(i).getStaAns())) {
				scoreSum += answerList.get(i).getTaScr();
			}
		}
		log.info("총 점수 : " + scoreSum);
		
		for (StudentAnswerVO answer : studentAnsList) {
			answer.setLecapNo(test.getLecapNo());
			answer.setTestNo(test.getTestNo());
			answer.setTtNo(test.getTtNo());
			
			testPresMapper.studentTestAnswerInsert(answer); //학생 답안 등록
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ttScr", scoreSum);
		map.put("ttNo", test.getTtNo());
		int cnt = testPresMapper.scoreUpdate(map);
		
		if(result.equals("over")) {
			return result;
		}else {
			if(cnt > 0) {
				return "success";
			}else {
				return "failed";
			}
		}
	}
	
	@Override
	public List<TestAnswerVO> getAnswerList2(TestVO test) {
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
	public TestResultVO getTtNo(TestVO test) {
		
		// 응시번호 가져오기
		TestVO vo = testPresMapper.getTtNo(test);
		
		TestResultVO result = new TestResultVO();
		
		if(vo != null) {
			int ttNo = vo.getTtNo(); //응시번호
			
			// 해당시험 답지 리스트 가져오기
			List<TestAnswerVO> ansList = testPresMapper.getAnswerList(test);
			
			List<StudentAnswerVO> stuAnsList = testPresMapper.getStuAnsList(ttNo);
			
			int answerCnt = 0;
			int wrongCnt = 0;
			// 정답 체크
			for(int i = 0; i < ansList.size(); i++) {
				
				if(stuAnsList.size() <= i && stuAnsList.size() != ansList.size()) {
					log.info("틀린 개수 전 : " + wrongCnt);
					wrongCnt = ansList.size() - answerCnt ; // 만약 제한시간에 풀지 못한 답안일경우
					log.info("틀린 개수 후 : " + wrongCnt);
					break;
				}
				
				if(ansList.get(i).getTaAns().equals(stuAnsList.get(i).getStaAns())) {
					answerCnt++;
				}else {
					wrongCnt++;
				}
			}
			
			int examTotalScore = 0; // 총점
			for(int i = 0; i < ansList.size(); i++) {
				examTotalScore += ansList.get(i).getTaScr();
			}
			
			result.setExamTotalScore(examTotalScore);
			result.setAnswerCnt(answerCnt); //맞은개수
			result.setWrongCnt(wrongCnt); // 틀린개수
			result.setTaTotal(ansList.size());// 총 문제 수 
			result.setTestDate(test.getTestBgngYmd()); //시험일자 저장
			result.setTakeDate(vo.getTtDt()); //응시일자 저장
			result.setMyScore(vo.getTtScr()); // 나의점수 저장
			
			log.info("여기 시험결과 있어요 : " + result);
		}
		return result;
	}

	@Override
	public List<StudentAnswerVO> getStuAnsList(int ttNo) {
		return testPresMapper.getStuAnsList(ttNo);
	}


}
