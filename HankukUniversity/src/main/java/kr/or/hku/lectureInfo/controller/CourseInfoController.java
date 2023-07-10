package kr.or.hku.lectureInfo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.common.service.ICommonService;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.lectureInfo.service.CourseInfoService;
import kr.or.hku.lectureInfo.vo.CartVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku")
public class CourseInfoController {
	
	@Autowired
	private CourseInfoService courseService;
	
	@Autowired
	private ICommonService commonService;
	
	//교과목정보 페이지 이동
	@GetMapping("/search-subject")
	public String subjectForm(Model model) {
		List<CommonVO> commonList = commonService.getAllCommonData();
		List<DepartmentVO> deptList = courseService.getAllDept();
		model.addAttribute("commonList", commonList);
		model.addAttribute("deptList", deptList);
		return "student/search-subject";
	}
	
	//교과목정보 리스트 가져오기  (검색포함)
	@ResponseBody
	@GetMapping("/sub-list")
	public ResponseEntity<List<SubjectVO>> getList(@RequestParam Map<String, Object> map){
		List<SubjectVO> list = courseService.getList(map);
		return new ResponseEntity<List<SubjectVO>>(list, HttpStatus.OK);
	}
	
	
	// 수강신청 페이지 이동
	@GetMapping("/course-req")
	public String courseReqForm(Model model) {
		List<CommonVO> commonList = commonService.getAllCommonData();
		List<DepartmentVO> deptList = courseService.getAllDept();
		model.addAttribute("commonList", commonList);
		model.addAttribute("deptList", deptList);
		return "student/course-req";
	}
	
	// 수강신청할 강의리스트 가져오기
	@ResponseBody
	@GetMapping("/lecture-list")
	public ResponseEntity<List<LectureAplyVO>> courseList(@RequestParam Map<String, Object> map) {
		 map.put("aprvSttsCd", "appv");
		 List<LectureAplyVO> list = courseService.getLecture(map);
		 log.info("list입니다 : "+ list);
		 return new ResponseEntity<List<LectureAplyVO>>(list, HttpStatus.OK);
	}
	
	// 장바구니에 과목 담기 
	@ResponseBody
	@PostMapping("/subject-cart")
	public ResponseEntity<String> cartInsert(@RequestBody CartVO cart){
		log.info("cart : " + cart);
		ServiceResult res = courseService.cartInsert(cart);
		
		if(res.equals(ServiceResult.EXIST)) { // 시간표가 겹치거나 이미 장바구니에 존재할 때 
			return new ResponseEntity<String>("exist", HttpStatus.OK);
		}else if(res.equals(ServiceResult.EXCEED)) { // 최대 신청 가능 학점 초과시
			return new ResponseEntity<String>("exceed", HttpStatus.OK);
		}else if(res.equals(ServiceResult.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}
	}
	
	// 장바구니 리스트 가져오기
	@ResponseBody
	@GetMapping("/cart-list")
	public ResponseEntity<List<CartVO>> cartList(String stdNo){
		
		log.info("내학번 :" +  stdNo);
		List<CartVO> list = courseService.cartList(stdNo);
		
		return new ResponseEntity<List<CartVO>>(list, HttpStatus.OK);
	}
	
	// 장바구니 취소하기
	@ResponseBody
	@GetMapping("/cart-cancle")
	public ResponseEntity<String> cartCancle(@RequestParam Map<String, Object> map){
		
		ServiceResult res = courseService.cartCancle(map);
		
		if(res.equals(ServiceResult.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}
	}
	
	// 강의신청하기
	@ResponseBody
	@GetMapping("/course-regist")
	public ResponseEntity<String> courseRegist(@RequestParam Map<String, Object> map){
		log.info("맵확인 : " + map);
		
		ServiceResult res = courseService.cartRegister(map);
		
		if(res.equals(ServiceResult.EXCEED)) { // 잔여정원 초과
			return new ResponseEntity<String>("exceed", HttpStatus.OK);
		}else if(res.equals(ServiceResult.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}
	}
	
	
}
