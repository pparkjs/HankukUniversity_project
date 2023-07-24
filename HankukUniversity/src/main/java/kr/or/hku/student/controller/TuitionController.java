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
	
//	@PostMapping("/tuitionCertifi")
	@RequestMapping(value = "/tuitionCertifi", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> tuitionCertifi(
			@RequestBody HashMap<String, String> tutCertifiMap, HttpServletRequest request) throws UnsupportedEncodingException{
		log.info("tuitionCertifi 실행...!");
		
//		HttpSession session = request.getSession();
//		StudentVO std = (StudentVO)session.getAttribute("std");
//		StudentVO vo = commonService.myAllInfo(std.getStdNo());
//		
//		log.info("stdVO : " + vo);
//		log.info("tutCertifiMap : " + tutCertifiMap.toString());
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
////        String formattedBirth = sdf.format(loginStd.getStd_birth());
//        String formattedDate = sdf.format(new Date());
//        
//        String stdName = vo.getStdNm();
//        
//        String uploadPath = resourcePath;
//        
//        String pdfName = stdName+"_등록확인서.pdf";
//		String existingPdfPath = uploadPath + "/certificate.pdf";
//		log.info("existingPdfPath : " + existingPdfPath);
//        String modifiedPdfPath = uploadPath + "/";
//        log.info("modifiedPdfPath1 : " + modifiedPdfPath);
//        File file = new File(modifiedPdfPath);
//        if(!file.exists()) {
//        	file.mkdirs();
//        }
//        modifiedPdfPath += pdfName;
//        log.info("modifiedPdfPath2 : " + modifiedPdfPath);
//        
//        try {
//        	// 기존의 PDF파일 읽기
//			PdfReader reader = new PdfReader(existingPdfPath);
//			PdfWriter writer = new PdfWriter(modifiedPdfPath);
//			PdfDocument pdfDoc = new PdfDocument(reader, writer);
//			
//			// 기존 페이지에 추가 내용 작성
////			PdfPage page = pdfDoc.getFirstPage();
//			Document document = new Document(pdfDoc);
//			
//			PdfFont font = PdfFontFactory.createFont("C:/Windows/Fonts/batang.ttc,0", EmbeddingStrategy.FORCE_EMBEDDED);
////			PdfFont font = PdfFontFactory.createFont("C:\\spring02\\itext\\font\\batang.ttc,0", EmbeddingStrategy.FORCE_EMBEDDED); 
//
//			Paragraph paragraphTitle = new Paragraph("등 록 확 인 서")
//                    .setFont(font).setFixedPosition(220, 680, 300)
////                    .setFont(font).setMargins(100, 0, 0, 100)
//                    .setFontSize(24);
//			
////			String formattedNo = cerNoFormat(cer_no);
////			Paragraph paragraphNo = new Paragraph(formattedNo)
////					.setFont(font).setFixedPosition(77, 740, 300)
////					.setFontSize(9);
//			
//			Paragraph paragraph2 = new Paragraph("성               명 : " + stdName)
//					.setFont(font).setFixedPosition(130, 580, 300)
//					.setFontSize(12);
//			Paragraph paragraph3 = new Paragraph("생   년   월   일 : " + vo.getStdBrdt())
//					.setFont(font).setFixedPosition(130, 540, 300)
//					.setFontSize(12);
//			Paragraph paragraph4 = new Paragraph("학          부(과) : " + vo.getDeptNm())
//					.setFont(font).setFixedPosition(130, 500, 300)
//					.setFontSize(12);
//			Paragraph paragraph5 = new Paragraph("학               년 : " + 3)
//					.setFont(font).setFixedPosition(130, 460, 300)
//					.setFontSize(12);
//			
//			Paragraph paragraph6 = new Paragraph("위의 사실을 증명합니다.")
//					.setFont(font).setFixedPosition(220, 260, 300)
//					.setFontSize(15);
//			
//			Paragraph paragraph7 = new Paragraph(formattedDate)
//					.setFont(font).setFixedPosition(240, 230, 300)
//					.setFontSize(15);
//			
//
//			document.add(paragraphTitle);
////			document.add(paragraphNo);
//			
//            document.add(paragraph2);
//            document.add(paragraph3);
//            document.add(paragraph4);
//            document.add(paragraph5);
//            document.add(paragraph6);
//            document.add(paragraph7);
//			
//            // 작업 완료 후 닫기
//            document.close();
//            pdfDoc.close();
//            reader.close();
//            writer.close();
//            
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		
		
		
		
		String tutCertifi = tuitionService.tuitionCertifi(tutCertifiMap, request);
		log.info("tutCertifi : " + tutCertifi);
//		HttpHeaders headers = tutCertifi.getHeaders();
//		headers.get
		
		HttpHeaders headers = new HttpHeaders();
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
//        log.info("preload() 실행...!");
//        log.info("preload : " + URLEncoder.encode(tutCertifi, "UTF-8").toString());
        
//        try { 
//        	in = new FileInputStream(tutCertifi);
//        	headers.setContentType(MediaType.APPLICATION_PDF); 
//        	entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
//        } catch (Exception e) { 
//        	e.printStackTrace(); 
//        	entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST); 
//        }
        
//        try {
//          // 파일을 읽기 위해 FileInputStream을 생성합니다.
//          in = new FileInputStream(modifiedPdfPath);
//
//          // 응답 헤더를 설정합니다.
//          headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//          headers.add("Content-Disposition",
//                "attachment; filename=\"" + new String(pdfName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
//
//          // ResponseEntity를 사용하여 응답 본문과 헤더를 포함한 HTTP 응답을 생성합니다.
//          // IOUtils.toByteArray(in)를 사용하여 InputStream을 바이트 배열로 변환하여 응답 본문으로 설정합니다.
//          // HttpStatus.CREATED를 사용하여 상태 코드 201(CREATED)을 설정합니다.
//          entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
//       }catch (Exception e) {
//          e.printStackTrace();
//          entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
//       } finally {
//          try {
//             in.close();
//          } catch (IOException e) {
//             e.printStackTrace();
//          }
//       }
//        
//        return entity;
		
		
//		return new ResponseEntity<String>(URLEncoder.encode(tutCertifi, "UTF-8"),HttpStatus.OK);
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
		model.addAttribute("std", vo);
		
		return "student/tuition-bill";
	}
}
