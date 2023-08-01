package kr.or.hku.admin.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.service.UserService;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.admin.vo.SmsTemplateVO;
import kr.or.hku.admin.vo.SmsVO;
import kr.or.hku.admin.vo.UserVO;
import kr.or.hku.common.service.CommonSMSService;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.common.vo.SearchInfoVO;
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
	
	@Autowired
	private CommonSMSService smsService;
	
	@Autowired
	private BCryptPasswordEncoder pe;
	 
	// 성히꺼 // 
	@Transactional
	@ResponseBody
	@PostMapping("/send-text-msg")
	public int sendTextMsg(@RequestBody Map<String, Object> map, HttpSession session) {
		log.info("전달 받은 파라미터 ! " + map.toString());
		List<Map<String, String>> userList = (List<Map<String, String>>) map.get("userList");
		String msg = (String) map.get("msg");
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String empName = userService.getMyName(user.getUsername());
		
		ServiceResult res = null;
		int sendMsgStatus = 0;
		map.put("empName", empName);
		if( userList.size() > 0) {
			res = smsService.sendShMsg(userList, msg);
		}
		if(res != null && res.equals(ServiceResult.OK)) {
			sendMsgStatus = userService.sendMsgStatus(map);
		}
		
		return sendMsgStatus;
	}
	
	
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/send-text-msg")
	public String showSendTextMsgPage(Model model) {
		List<Map<String, String>> depList = userService.getDeptList();
		List<Map<String, String>> empDeptList = userService.getEmpDeptList();
		List<SmsTemplateVO> smsTemplateList = userService.getSmsTemplateList();
		List<SmsVO> smsDetailList = userService.getSmsDetailList();
		model.addAttribute("smsTemplateList", smsTemplateList);
		model.addAttribute("depList", depList);
		model.addAttribute("empDeptList", empDeptList);
		model.addAttribute("smsDetailList", smsDetailList);
		return "admin/sendTextMsg";
	}
	
	//문자 추가 & 변경
	@ResponseBody
	@PostMapping("/smsTemplateProccess")
	public Map<String, Object> smsTemplateProccess(@RequestBody SmsTemplateVO smsTemplateVO) {
		log.info("smsTemplateVO > " + smsTemplateVO.toString());
		Map<String, Object> returnValue = new HashMap<>();
		int res = 0;
		if (StringUtils.isBlank(smsTemplateVO.getSmsTempNo())) { // 기본키 없다 저장
			res = smsService.addSmsTemplate(smsTemplateVO);
			returnValue.put("processMsg", "add");
		}else {
			res = smsService.updateSmsTemplate(smsTemplateVO);
			returnValue.put("processMsg", "update");
		}
		if (res > 0) {
			returnValue.put("data", smsTemplateVO);
		}else {
			returnValue.put("processMsg", "error");
		}
		return returnValue;
	}
	
	@ResponseBody
	@GetMapping("/setting-msg")
	public SmsTemplateVO settingMsg(SmsTemplateVO paramVO) {
		return userService.settingMsg(paramVO);
	}
	
	@ResponseBody
	@GetMapping("/getAllUsers-list")
	public Map<String, Object> getAllUsersList(@RequestParam Map<String, String> paramMap) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		String userClassification = paramMap.get("who"); 
		
		List<Map<String, String>> stdList = null;
		List<Map<String, String>> proList = null;
		List<Map<String, String>> empList = null;
		
		if (userClassification.equals("all")) {
			stdList = userService.getStdList(paramMap);
			proList = userService.getProList(paramMap);
			empList = userService.getEmpList(paramMap);
		}else if (userClassification.equals("std")) {
			stdList = userService.getStdList(paramMap);
		}else if (userClassification.equals("pro")) {
			proList = userService.getProList(paramMap);
		}else if (userClassification.equals("emp")) {
			empList = userService.getEmpList(paramMap);
		}
		
		resMap.put("stdList", stdList);
		resMap.put("proList", proList);
		resMap.put("empList", empList);
		
		return resMap;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/user-management")
	public String userManagement(Model model) {
		log.info("userManagement() 실행...!");
		List<CommonVO> commonList = commonService.getAllCommonData();
		List<DepartmentVO> deptList = courseService.getAllDept();

		model.addAttribute("commonList",commonList);
		model.addAttribute("deptList",deptList);
		
		return "admin/user-management";
	}
	
	@PostMapping("/user-list")
	@ResponseBody
	public ResponseEntity<List<UserVO>> userList(
			@RequestBody HashMap<String, String> data,
			Model model) {
		ResponseEntity<List<UserVO>> entity = null;
		
		String searchType = data.get("searchType");
		String searchWord = data.get("searchWord");
		log.info("searchType : " + searchType);
		log.info("searchWord : " + searchWord);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(searchWord)) {
			searchInfoVO.setSearchType(searchType);
			searchInfoVO.setSearchWord(searchWord);
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchWord",searchWord);
		}
		
		List<UserVO> usersList = userService.getAllUsers(searchInfoVO);
		
		entity = new ResponseEntity<List<UserVO>>(usersList, HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/student-list")
	@ResponseBody
	public ResponseEntity<List<UserVO>> studentList(
			@RequestBody HashMap<String, String> data,
			Model model
			) {
		ResponseEntity<List<UserVO>> entity = null;
		
		String searchType = data.get("searchType");
		String searchWord = data.get("searchWord");
		log.info("searchType : " + searchType);
		log.info("searchWord : " + searchWord);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(searchWord)) {
			searchInfoVO.setSearchType(searchType);
			searchInfoVO.setSearchWord(searchWord);
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchWord",searchWord);
		}
		
		List<UserVO> studentsList = userService.getAllStudents(searchInfoVO);
		
		entity = new ResponseEntity<List<UserVO>>(studentsList, HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/professor-list")
	@ResponseBody
	public ResponseEntity<List<UserVO>> professorList(
			@RequestBody HashMap<String, String> data,
			Model model
			) {
		ResponseEntity<List<UserVO>> entity = null;
		
		String searchType = data.get("searchType");
		String searchWord = data.get("searchWord");
		log.info("searchType : " + searchType);
		log.info("searchWord : " + searchWord);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(searchWord)) {
			searchInfoVO.setSearchType(searchType);
			searchInfoVO.setSearchWord(searchWord);
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchWord",searchWord);
		}
		
		List<UserVO> professorsList = userService.getAllProfessors(searchInfoVO);
		
		entity = new ResponseEntity<List<UserVO>>(professorsList, HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/admin-list")
	@ResponseBody
	public ResponseEntity<List<UserVO>> adminList(
			@RequestBody HashMap<String, String> data,
			Model model
			) {
		ResponseEntity<List<UserVO>> entity = null;
		
		String searchType = data.get("searchType");
		String searchWord = data.get("searchWord");
		log.info("searchType : " + searchType);
		log.info("searchWord : " + searchWord);
		
		SearchInfoVO searchInfoVO = new SearchInfoVO();
		if(StringUtils.isNotBlank(searchWord)) {
			searchInfoVO.setSearchType(searchType);
			searchInfoVO.setSearchWord(searchWord);
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchWord",searchWord);
		}
		
		List<UserVO> adminsList = userService.getAllAdmins(searchInfoVO);
		
		entity = new ResponseEntity<List<UserVO>>(adminsList, HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/user-management")
	@ResponseBody
	public ResponseEntity<String> insertUser(UserVO userVO) {
		ResponseEntity<String> entity = null;
		
		String userPw = userVO.getUserPw();	// 생년월일이 넘어온 비밀번호
		String userPw_ = pe.encode(userPw);	// 암호화
		
		userVO.setUserPw(userPw_);
		
		log.info("insertUser() 실행...!");
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
		log.info("oName : " + formFile.getOriginalFilename());
		log.info("name : " + formFile.getName());
		log.info("contentType : " + formFile.getContentType());
		log.info("size : " + formFile.getSize());
		InputStream file2 = formFile.getInputStream();
		
		XSSFWorkbook workbook = new XSSFWorkbook(file2);
		XSSFSheet sheet = workbook.getSheet("Sheet1");
		
		List<UserVO> excelInsList = new ArrayList<UserVO>();
//		int status = 1;
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
				
				excelInsList.add(userVO);
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("excelInsList", excelInsList);
		
		log.info(excelInsList.toString());
		workbook.close();
		
		return "admin/excelUserInsert";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/excel-insert")
	public String excelInsert(HttpServletRequest request, RedirectAttributes redirectAttribute){
		log.info("excel-insert() 실행...!");
		HttpSession session = request.getSession();
		
		List<UserVO> excelInsList = (List<UserVO>) session.getAttribute("excelInsList");
		int status = 1;
		for(UserVO user : excelInsList) {
			int cnt = userService.insertUser(user);
			int cnt1 = userService.insertStudent(user);
			int cnt2 = userService.insertUserAuth(user);
			if(cnt==0 || cnt1==0 || cnt2==0) {
				status = 0;
			}
		}
		
		if(status > 0) {
			redirectAttribute.addFlashAttribute("ilgualStatus", "1");
		}
		session.removeAttribute("excelInsList");
		
		return "redirect:/hku/admin/user-management";
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
	
	@PostMapping("/userDetail")
	@ResponseBody
	public ResponseEntity<UserVO> userDetail(@RequestBody HashMap<String, String> userData) {
		ResponseEntity<UserVO> entity = null;
		log.info("1 : " + userData.get("userNo"));
		log.info("2 : " + userData.get("userClsNm"));
		String userNo = userData.get("userNo");
		String userClsNm = userData.get("userClsNm");
		UserVO userVO = null;
		if(userClsNm.equals("학생")) {
			log.info("학생 상세 실행");
			userVO = userService.studentDetail(userNo);
		} else if(userClsNm.equals("교수")) {
			log.info("교수 상세 실행");
			userVO = userService.professorDetail(userNo);
		} else if(userClsNm.equals("직원")) {
			log.info("직원 상세 실행");
			userVO = userService.employeeDetail(userNo);
		}
		
		entity = new ResponseEntity<UserVO>(userVO, HttpStatus.OK); 
		return entity;
	}
	
	@PostMapping("/userModify")
	@ResponseBody
	public ResponseEntity<String> userModify(UserVO userVO){
		ResponseEntity<String> entity = null;
		log.info("사용자 수정 실행!");
		log.info(userVO.toString());
		int status = 0;
		
		if(userVO.getUserClsNm().equals("student")) {
//			log.info("학생수정");
			status = userService.updateStudent(userVO);
			
		} else if(userVO.getUserClsNm().equals("professor")) {
//			log.info("교수수정");
			status = userService.updateProfessor(userVO);
			
		} else if(userVO.getUserClsNm().equals("employee")) {
//			log.info("직원수정");
			status = userService.updateEmployee(userVO);
			
		}
		if(status > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@GetMapping("/poiDownload")
	public ResponseEntity<byte[]> poiDownload(){
		log.info("poiDownload 실행...!");
		HttpHeaders headers = new HttpHeaders();
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
		
        String savePdfPath = "C:\\uploadfiles\\poi\\학생 일괄등록 양식.xlsx";
        String pdfName = "학생 일괄등록 양식.xlsx";
        
		// 다운로드만 바로 실행시켜주는 부분
        try {
           // 파일을 읽기 위해 FileInputStream을 생성합니다.
           in = new FileInputStream(savePdfPath);

           // 응답 헤더를 설정합니다.
           headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
           headers.add("Content-Disposition",
               "attachment; filename=\"" + new String(pdfName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

           // ResponseEntity를 사용하여 응답 본문과 헤더를 포함한 HTTP 응답을 생성합니다.
           // IOUtils.toByteArray(in)를 사용하여 InputStream을 바이트 배열로 변환하여 응답 본문으로 설정합니다.
           // HttpStatus.CREATED를 사용하여 상태 코드 201(CREATED)을 설정합니다.
           entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
      } catch (Exception e) {
           e.printStackTrace();	
           entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
      } finally {
           try {
              in.close();
           } catch (IOException e) {
              e.printStackTrace();
           }
      }
      return entity;
	}
}
