package kr.or.hku.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.admin.service.UserService;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.admin.vo.UserVO;
import kr.or.hku.common.service.CommonService;
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
	private CommonService commonService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/user-management")
	public String userManagement(Model model) {
		log.info("userManagement() 실행...!");
		List<CommonVO> commonList = commonService.getAllCommonData();
		List<DepartmentVO> deptList = courseService.getAllDept();

		model.addAttribute("commonList",commonList);
		model.addAttribute("deptList",deptList);
		
//		model.addAttribute("usersList",usersList);
//		model.addAttribute("adminsList",adminsList);
//		model.addAttribute("professorsList",professorsList);
//		model.addAttribute("studentsList",studentsList);
		
		return "admin/user-management";
	}
	
	@PostMapping("/user-list")
	@ResponseBody
	public ResponseEntity<List<UserVO>> userList() {
		ResponseEntity<List<UserVO>> entity = null;
		List<UserVO> usersList = userService.getAllUsers();
		
		if(usersList != null && usersList.size() > 0) {
			entity = new ResponseEntity<List<UserVO>>(usersList, HttpStatus.OK);
		}
//		log.info(usersList.toString());
		return entity;
	}
	
	@PostMapping("/student-list")
	@ResponseBody
	public ResponseEntity<List<UserVO>> studentList() {
		ResponseEntity<List<UserVO>> entity = null;
		List<UserVO> studentsList = userService.getAllStudents();
		
		if(studentsList != null && studentsList.size() > 0) {
			entity = new ResponseEntity<List<UserVO>>(studentsList, HttpStatus.OK);
		}
//		log.info(studentsList.toString());
		return entity;
	}
	
	@PostMapping("/professor-list")
	@ResponseBody
	public ResponseEntity<List<UserVO>> professorList() {
		ResponseEntity<List<UserVO>> entity = null;
		List<UserVO> professorsList = userService.getAllProfessors();
		
		if(professorsList != null && professorsList.size() > 0) {
			entity = new ResponseEntity<List<UserVO>>(professorsList, HttpStatus.OK);
		}
//		log.info(professorsList.toString());
		return entity;
	}
	
	@PostMapping("/admin-list")
	@ResponseBody
	public ResponseEntity<List<UserVO>> adminList() {
		ResponseEntity<List<UserVO>> entity = null;
		List<UserVO> adminsList = userService.getAllAdmins();
		
		if(adminsList != null && adminsList.size() > 0) {
			entity = new ResponseEntity<List<UserVO>>(adminsList, HttpStatus.OK);
		}
//		log.info(adminsList.toString());
		return entity;
	}
	
	@PostMapping("/user-management")
	@ResponseBody
	public ResponseEntity<String> insertUser(UserVO userVO) {
		ResponseEntity<String> entity = null;
		log.info("insertUser() 실행...!");
//		log.info(userVO.toString());
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
	
	@PostMapping("/insertUserExcel")
	public String insertUserExcel(MultipartFile formFile, HttpServletRequest request) throws IOException {
		log.info("insertUserExcel() 실행...!");
//		ResponseEntity<List<UserVO>> entity = null;
//		byte[] bytes = file.getBytes();
////		File file = new 
//		log.info("OFName : " + file.getOriginalFilename());
//		File convFile = new File(file.getOriginalFilename());
		log.info("oName : " + formFile.getOriginalFilename());
		log.info("name : " + formFile.getName());
		log.info("contentType : " + formFile.getContentType());
		log.info("size : " + formFile.getSize());
		InputStream file2 = formFile.getInputStream();
		
		
//		FileInputStream file2 = new FileInputStream(new File("D:/students.xlsx"));
		XSSFWorkbook workbook = new XSSFWorkbook(file2);
		XSSFSheet sheet = workbook.getSheet("Sheet1");
		
//		Row row = sheet.getRow(2);
//		log.info("row physical : " + row.getPhysicalNumberOfCells());
//		log.info("row first : " + row.getFirstCellNum());
//		log.info("row last : " + row.getLastCellNum());
		List<UserVO> excelInsList = new ArrayList<UserVO>();
		int status = 1;
		for(Row row : sheet) {
			if(!(row.getRowNum() == 0)) {
				row.getCell(0).setCellType(CellType.STRING);
				row.getCell(1).setCellType(CellType.STRING);
				row.getCell(2).setCellType(CellType.STRING);
				row.getCell(3).setCellType(CellType.STRING);
				row.getCell(4).setCellType(CellType.STRING);
				row.getCell(5).setCellType(CellType.STRING);
				row.getCell(6).setCellType(CellType.STRING);
				row.getCell(7).setCellType(CellType.STRING);
				row.getCell(8).setCellType(CellType.STRING);
				row.getCell(9).setCellType(CellType.STRING);
				row.getCell(10).setCellType(CellType.STRING);
				row.getCell(11).setCellType(CellType.STRING);
				row.getCell(12).setCellType(CellType.STRING);
				
				String userNo = row.getCell(0).getStringCellValue();
				String deptCd = row.getCell(1).getStringCellValue();
				String userNm = row.getCell(2).getStringCellValue();
				String userTelno = row.getCell(3).getStringCellValue();
				String sexCd = row.getCell(4).getStringCellValue();
				String userZip = row.getCell(5).getStringCellValue();
				String userAddr = row.getCell(6).getStringCellValue();
				String userDaddr = row.getCell(7).getStringCellValue();
				String userMail = row.getCell(8).getStringCellValue();
				String userBrdt = row.getCell(9).getStringCellValue();
				String userRrno = row.getCell(10).getStringCellValue();
				String bankCd = row.getCell(11).getStringCellValue();
				String userActno = row.getCell(12).getStringCellValue();
				String userClsCd = row.getCell(13).getStringCellValue();
				
				UserVO userVO = new UserVO();
				
				userVO.setUserNo(userNo);
				userVO.setUserPw(userBrdt);
				userVO.setUserClsCd(userClsCd);
				userVO.setUserAuth("ROLE_STUDENT");
				
				userVO.setDeptCd(deptCd);
				userVO.setUserNm(userNm);
				userVO.setUserTelno(userTelno);
				userVO.setSexCd(sexCd);
				userVO.setUserZip(userZip);
				userVO.setUserAddr(userAddr);
				userVO.setUserDaddr(userDaddr);
				userVO.setUserMail(userMail);
				userVO.setUserBrdt(userBrdt);
				userVO.setUserRrno(userRrno);
				userVO.setBankCd(bankCd);
				userVO.setUserActno(userActno);
				
//				userService.insertUser(userVO);
//				status = userService.insertStudent(userVO);
//				userService.insertUserAuth(userVO);
//				if(status > 0) {
//					excelInsList.add(userVO);
//				} else {
//					status = 0;
//				}
				excelInsList.add(userVO);
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("excelInsList", excelInsList);
		
//		for(UserVO user : excelInsList) {
//			int cnt = userService.insertUser(user);
//			int cnt1 = userService.insertStudent(user);
//			int cnt2 = userService.insertUserAuth(user);
//			if(cnt==0 || cnt1==0 || cnt2==0) {
//				status = 0;
//			}
//		}
				
		log.info(excelInsList.toString());
//		if(status > 0) {
//			entity = new ResponseEntity<List<UserVO>>(excelInsList,HttpStatus.OK);
//		}
		workbook.close();
		return "admin/excelUserInsert";
	}
	
	@GetMapping("/excel-insert")
	public String excelInsert(){
//		List<UserVO> excelInsList = excelUsers;
//		int status = 1;
//		for(UserVO user : excelInsList) {
//			int cnt = userService.insertUser(user);
//			int cnt1 = userService.insertStudent(user);
//			int cnt2 = userService.insertUserAuth(user);
//			if(cnt==0 || cnt1==0 || cnt2==0) {
//				status = 0;
//			}
//		}
		
		return "admin/user-management";
	}
	
	@DeleteMapping("/user-management")
	@ResponseBody
	public ResponseEntity<String> deleteUser(
			@RequestBody List<Map<String, String>> delUserArr
			){
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		int successFlag = 1;
		
		log.info("deleteUser() 실행...!");
		log.info("delUserArr : " + delUserArr);
		
		for(int i=0; i<delUserArr.size(); i++) {
			String userType = delUserArr.get(i).get("type");
			String userNo = delUserArr.get(i).get("userNo");
			log.info("type : " + userType);
			log.info("userNo : " + userNo);
			
			int cnt = 0;
			if(userType.equals("직원")) {
				cnt = userService.deleteEmployee(userNo);
			} else if(userType.equals("교수")) {
				cnt = userService.deleteProfessor(userNo);
			} else if(userType.equals("학생")) {
				cnt = userService.deleteStudent(userNo);
			}
//			String userNo = delUserArr.get(i);
			int authCnt = userService.deleteAuth(userNo);
			int status = userService.deleteUser(userNo);
			
			if(status == 0) {
				successFlag = 0;
			}
		}
		if(successFlag == 0) {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
}
