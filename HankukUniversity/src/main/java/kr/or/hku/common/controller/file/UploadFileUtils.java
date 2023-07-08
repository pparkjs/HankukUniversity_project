package kr.or.hku.common.controller.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws IOException {
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString() + "_" + originalName;
		
		// 2023/06/07 폴더 경로를 만들고, /2023/03/07 폴더 경로를 리턴한다.
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath, savedName);
		
		FileCopyUtils.copy(fileData, target); // 위에서 만들어진 경로의 파일명을 가지고 파일 복사를 진행
		
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);	// 확장자
		
		String uploadedFileName = savedPath.replace(File.separatorChar, '/') + "/" + savedName;
		
		// 확장자가 이미지 파일이면 s_가 붙은 파일의 썸네일 이미지 파일을 생성한다.
		if(MediaUtils.getMediaType(formatName) != null) {
			makeThumnail(uploadPath,savedPath,savedName);
		}
		return uploadedFileName;
	}
	
	private static void makeThumnail(String uploadPath, String path, String fileName) throws IOException {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		// Method.AUTOMATIC : 최소 시간 내에 가장 잘 보이는 이미지를 얻기 위한 사용방식
		// Mode.FIT_TO_HEIGHT : 이미지 방향과 상관없이 주어진 높이 내에서 가장 잘 맞는 이미지로 계산(높이위주)
		// targetSize : 값 100, 정사각형 사이즈로 100 x 100
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		// 업로드 한 원본 이미지를 가지고 's_'를 붙여 임시 파일로 만든다.
		String thumnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		ImageIO.write(destImg, formatName.toUpperCase(), newFile); // s_가 붙은 썸네일 이미지를 만든다.
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		// DecimalFormat("00") :: 두자리에서 빈자리는 0으로 채워주는 거 ex) 1월 01월 이렇게
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		// /2023/05/07 같은 폴더 경로 만들어줌
		return datePath;
	}
	
	
	// 뒤에 3개의 타입이 스트링으로 동일해서 가변 인자로 받는다
	// 키워드 '...'을 사용한다.
	// [사용법] 타입...변수명 형태로 사용
	// yearPath, monthPath, datePath가 배열로 들어가 처리
	private static void makeDir(String uploadPath, String...paths) {
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if (!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
	
}
