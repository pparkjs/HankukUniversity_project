package kr.or.hku.student.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.font.PdfFontFactory.EmbeddingStrategy;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;

import kr.or.hku.common.mapper.CommonMapper;
import kr.or.hku.student.mapper.CertificateMapper;
import kr.or.hku.student.service.CertificateService;
import kr.or.hku.student.vo.CertificateIssuVO;
import kr.or.hku.student.vo.CertificateVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CertificateServiceImpl implements CertificateService {

	@Autowired
	private CertificateMapper mapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	@Override
	public List<CertificateVO> selectCertifiList() {
		return mapper.selectCertifiList();
	}

	@Override
	public List<CertificateIssuVO> selectCertifiIssuList() {
		return mapper.selectCertifiIssuList();
	}

	@Override
	public String jahakCertifiPrint(HashMap<String, String> certifiMap) {
		String stdNo = certifiMap.get("stdNo");
		StudentVO stdVO = commonMapper.myAllInfo(stdNo);
		log.info("stdVO : " + stdVO.toString());
		String stdNm = stdVO.getStdNm();
		String deptNm = stdVO.getDeptNm();
		String stdBrdt = stdVO.getStdBrdt();
		int grade = stdVO.getGrade();
		// 틀만들고 재학증명서 ㄱㄱ
		
		String cerNo = certifiMap.get("ctfctisNo");
		String formattedCerNo = cerNoForamt(cerNo);
		
		String uploadPath = resourcePath;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
        String formattedBirth = brdtFormat(stdBrdt);
        String formattedDate = sdf.format(new Date());
        
        String pdfName = stdNm+"_재학증명서.pdf";
		String existingPdfPath = uploadPath + "/basic_certifi.pdf";
        String modifiedPdfPath = uploadPath + "/";
        File file = new File(modifiedPdfPath);
        if(!file.exists()) {
        	file.mkdirs();
        }
        modifiedPdfPath += pdfName;
        
        try {
        	// 기존의 PDF파일 읽기
			PdfReader reader = new PdfReader(existingPdfPath);
			PdfWriter writer = new PdfWriter(modifiedPdfPath);
			PdfDocument pdfDoc = new PdfDocument(reader, writer);
			
			// 기존 페이지에 추가 내용 작성
//			PdfPage page = pdfDoc.getFirstPage();
			Document document = new Document(pdfDoc);
			
			PdfFont font = PdfFontFactory.createFont("C:/Windows/Fonts/batang.ttc,0", EmbeddingStrategy.FORCE_EMBEDDED);
//			PdfFont font = PdfFontFactory.createFont("C:\\spring02\\itext\\font\\batang.ttc,0", EmbeddingStrategy.FORCE_EMBEDDED); 
			
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

			Paragraph paragraphTitle = new Paragraph("재 학 증 명 서")
                    .setFont(font).setFixedPosition(220, 680, 300)
//                    .setFont(font).setMargins(100, 0, 0, 100)
                    .setFontSize(24);
			
			Paragraph paragraphNo = new Paragraph(formattedCerNo)
					.setFont(font).setFixedPosition(77, 740, 300)
					.setFontSize(9);
			
			Paragraph paragraph2 = new Paragraph("성               명 : " + stdNm)
					.setFont(font).setFixedPosition(130, 580, 300)
					.setFontSize(14);
			Paragraph paragraph3 = new Paragraph("생   년   월   일 : " + formattedBirth)
					.setFont(font).setFixedPosition(130, 540, 300)
					.setFontSize(14);
			Paragraph paragraph4 = new Paragraph("학          부(과) : " + deptNm)
					.setFont(font).setFixedPosition(130, 500, 300)
					.setFontSize(14);
			Paragraph paragraph5 = new Paragraph("학               년 : " + grade)
					.setFont(font).setFixedPosition(130, 460, 300)
					.setFontSize(14);
			
			Paragraph paragraph6 = new Paragraph("위의 사실을 증명합니다.")
					.setFont(font).setFixedPosition(220, 355, 300)
					.setFontSize(15);
			
			Paragraph paragraph7 = new Paragraph(formattedDate)
					.setFont(font).setFixedPosition(240, 325, 300)
					.setFontSize(15);

			document.add(paragraphTitle);
			document.add(paragraphNo);
			
            document.add(paragraph2);
            document.add(paragraph3);
            document.add(paragraph4);
            document.add(paragraph5);
            document.add(paragraph6);
            document.add(paragraph7);
			
            // 작업 완료 후 닫기
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
	public String sungjukCertifiPrint(HashMap<String, String> certifiMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String jolupCertifiPrint(HashMap<String, String> certifiMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private String brdtFormat(String stdBrdt) {
		// 19950725
		// 199 0 1
		String y = stdBrdt.substring(0, 4);
		String m = stdBrdt.substring(4, 6);
		String d = stdBrdt.substring(6, 8);
		
		String brdt = y + "년 " + m + "월 " + d + "일";
		return brdt;
	}
	
	private String cerNoForamt(String cerNo) {
		// CTFCTIS004
		String end = cerNo.substring(7, 10);
		log.info("end : " + end);
		
		String foramttedCerNo = "제 K - 23000" + end + "호";
		log.info("foramttedCerNo : " + foramttedCerNo);
		return foramttedCerNo;
	}

}
