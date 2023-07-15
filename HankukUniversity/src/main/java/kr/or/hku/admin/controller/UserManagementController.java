package kr.or.hku.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@ResponseBody
	public ResponseEntity<List<UserVO>> insertUserExcel(MultipartFile file) throws IOException {
		log.info("insertUserExcel() 실행...!");
		ResponseEntity<List<UserVO>> entity = null;
//		byte[] bytes = file.getBytes();
////		File file = new 
//		log.info("OFName : " + file.getOriginalFilename());
//		File convFile = new File(file.getOriginalFilename());
		log.info("oName : " + file.getOriginalFilename());
		log.info("name : " + file.getName());
		log.info("contentType : " + file.getContentType());
		log.info("size : " + file.getSize());
		InputStream file2 = file.getInputStream();
		
		
//		FileInputStream file2 = new FileInputStream(new File("D:/students.xlsx"));
		XSSFWorkbook workbook = new XSSFWorkbook(file2);
		XSSFSheet sheet = workbook.getSheet("Sheet1");
		
//		Row row = sheet.getRow(2);
//		log.info("row physical : " + row.getPhysicalNumberOfCells());
//		log.info("row first : " + row.getFirstCellNum());
//		log.info("row last : " + row.getLastCellNum());
		List<UserVO> excelInsList = new ArrayList<UserVO>();
		UserVO userVO = new UserVO();
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
				
				userVO.setUserNo(userNo);
				userVO.setUserPw(userBrdt);
				userVO.setUserClsCd("student");
				
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
		for(UserVO user : excelInsList) {
			userService.insertUser(user);
		}
		if(status > 0) {
			entity = new ResponseEntity<List<UserVO>>(excelInsList,HttpStatus.OK);
		}
		workbook.close();
		return entity;
	}
}
