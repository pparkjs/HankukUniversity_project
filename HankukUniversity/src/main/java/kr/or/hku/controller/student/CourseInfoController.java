package kr.or.hku.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.hku.service.student.ICourseInfoService;
import kr.or.hku.vo.SubjectVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku/student")
public class CourseInfoController {
	
	@Autowired
	private ICourseInfoService courseService;
	
	@GetMapping("/search-subject")
	public String subjectForm() {
		return "student/search-subject";
	}
	
	@ResponseBody
	@GetMapping("/sub-list")
	public ResponseEntity<List<SubjectVO>> getList(){
		List<SubjectVO> list = courseService.getList();
		return new ResponseEntity<List<SubjectVO>>(list, HttpStatus.OK);
	}
	
}
