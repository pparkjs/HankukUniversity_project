package kr.or.hku.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.service.admin.IAcademicAdm;
import kr.or.hku.vo.DepartmentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/admin")
@Slf4j
public class AcademicController {
	
	@Autowired
	private IAcademicAdm academicAdmService;

	@GetMapping("/dept-administration")
	public String depAdministration(Model model) {
		log.info("dept-administration 실행~!");
		
		List<DepartmentVO> deptList = academicAdmService.selectDepartment();
		model.addAttribute("deptList",deptList);
		
		return "admin/dept-administration";
	}
	
	@DeleteMapping("/dept-administration")
	@ResponseBody
	public ResponseEntity<String> deptDelete(
			@RequestBody HashMap<String, String> data
			){
		log.info("deptDelete() 실행...!");
		for(int i=0; i<data.size(); i++) {
			
		}
		log.info("data : "+data);
		return null;
	}
}
