package kr.or.hku.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
