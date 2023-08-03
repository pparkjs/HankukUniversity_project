package kr.or.hku.common.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.common.mapper.CommonFileMapper;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.vo.AttachFileVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommonFileServiceImpl implements CommonFileService {

	@Autowired
	private CommonFileMapper fileMapper;

	// 업로드 패스
	@Resource(name = "uploadPath")
	private String resourcePath;

	@Override
	public int getAttachFileNo() {
		return fileMapper.getAttachFileNo();
	}

	@Override
	public int insertFile(MultipartFile file, int attachFileNo,int i) {
		String uploadPath = resourcePath;
		File folder = new File(uploadPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		// 랜덤 uuid 생성
		String uuid = UUID.randomUUID().toString();
		// uuid + 오리지날 네임 결합
		String saveFileName = "/" + uuid + "_" + file.getOriginalFilename();
		// 업로드 패스 저장
		uploadPath = resourcePath + saveFileName;
		
		try {
			file.transferTo(new File(uploadPath));
		} catch (IllegalStateException | IOException e) {
			log.error(e.getMessage());
		}
		AttachFileVO fileVO = new AttachFileVO();
		fileVO.setAtchFileNo(attachFileNo);
		fileVO.setAtchFileSeq(i);
		fileVO.setFileContType(file.getContentType());
		fileVO.setFileOrgnlFileNm(file.getOriginalFilename());
		fileVO.setFilePath(saveFileName);
		fileVO.setFileSize(FileUtils.byteCountToDisplaySize(file.getSize()));
		
		int cnt = fileMapper.insertFile(fileVO);
		return cnt;
	}
	
	// 공지사항 파일 가져오기
	@Override
	public List<AttachFileVO> getFileList(int atchFileNo) {
		return fileMapper.getNoticeFile(atchFileNo);
	}
	
	@Override
	public int deleteFile(int fileNo) {
		return fileMapper.deleteFile(fileNo);
	}

	@Override
	public List<AttachFileVO> boardFileList(int atchFileNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
