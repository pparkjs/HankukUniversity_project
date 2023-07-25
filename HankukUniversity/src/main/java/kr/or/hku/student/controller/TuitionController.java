package kr.or.hku.student.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.common.service.CommonService;
import kr.or.hku.student.service.TuitionService;
import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.TuitionVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku")
public class TuitionController {
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private TuitionService tuitionService;
	
	// root-context.xml에서 설정한 uploadPath 빈등록 path 경로를 사용한다.
	@Resource(name = "uploadPath")
	private String resourcePath;

	@GetMapping("/tuition-payment-details")
	public String tuitionPaymentDetails(HttpSession session, Model model) {
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		
		List<TuitionVO> tuitionList = tuitionService.selectTuitionList(vo);
		log.info("tuitionList : " + tuitionList.toString());
		model.addAttribute("std", vo);
		model.addAttribute("tuitionList",tuitionList);
		return "student/tuition-payment-details";
	}
	
	@RequestMapping(value = "/tuitionCertifi", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> tuitionCertifi(
			@RequestBody HashMap<String, String> tutCertifiMap, HttpServletRequest request) throws UnsupportedEncodingException{
		log.info("tuitionCertifi 실행...!");
		
		String tutCertifi = tuitionService.tuitionCertifi(tutCertifiMap, request);
		log.info("tutCertifi : " + tutCertifi);
		
		return new ResponseEntity<String>(tutCertifi,HttpStatus.OK);
	}
	
	@GetMapping("/preload")
	public ResponseEntity<byte[]> preload(String preload) throws UnsupportedEncodingException{
		// 미리보기 화면 띄우는 부분, 이후 다운로드까지 완료할 수 있다.(chrome에서 제공)
        HttpHeaders headers = new HttpHeaders();
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        log.info("preload() 실행...!");
        log.info("preload : " + URLEncoder.encode(preload, "UTF-8").toString());
        try { 
        	in = new FileInputStream(preload);
        	headers.setContentType(MediaType.APPLICATION_PDF); 
        	entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
        } catch (Exception e) { 
        	e.printStackTrace(); 
        	entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST); 
        }
        return entity; 
	}
	
	@GetMapping("/tuition-bill")
	public String tuitionBill(HttpSession session, Model model) {
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		
//		List<TuitionVO> tuitionList = tuitionService.selectTuitionList(vo);
//		log.info("tuitionList : " + tuitionList.toString());
		TuitionVO tuitionVO = tuitionService.selectTuition(vo.getStdNo());
		model.addAttribute("std", vo);
		model.addAttribute("tuition",tuitionVO);
		
		return "student/tuition-bill";
	}
	
	@RequestMapping(value = "/tuiBillPrint", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> tuiBillPrint(
			@RequestBody HashMap<String, String> tutBillMap, HttpServletRequest request) throws UnsupportedEncodingException{
		log.info("tuiBillPrint 실행...!");
		log.info("tutBillMap : " + tutBillMap);
		
		String tutBill = tuitionService.tuiBillPrint(tutBillMap, request);
		log.info("tutBill : " + tutBill);
		
		return new ResponseEntity<String>(tutBill,HttpStatus.OK);
//		return null;
	}
}
