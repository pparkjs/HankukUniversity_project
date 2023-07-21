package kr.or.hku.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.ClassCancelledMapper;
import kr.or.hku.admin.service.ClassCancelledService;
import kr.or.hku.admin.vo.StudentVO;
import kr.or.hku.admin.vo.SubjectCancelVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ClassCancelledServiceImpl implements ClassCancelledService {
	
	@Autowired
	private ClassCancelledMapper classCancelledMapper;
	
	@Override
	public List<SubjectCancelVO> getClassCancelledList() {
		return classCancelledMapper.getClassCancelledList();
	}
	
	@Override
	public List<StudentVO> getStdInLecture(Map<String, String> map) {
		return classCancelledMapper.getStdInLecture(map);
	}
	
	@Override
	public void calcelProccess(String subclNo) {
		classCancelledMapper.addTextDetail(subclNo);
		classCancelledMapper.calcelProccess(subclNo);
	}
	
	@Override
	public List<Map<String, String>> getTextDetail() {
		return classCancelledMapper.getTextDetail();
	}
}
