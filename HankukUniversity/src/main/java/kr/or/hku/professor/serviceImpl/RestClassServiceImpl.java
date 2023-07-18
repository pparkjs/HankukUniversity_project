package kr.or.hku.professor.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.lectureInfo.vo.LectureTimeTableVO;
import kr.or.hku.professor.mapper.RestClassMapper;
import kr.or.hku.professor.service.RestClassService;
@Service
public class RestClassServiceImpl implements RestClassService {
	
	@Autowired
	RestClassMapper restClassMapper;

	@Override
	public List<LectureTimeTableVO> getMyTimetable(String proNo) {
		// TODO Auto-generated method stub
		return restClassMapper.getMyTimetable(proNo);
	}
	
	@Override
	public LectureTimeTableVO setRestTable(Map<String,String> myMap) {
		LectureTimeTableVO myTable = restClassMapper.setRestTable(myMap);
		return myTable;
	}
	
	@Override
	public ServiceResult insertRestTable(Map<String, String> myMap) {
		int res = restClassMapper.insertRestTable(myMap);
		ServiceResult result;
		if(res > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public int ifSameData(Map<String, String> myMap) {
		int res = Integer.parseInt(restClassMapper.ifSameData(myMap));
		return res;
	}
	
	@Override
	public int deleteRestTable(String subclNo) {
		int res = restClassMapper.deleteRestTable(subclNo);
		return res;
	}
}
