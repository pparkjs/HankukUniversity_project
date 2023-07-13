package kr.or.hku.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.service.UserService;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.admin.vo.UserVO;
import kr.or.hku.common.service.ICommonService;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.lectureInfo.service.CourseInfoService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku/admin")
public class UserManagementController {

	@Autowired
	private CourseInfoService courseService;
	
	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/user-management")
	public String userManagement(Model model) {
		log.info("userManagement() 실행...!");
		List<CommonVO> commonList = commonService.getAllCommonData();
		List<DepartmentVO> deptList = courseService.getAllDept();
		
//		List<UserVO> usersList = userService.getAllUsers();
		List<UserVO> adminsList = userService.getAllAdmins();
		List<UserVO> professorsList = userService.getAllProfessors();
		List<UserVO> studentsList = userService.getAllStudents();
		log.info(studentsList.toString());
		
		model.addAttribute("commonList",commonList);
		model.addAttribute("deptList",deptList);
		
		model.addAttribute("adminsList",adminsList);
		model.addAttribute("professorsList",professorsList);
		model.addAttribute("studentsList",studentsList);
		
		return "admin/user-management";
	}
	
	@PostMapping("/user-management")
	@ResponseBody
	public ResponseEntity<String> insertUser(UserVO userVO) {
		ResponseEntity<String> entity = null;
		log.info("insertUser() 실행...!");
		log.info(userVO.toString());
		int userStatus = userService.insertUser(userVO);
		int status = 0;
		int authStatus = 0;
		
		String userClsCd = userVO.getUserClsCd();
		
		if(userStatus > 0) {
			if(userClsCd.equals("student")) {
				status = userService.insertStudent(userVO);
				userVO.setUserAuth("ROLE_STUDENT");
			} else if(userClsCd.equals("professor")) {
				status = userService.insertProfessor(userVO);
				userVO.setUserAuth("ROLE_PROFESSOR");
			} else if(userClsCd.equals("admin")) {
				status = userService.insertEmployee(userVO);
				userVO.setUserAuth("ROLE_ADMIN");
			}
			authStatus = userService.insertUserAuth(userVO);
			if(status > 0 && authStatus > 0) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}
		
		return entity;
	}
}
