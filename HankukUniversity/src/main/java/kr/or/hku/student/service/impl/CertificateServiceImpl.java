package kr.or.hku.student.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.VerticalAlignment;

import kr.or.hku.common.mapper.CommonMapper;
import kr.or.hku.student.mapper.CertificateMapper;
import kr.or.hku.student.service.CertificateService;
import kr.or.hku.student.vo.CertificateIssuVO;
import kr.or.hku.student.vo.CertificateVO;
import kr.or.hku.student.vo.ScoreInfoVO;
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
		log.info("성적증명서 만드는중....." + "★☆★☆★☆★☆");
		
		String stdNo = certifiMap.get("stdNo");
		StudentVO stdVO = commonMapper.myAllInfo(stdNo);
		log.info("stdVO : " + stdVO.toString());
		String stdNm = stdVO.getStdNm();
		String deptNm = stdVO.getDeptNm();
		String stdBrdt = stdVO.getStdBrdt();
		int grade = stdVO.getGrade();
		
		String cerNo = certifiMap.get("ctfctisNo");
		String formattedCerNo = cerNoForamt(cerNo);
		
		String uploadPath = resourcePath;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
        String formattedBirth = brdtFormat(stdBrdt);
        String formattedDate = sdf.format(new Date());
        
        String pdfName = stdNm+"_성적증명서.pdf";
        String modifiedPdfPath = uploadPath + "/itext/certificate/";
        File file = new File(modifiedPdfPath);
        if(!file.exists()) {
        	file.mkdirs();
        }
        modifiedPdfPath += pdfName;
        
        
        try {
			PdfWriter writer = new PdfWriter(modifiedPdfPath);
			PdfDocument pdfDoc = new PdfDocument(writer);
			
			Document document = new Document(pdfDoc);
			
			PdfFont font = PdfFontFactory.createFont("C:/Windows/Fonts/batang.ttc,0", EmbeddingStrategy.FORCE_EMBEDDED);
			
			Paragraph paragraphTitle = new Paragraph("성 적 증 명 서")
                    .setFont(font).setFixedPosition(230, 740, 300)
                    .setFontSize(21);
		
			Paragraph paragraphNo = new Paragraph(formattedCerNo)
					.setFont(font).setFixedPosition(77, 770, 300)
					.setFontSize(9);
			Paragraph paragraph = new Paragraph("위의 사실을 증명합니다.")
					.setFont(font).setFixedPosition(220, 110, 300)
					.setFontSize(15);
			Paragraph paragraphBottom = new Paragraph("한   국   대   학   교   총   장")
					.setFont(font).setFixedPosition(120, 60, 380)
					.setFontSize(26).setBold();
			
			document.add(paragraphTitle)
					.add(paragraphNo)
					.add(paragraph)
					.add(paragraphBottom);
			
			// ** 이미지 생성 및 삽입 **
			String imgSrc = resourcePath + "\\itext\\총장인1.jpg";
			ImageData data = ImageDataFactory.create(imgSrc);
			data.setWidth(60f);
			data.setHeight(60f);
			Image image1 = new Image(data);
			image1.setFixedPosition(400, 50);
			document.add(image1);
			
			// 학교 로고 이미지 워터마크
			String imgPath = "C:\\uploadfiles\\itext\\logo_water.png";
			ImageData imageData = ImageDataFactory.create(imgPath);
			Image waterImage = new Image(imageData);
			log.info("width : "+waterImage.getImageWidth());
			log.info("height : "+waterImage.getImageHeight());
			waterImage.setWidth(350f);
			waterImage.setHeight(350f);
			waterImage.setFixedPosition(131, 230);
			waterImage.setOpacity(0.3f);	// 흐리게 설정하는 부분
			document.add(waterImage);
			
			// ** 테이블 생성 및 삽입 **
			// 인적사항 담을 테이블
			float columnWidth[] = {150f, 150f}; // 열의 크기 지정 
			Table table = new Table(columnWidth); // 주어진 크기에 맞는 테이블 생성 
			table.setFixedPosition(100, 680, 350);
			
            Cell cellInfo = new Cell()
                    .add(new Paragraph("성               명 : " + stdNm).setFont(font).setFontSize(9))
                    .setTextAlignment(TextAlignment.LEFT)
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorder(Border.NO_BORDER);
            table.addCell(cellInfo);
            
            cellInfo = new Cell()
            		.add(new Paragraph("학               번 : " + stdNo).setFont(font).setFontSize(9))
            		.setTextAlignment(TextAlignment.LEFT)
            		.setVerticalAlignment(VerticalAlignment.MIDDLE)
            		.setBorder(Border.NO_BORDER);
            table.addCell(cellInfo);
            
            cellInfo = new Cell()
            		.add(new Paragraph("생   년   월   일 : " + formattedBirth).setFont(font).setFontSize(9))
            		.setTextAlignment(TextAlignment.LEFT)
            		.setVerticalAlignment(VerticalAlignment.MIDDLE)
            		.setBorder(Border.NO_BORDER);
            table.addCell(cellInfo);
            
            cellInfo = new Cell()
            		.add(new Paragraph("학          부(과) : " + deptNm).setFont(font).setFontSize(9))
            		.setTextAlignment(TextAlignment.LEFT)
            		.setVerticalAlignment(VerticalAlignment.MIDDLE)
            		.setBorder(Border.NO_BORDER);
            table.addCell(cellInfo);
            
            
            // 성적담을 테이블 생성
            Table table2 = new Table(3);
            table2.setFixedPosition(80, 150, 435);
            
            // 테이블 헤더 역할 테이블
            float columnWidth2[] = {20f, 70f, 20f, 20f};
            Table headerTable = new Table(columnWidth2);
            Cell hcell = new Cell();
            hcell.add(new Paragraph("구분").setFont(font).setFontSize(6))
		            .setTextAlignment(TextAlignment.CENTER)
		    		.setVerticalAlignment(VerticalAlignment.MIDDLE)
		    		.setBorder(Border.NO_BORDER);
            headerTable.addCell(hcell);
            
            hcell = new Cell();
            hcell.add(new Paragraph("교과목명").setFont(font).setFontSize(6))
		            .setTextAlignment(TextAlignment.CENTER)
		    		.setVerticalAlignment(VerticalAlignment.MIDDLE)
		    		.setBorder(Border.NO_BORDER);
            headerTable.addCell(hcell);
            hcell = new Cell();
            hcell.add(new Paragraph("학점").setFont(font).setFontSize(6))
		            .setTextAlignment(TextAlignment.CENTER)
		    		.setVerticalAlignment(VerticalAlignment.MIDDLE)
		    		.setBorder(Border.NO_BORDER);
            headerTable.addCell(hcell);
            hcell = new Cell();
            hcell.add(new Paragraph("성적").setFont(font).setFontSize(6))
		            .setTextAlignment(TextAlignment.CENTER)
		    		.setVerticalAlignment(VerticalAlignment.MIDDLE)
		    		.setBorder(Border.NO_BORDER);
            headerTable.addCell(hcell);
            
            Cell titleCell = null;
            for(int i=1; i<=3; i++) {
            	titleCell = new Cell().add(headerTable)
            			.setTextAlignment(TextAlignment.CENTER)
            			.setVerticalAlignment(VerticalAlignment.MIDDLE)
            			.setHeight(14);
            	table2.addCell(titleCell);
            }
            
            Cell contentCell = null;

            // 성적을 담을 테이블 칸 생성
            contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell(2,1)
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.MIDDLE)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	contentCell = new Cell()
        			.setTextAlignment(TextAlignment.LEFT)
        			.setVerticalAlignment(VerticalAlignment.TOP)
        			.setHeight(120);
        	table2.addCell(contentCell);
        	
        	// 기본적으로 테이블의 셀이 가로 방향으로 넣어지지만 세로 방향으로 값을 넣어주기 위해 
        	// 테이블 안의 셀들을 넣어주고자하는 방향대로 꺼내서 list에 담아준다.
        	// 위에서 셀을 만들 때 rowspan옵션을 준 셀이 있기때문에 총 11개의 셀이 나온다.
            List<Cell> cellList = new ArrayList<Cell>();
            cellList.add(table2.getCell(1, 0));
            cellList.add(table2.getCell(2, 0));
            cellList.add(table2.getCell(3, 0));
            cellList.add(table2.getCell(4, 0));
            cellList.add(table2.getCell(1, 1));
            cellList.add(table2.getCell(2, 1));
            cellList.add(table2.getCell(3, 1));
            cellList.add(table2.getCell(4, 1));
            cellList.add(table2.getCell(1, 2));
            cellList.add(table2.getCell(2, 2));
            cellList.add(table2.getCell(3, 2));
//            cellList.add(table2.getCell(4, 2)); rowspan 옵션으로 없어진 셀
            
            
            // 해당 학번의 학생이 다닌 년도와 학기를 조회해서 담은 list
            List<String> completeSemesterList = mapper.getCompleteSemesters(stdNo);
			log.info("completeSemesterList : " + completeSemesterList.toString());
			
			// 해당 학번의 학생이 학기별로 이수한 과목에 대한 성적정보가 담긴 list
            List<ScoreInfoVO> scoreInfoList = mapper.getScoreInfo(stdNo);
            log.info("scoreInfoList : " + scoreInfoList.toString());
            
            
            Table semesterTable = null;
            Table scoreTable = null;
            Cell scoreCell = null;
            for(int i=0; i<completeSemesterList.size(); i++) {
            	scoreTable = new Table(columnWidth2);
            	
            	semesterTable = new Table(1);
            	Cell semesterCell = new Cell()
            			.setWidth(130)
            			.add(new Paragraph(yearSemesterFormat(completeSemesterList.get(i)))
            					.setFont(font)
            					.setFontSize(8))
            			.setTextAlignment(TextAlignment.CENTER)
    		    		.setVerticalAlignment(VerticalAlignment.MIDDLE)
    		    		.setBorder(Border.NO_BORDER);
            	semesterTable.addCell(semesterCell);
            	
            	
            	for(int j=0; j<scoreInfoList.size(); j++) {
            		String complete_ys = scoreInfoList.get(j).getLecapYrsem();
            		if(completeSemesterList.get(i).equals(complete_ys)) {
            			// 테이블 만들어서 셀에 삽입
            			
            			// 해당 학기성적에 과목구분 넣기
            			log.info("courseClsfFormat(scoreInfoList.get(j).getCourseClsf()) : " + courseClsfFormat(scoreInfoList.get(j).getCourseClsf()));
            			scoreCell = new Cell();
            			scoreCell.add(new Paragraph(courseClsfFormat(scoreInfoList.get(j).getCourseClsf())).setFont(font).setFontSize(6))
			    		            .setTextAlignment(TextAlignment.CENTER)
			    		    		.setVerticalAlignment(VerticalAlignment.MIDDLE)
			    		    		.setBorder(Border.NO_BORDER);
            			scoreTable.addCell(scoreCell);
            			// 해당 학기성적에 과목이름 넣기
            			scoreCell = new Cell();
            			scoreCell.add(new Paragraph(scoreInfoList.get(j).getSubNm()).setFont(font).setFontSize(6))
            			.setTextAlignment(TextAlignment.LEFT)
            			.setVerticalAlignment(VerticalAlignment.MIDDLE)
            			.setBorder(Border.NO_BORDER);
            			scoreTable.addCell(scoreCell);
            			
            			// 해당 학기성적에 이수학점 넣기
            			log.info("scoreInfoList.get(j).getCrsEarnedCrd() : " + scoreInfoList.get(j).getCrsEarnedCrd());
            			scoreCell = new Cell();
            			scoreCell.add(new Paragraph(scoreInfoList.get(j).getCrsEarnedCrd()).setFont(font).setFontSize(6))
            			.setTextAlignment(TextAlignment.CENTER)
            			.setVerticalAlignment(VerticalAlignment.MIDDLE)
            			.setBorder(Border.NO_BORDER);
            			scoreTable.addCell(scoreCell);
            			// 해당 학기성적에 성적 넣기
            			scoreCell = new Cell();
            			scoreCell.add(new Paragraph(scoreFormat(scoreInfoList.get(j).getCrsScr())).setFont(font).setFontSize(6))
            			.setTextAlignment(TextAlignment.CENTER)
            			.setVerticalAlignment(VerticalAlignment.MIDDLE)
            			.setBorder(Border.NO_BORDER);
            			scoreTable.addCell(scoreCell);
            			
            		}
            	}
            	cellList.get(i).add(semesterTable);
            	cellList.get(i).add(scoreTable);
            }
            
            
            
            
            Table sub_divi = new Table(2);
            
            Cell cell = new Cell(0, 2)
            		.add(new Paragraph("* 교과목 구분")
            				.setFont(font)
            				.setFontSize(8))
            		.setBorder(Border.NO_BORDER);
            sub_divi.addCell(cell);
            
            cell = new Cell()
            		.add(new Paragraph("01. 교양필수")
            				.setFont(font)
            				.setFontSize(8))
            		.setTextAlignment(TextAlignment.LEFT)
            		.setBorder(Border.NO_BORDER);
            sub_divi.addCell(cell);
            cell = new Cell()
            		.add(new Paragraph("02. 교양선택")
            				.setFont(font)
            				.setFontSize(8))
            		.setTextAlignment(TextAlignment.LEFT)
            		.setBorder(Border.NO_BORDER);
            sub_divi.addCell(cell);
            cell = new Cell()
            		.add(new Paragraph("03. 전공필수")
            				.setFont(font)
            				.setFontSize(8))
            		.setTextAlignment(TextAlignment.LEFT)
            		.setBorder(Border.NO_BORDER);
            sub_divi.addCell(cell);
            cell = new Cell()
            		.add(new Paragraph("04. 전공선택")
            				.setFont(font)
            				.setFontSize(8))
            		.setTextAlignment(TextAlignment.LEFT)
            		.setBorder(Border.NO_BORDER);
            sub_divi.addCell(cell);
            sub_divi.setFixedPosition(373, 155, 150);
			
            document.add(table);
			document.add(table2);
			document.add(sub_divi);
			
            // 작업 완료 후 닫기
            document.close();
            pdfDoc.close();
            writer.close();
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modifiedPdfPath;
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
//		log.info("end : " + end);
		
		String foramttedCerNo = "제 K - 23000" + end + "호";
//		log.info("foramttedCerNo : " + foramttedCerNo);
		return foramttedCerNo;
	}
	
	// '2014_1'형식을 '2014  학년도  1 학기' 형식으로 바꿔주는 메서드
	private String yearSemesterFormat(String yearSemester) {
		String[] parts = yearSemester.split("_");
	    String year = parts[0];
	    String semester = parts[1];
	    
	    String result = year + "  학년도   " + semester + " 학기";
	    return result;
	}
	
	private String courseClsfFormat(String courseClsf) {
		String courseClsfNo = null;
		
		if(courseClsf.equals("ER")) {
			courseClsfNo = "01";
		} else if(courseClsf.equals("ES")) {
			courseClsfNo = "02";
		} else if(courseClsf.equals("MR")) {
			courseClsfNo = "03";
		} else if(courseClsf.equals("MS")) {
			courseClsfNo = "04";
		}
		
		return courseClsfNo;
	}
	
	private String scoreFormat(String crsScr) {
		String formattedCrsScr = null;
		
		if(crsScr.equals("4.5")) {
			formattedCrsScr = "A+";
		} else if(crsScr.equals("4.0")) {
			formattedCrsScr = "Ao";
		} else if(crsScr.equals("3.5")) {
			formattedCrsScr = "B+";
		} else if(crsScr.equals("3.0")) {
			formattedCrsScr = "Bo";
		} else if(crsScr.equals("2.5")) {
			formattedCrsScr = "C+";
		} else if(crsScr.equals("2.0")) {
			formattedCrsScr = "Co";
		} else if(crsScr.equals("1.5")) {
			formattedCrsScr = "D+";
		} else if(crsScr.equals("1.0")) {
			formattedCrsScr = "Do";
		} else {
			formattedCrsScr = "F";
		}
		
		return formattedCrsScr;
	}

	@Override
	public String nextCtfctisNo() {
		return mapper.nextCtfctisNo();
	}

	@Override
	public int payInfoInsert(HashMap<String, String> payInfoMap) {
		return mapper.payInfoInsert(payInfoMap);
	}

}
