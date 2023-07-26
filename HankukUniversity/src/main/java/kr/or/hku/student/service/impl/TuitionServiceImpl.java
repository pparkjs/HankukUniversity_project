package kr.or.hku.student.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.font.PdfFontFactory.EmbeddingStrategy;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.borders.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.VerticalAlignment;

import kr.or.hku.common.service.CommonService;
import kr.or.hku.student.mapper.TuitionMapper;
import kr.or.hku.student.service.TuitionService;
import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.TuitionVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TuitionServiceImpl implements TuitionService {
	
	@Inject
	private TuitionMapper mapper;
	
	@Autowired
	private CommonService commonService;
	
	// root-context.xml에서 설정한 uploadPath 빈등록 path 경로를 사용한다.
	@Resource(name = "uploadPath")
	private String resourcePath;

	@Override
	public List<TuitionVO> selectTuitionList(StudentVO vo) {
		return mapper.selectTuitionList(vo);
	}

	@Override
	public String tuitionCertifi(HashMap<String, String> tutCertifiMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		StudentVO std = (StudentVO)session.getAttribute("std");
		StudentVO vo = commonService.myAllInfo(std.getStdNo());
		
		log.info("stdVO : " + vo);
		log.info("tutCertifiMap : " + tutCertifiMap.toString());
		String tutYr = tutCertifiMap.get("tutYr");
		String tutSem = tutCertifiMap.get("tutSem");
		String tutAmt = tutCertifiMap.get("tutAmt");
		String tutSclsAmt = tutCertifiMap.get("tutSclsAmt");
		String tutPayDt = tutCertifiMap.get("tutPayDt");
		
		String stdMtcltnYr = vo.getStdMtcltnYr();
		int fGrade = gradeFormat(tutYr, stdMtcltnYr);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
//        String formattedBirth = sdf.format(loginStd.getStd_birth());
        String formattedDate = sdf.format(new Date());
        
        String stdName = vo.getStdNm();
        
        String uploadPath = resourcePath;
        
        String pdfName = stdName+"_등록확인서.pdf";
		String existingPdfPath = uploadPath + "/tut_certificate.pdf";
		log.info("existingPdfPath : " + existingPdfPath);
        String modifiedPdfPath = uploadPath + "/";
        log.info("modifiedPdfPath1 : " + modifiedPdfPath);
        File file = new File(modifiedPdfPath);
        if(!file.exists()) {
        	file.mkdirs();
        }
        modifiedPdfPath += pdfName;
        log.info("modifiedPdfPath2 : " + modifiedPdfPath);
        
        try {
        	// 기존의 PDF파일 읽기
			PdfReader reader = new PdfReader(existingPdfPath);
			PdfWriter writer = new PdfWriter(modifiedPdfPath);
			PdfDocument pdfDoc = new PdfDocument(reader, writer);
			Document document = new Document(pdfDoc);
			
			PdfFont font = PdfFontFactory.createFont("C:/Windows/Fonts/batang.ttc,0", EmbeddingStrategy.FORCE_EMBEDDED);

			// 학교 로고 이미지 워터마크
			String imgPath = "C:\\uploadfiles\\logo_water.png";
			ImageData imageData = ImageDataFactory.create(imgPath);
			Image waterImage = new Image(imageData);
			log.info("width : "+waterImage.getImageWidth());
			log.info("height : "+waterImage.getImageHeight());
			waterImage.setWidth(350f);
			waterImage.setHeight(350f);
			waterImage.setFixedPosition(131, 230);
			waterImage.setOpacity(0.3f);	// 흐리게 설정하는 부분
			document.add(waterImage);
						
			Paragraph paragraphDept = new Paragraph(vo.getDeptNm())
					.setFont(font).setFixedPosition(140, 614, 300)
					.setFontSize(12);
			Paragraph paragraphGrade = new Paragraph(""+fGrade)
					.setFont(font).setFixedPosition(260, 614, 300)
					.setFontSize(12);
			Paragraph paragraphStdNo = new Paragraph(vo.getStdNo())
					.setFont(font).setFixedPosition(330, 614, 300)
					.setFontSize(12);
			Paragraph paragraphStdNm = new Paragraph(vo.getStdNm())
					.setFont(font).setFixedPosition(455, 614, 300)
					.setFontSize(12);
			Paragraph paragraphYrSem = new Paragraph(tutYr+"년도 " +tutSem+"학기")
					.setFont(font).setFixedPosition(188, 523, 300)
					.setFontSize(12);
			Paragraph paragraphtutPayDt = new Paragraph(tutPayDt.substring(0, 10))
					.setFont(font).setFixedPosition(403, 523, 300)
					.setFontSize(12);
			Paragraph paragraphAmt = new Paragraph(String.format("%,d", Integer.parseInt(tutAmt)))
					.setFont(font).setFixedPosition(202, 402, 300)
					.setFontSize(12);
			Paragraph paragraphSclsAmt = new Paragraph(String.format("%,d", Integer.parseInt(tutSclsAmt)))
					.setFont(font).setFixedPosition(418, 402, 300)
					.setFontSize(12);
			Paragraph paragraphTotal = new Paragraph(String.format("%,d", Integer.parseInt(tutAmt)-Integer.parseInt(tutSclsAmt)))
					.setFont(font).setFixedPosition(202, 322, 300)
					.setFontSize(12);
			Paragraph paragraphTotal2 = new Paragraph(String.format("%,d", Integer.parseInt(tutAmt)-Integer.parseInt(tutSclsAmt)))
					.setFont(font).setFixedPosition(335, 282, 300)
					.setFontSize(12)
					.setBold();
			
			Paragraph paragraph7 = new Paragraph(formattedDate)
					.setFont(font).setFixedPosition(240, 200, 300)
					.setFontSize(15);
			
            document.add(paragraphDept);
            document.add(paragraphGrade);
            document.add(paragraphStdNo);
            document.add(paragraphStdNm);
            document.add(paragraphYrSem);
            document.add(paragraphtutPayDt);
            document.add(paragraphAmt);
            document.add(paragraphSclsAmt);
            document.add(paragraphTotal);
            document.add(paragraphTotal2);
            document.add(paragraph7);
			
            document.close();
            pdfDoc.close();
            reader.close();
            writer.close();
            
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return modifiedPdfPath;
	}

	@Override
	public TuitionVO selectTuition(String stdNo) {
		return mapper.selectTuition(stdNo);
	}

	@Override
	public String tuiBillPrint(HashMap<String, String> tutBillMap, HttpServletRequest request) {
		String stdNo = tutBillMap.get("stdNo");
		String stdNm = tutBillMap.get("stdNm");
		String deptNm = tutBillMap.get("deptNm");
		String grade = tutBillMap.get("grade");
		
		String tutAmt = String.format("%,d", Integer.parseInt(tutBillMap.get("tutAmt")));
		String tutSclsAmt = String.format("%,d", Integer.parseInt(tutBillMap.get("tutSclsAmt")));
		String tutTotal = String.format("%,d", Integer.parseInt(tutBillMap.get("tutAmt"))-Integer.parseInt(tutBillMap.get("tutSclsAmt")));
		String deadLine = tutBillMap.get("deadLine");
		String tutPayActno = tutBillMap.get("tutPayActno");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
        String formattedDate = sdf.format(new Date());
		
		String uploadPath = resourcePath;
        
        String pdfName = stdNm+"_등록금고지서.pdf";
		String existingPdfPath = uploadPath + "/tut_bill_certificate.pdf";
		log.info("existingPdfPath : " + existingPdfPath);
        String modifiedPdfPath = uploadPath + "/";
        log.info("modifiedPdfPath1 : " + modifiedPdfPath);
        File file = new File(modifiedPdfPath);
        if(!file.exists()) {
        	file.mkdirs();
        }
        modifiedPdfPath += pdfName;
        log.info("modifiedPdfPath2 : " + modifiedPdfPath);
        
        try {
        	// 기존의 PDF파일 읽기
			PdfReader reader = new PdfReader(existingPdfPath);
			PdfWriter writer = new PdfWriter(modifiedPdfPath);
			PdfDocument pdfDoc = new PdfDocument(reader, writer);
			Document document = new Document(pdfDoc);
			
			PdfFont font = PdfFontFactory.createFont("C:/Windows/Fonts/batang.ttc,0", EmbeddingStrategy.FORCE_EMBEDDED);

			// 학교 로고 이미지 워터마크
			String imgPath = "C:\\uploadfiles\\logo_water.png";
			ImageData imageData = ImageDataFactory.create(imgPath);
			Image waterImage = new Image(imageData);
			log.info("width : "+waterImage.getImageWidth());
			log.info("height : "+waterImage.getImageHeight());
			waterImage.setWidth(350f);
			waterImage.setHeight(350f);
			waterImage.setFixedPosition(131, 230);
			waterImage.setOpacity(0.3f);	// 흐리게 설정하는 부분
			document.add(waterImage);
						
			Paragraph paragraphDept = new Paragraph(deptNm)
					.setFont(font).setFixedPosition(140, 595, 300)
					.setFontSize(12);
			Paragraph paragraphGrade = new Paragraph(grade)
					.setFont(font).setFixedPosition(260, 595, 300)
					.setFontSize(12);
			Paragraph paragraphStdNo = new Paragraph(stdNo)
					.setFont(font).setFixedPosition(330, 595, 300)
					.setFontSize(12);
			Paragraph paragraphStdNm = new Paragraph(stdNm)
					.setFont(font).setFixedPosition(455, 595, 300)
					.setFontSize(12);
			Paragraph paragraphDate = new Paragraph(formattedDate)
					.setFont(font).setFixedPosition(240, 325, 300)
					.setFontSize(15);
			
			Paragraph paragraphtutAmt = new Paragraph(tutAmt)
					.setFont(font).setFixedPosition(216, 507, 300)
					.setFontSize(12);
			Paragraph paragraphtutSclsAmt = new Paragraph(tutSclsAmt)
					.setFont(font).setFixedPosition(218, 473, 300)
					.setFontSize(12);
			Paragraph paragraphtutTotal = new Paragraph(tutTotal)
					.setFont(font).setFixedPosition(216, 437, 300)
					.setFontSize(12);
			
			Paragraph paragraphdeadLine = new Paragraph(deadLine)
					.setFont(font).setFixedPosition(426, 542, 300)
					.setFontSize(12);
			Paragraph paragraphtutPayActno = new Paragraph(tutPayActno)
					.setFont(font).setFixedPosition(426, 507, 300)
					.setFontSize(12);
			
            document.add(paragraphDept);
            document.add(paragraphGrade);
            document.add(paragraphStdNo);
            document.add(paragraphStdNm);
            document.add(paragraphDate);
            
            document.add(paragraphtutAmt);
            document.add(paragraphtutSclsAmt);
            document.add(paragraphtutTotal);
            document.add(paragraphdeadLine);
            document.add(paragraphtutPayActno);
            
            document.close();
            pdfDoc.close();
            reader.close();
            writer.close();
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modifiedPdfPath;
	}
	
	private int gradeFormat(String tutYr, String stdMtcltnYr) {
		int tutYr_ = Integer.parseInt(tutYr);
		int stdMtcltnYr_ = Integer.parseInt(stdMtcltnYr);
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
//        String formattedDate = sdf.format(new Date());
//        int todayYear = Integer.parseInt(formattedDate);
        
        int fGrade = tutYr_ - stdMtcltnYr_ + 1;
        return fGrade;
		
	}
}
