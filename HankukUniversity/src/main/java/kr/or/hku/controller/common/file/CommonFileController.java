package kr.or.hku.controller.common.file;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/common/file")
@Slf4j
public class CommonFileController {

	// 업로드 패스
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	@ResponseBody
	@PostMapping(value = "/upload", produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadFile(List<MultipartFile> preivewFiles) {
		log.info("파일 업로드 호출 되었는지 확인");
		ResponseEntity<String> entity = null;
		String savedName = "";
		if (preivewFiles.size() > 0 && preivewFiles != null) {
			for (int i = 0; i < preivewFiles.size(); i++) {
				MultipartFile file = preivewFiles.get(i);
				log.info(file.getOriginalFilename());
				log.info(file.getSize() + "");
//				if (file.getSize()) {
//					
//				}
				try {
					if (i > 0) {
						savedName += ",";
					}
					savedName += UploadFileUtils.uploadFile(resourcePath, file.getOriginalFilename(), file.getBytes());
				} catch (IOException e) {log.error(e.getMessage());}
			}
			entity = new ResponseEntity<String>(savedName, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping(value = "/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws FileNotFoundException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		log.info("filename : " + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(resourcePath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.lastIndexOf(".") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" 
								+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return entity;
	}
}
