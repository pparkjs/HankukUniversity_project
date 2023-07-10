package kr.or.hku.lectureInfo.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.lectureInfo.mapper.CourseInfoMapper;
import kr.or.hku.lectureInfo.service.CourseInfoService;
import kr.or.hku.lectureInfo.vo.CartVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;

@Service
public class CourseInfoServiceImpl implements CourseInfoService {
	
	@Autowired
	private CourseInfoMapper courseMapper;
	
	@Override
	public List<SubjectVO> getList(Map<String, Object> map) {
		return courseMapper.getList(map);
	}
	
	@Override
	public List<DepartmentVO> getAllDept() {
		return courseMapper.getAllDept();
	}
	
	@Override
	public List<LectureAplyVO> getLecture(Map<String, Object> map) {
		return courseMapper.getLecture(map);
	}
	
	@Transactional
	@Override
	public ServiceResult cartInsert(CartVO cart) {
		ServiceResult res = null;
		
		int check = courseMapper.checkCart(cart);

		// 시간표가 겹치거나 이미 장바구니에 담긴 과목인경우
		if(check > 0) {
			res = ServiceResult.EXIST;
		}else {
			int crdSum = courseMapper.craditSum(cart);
			int subCrd = cart.getSubCrd();
			
			if(crdSum + subCrd > 19) {  // 내가 신청한 과목의 학점과 현재 장바구니에 담긴 학점 합이 19학점 넘은 경우
				res =  ServiceResult.EXCEED;
			}else {
				int cnt = courseMapper.cartInsert(cart);
				if(cnt > 0) {
					res = ServiceResult.OK;
				}else {
					res = ServiceResult.FAILED;
				}
			}
		}
		
		return res;
	}
	
	@Override
	public List<CartVO> cartList(String stdNo) {
		return courseMapper.cartList(stdNo);
	}
	
	@Transactional
	@Override
	public ServiceResult cartCancle(Map<String, Object> map) {
		ServiceResult res = null;
		
		courseMapper.courseCancle(map);
		int cnt = courseMapper.cartCancle(map);
		
		if(cnt > 0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		
		return res;
	}
	
	@Transactional
	@Override
	public ServiceResult cartRegister(Map<String, Object> map) {
		ServiceResult res = null;
		map.put("aprvSttsCd", "appv");
		
		int remainder = courseMapper.getRemainder(map);
		
		if(remainder == 0) { //  잔여정원이 0 이면 return
			res = ServiceResult.EXCEED;
		}else {
			courseMapper.cartApplUpdate(map);
			int insertCnt = courseMapper.cartRegister(map);
			
			if(insertCnt > 0) {
				res = ServiceResult.OK;
			}else {
				res = ServiceResult.FAILED;
			}
			
		}
		
		return res;
	}

	

}
