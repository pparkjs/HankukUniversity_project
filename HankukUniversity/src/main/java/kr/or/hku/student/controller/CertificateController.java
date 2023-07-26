package kr.or.hku.student.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.common.service.CommonService;
import kr.or.hku.student.service.CertificateService;
import kr.or.hku.student.vo.CertificateIssuVO;
import kr.or.hku.student.vo.CertificateVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku")
public class CertificateController {
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private CertificateService certificateService;
	
	@Resource(name = "uploadPath")
	private String resourcePath;

	@GetMapping("/certificate")
	public String certificate(HttpSession session, Model model) {
		log.info("certificate() 실행...!");
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		List<CertificateVO> certifiList = certificateService.selectCertifiList();
		model.addAttribute("std", vo);
		model.addAttribute("certifiList", certifiList);
		
		return "student/certificate";
	}
	
	@GetMapping("/certificate-list")
	public String certificateList(HttpSession session, Model model) {
		log.info("certificateList() 실행...!");
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		
		List<CertificateIssuVO> certifiIssuList = certificateService.selectCertifiIssuList(vo.getStdNo());
		
		model.addAttribute("std", vo);
		model.addAttribute("certifiIssuList", certifiIssuList);
		
		return "student/certificate-list";
	}
	
//	@PostMapping("/certifi-print")
	@RequestMapping(value = "/certifi-print", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String certifiPrint(@RequestBody HashMap<String, String> certifiMap) {
		log.info("certifiPrint() 실행...!");
		log.info("certifiMap : " + certifiMap.toString());
		String ctfctNo = certifiMap.get("ctfctNo");
		
		String certifiPrint = null;
		if(ctfctNo.equals("CTFCT001")) {
			certifiPrint = certificateService.jahakCertifiPrint(certifiMap);
		} else if(ctfctNo.equals("CTFCT002")) {
			certifiPrint = certificateService.sungjukCertifiPrint(certifiMap);
		} else if(ctfctNo.equals("CTFCT003")) {
			certifiPrint = certificateService.jolupCertifiPrint(certifiMap);
		}
		
		return certifiPrint;
	}
	
	@GetMapping("/nextCtfctisNo")
	@ResponseBody
	public String nextCtfctisNo() {
		String nextCtfctisNo = certificateService.nextCtfctisNo();
		return nextCtfctisNo;
	}
	
	@PostMapping("/payInfoInsert")
	@ResponseBody
	public String payInfoInsert(@RequestBody HashMap<String, String> payInfoMap) {
		log.info("payInfoInsert() 실행...!");
		log.info("payInfoMap : " + payInfoMap);
		int status = certificateService.payInfoInsert(payInfoMap);
		
		if(status > 0) {
			return "SUCCESS";
		} else {
			return "FAILED";
		}
	}
}
