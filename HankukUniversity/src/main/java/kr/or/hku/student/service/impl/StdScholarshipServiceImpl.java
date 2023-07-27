package kr.or.hku.student.service.impl;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.admin.vo.ScholarshipVO;
import kr.or.hku.common.controller.file.UploadFileUtils;
import kr.or.hku.common.mapper.CommonFileMapper;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.student.mapper.StdScholarshipMapper;
import kr.or.hku.student.service.StdScholarshipService;
import kr.or.hku.student.vo.StdScholarshipVO;

@Service
public class StdScholarshipServiceImpl implements StdScholarshipService {
	
	@Autowired
	private CommonFileMapper fileMapper;
	
	@Autowired
	private StdScholarshipMapper mapper;
	
	@Resource(name = "uploadPath")
	private String resourcePath;

	@Override
	public List<ScholarshipVO> selectScholarList() {
		return mapper.selectScholarList();
	}

	@Override
	public List<StdScholarshipVO> selectSclsAplyList(String stdNo) {
		return mapper.selectSclsAplyList(stdNo);
	}

	@Override
	public int sclsAplyInsert(StdScholarshipVO sclsAplyVO) {
		String uploadPath = resourcePath;
		
		int atchFileNo = fileMapper.getAttachFileNo();
		sclsAplyVO.setAtchFileNo(""+atchFileNo);
		
		List<MultipartFile> aplyFiles = sclsAplyVO.getAplyFiles();
		
		int status = 1;
		for(int i=0; i<aplyFiles.size(); i++) {
			String originalName = aplyFiles.get(i).getOriginalFilename();
			String fileSize =  FileUtils.byteCountToDisplaySize(aplyFiles.get(i).getSize());
			String fileContentType = aplyFiles.get(i).getContentType();
			byte[] fileData = null;
			
			try {
				fileData = aplyFiles.get(i).getBytes();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			String savedFileName = UploadFileUtils.uploadFileVer3(uploadPath, originalName, fileData);
			
			AttachFileVO atchFileVO = new AttachFileVO();
			atchFileVO.setAtchFileNo(atchFileNo);
			atchFileVO.setAtchFileSeq(i);
			atchFileVO.setFilePath(savedFileName);
			atchFileVO.setFileOrgnlFileNm(originalName);
			atchFileVO.setFileSize(fileSize);
			atchFileVO.setFileContType(fileContentType);
			
			int fileStatus = fileMapper.insertFile(atchFileVO);
			if(fileStatus == 0) {
				status = 0;
			}
		}
		int sclsAplyStatus = mapper.sclsAplyInsert(sclsAplyVO);
		if(sclsAplyStatus == 0) {
			status = 0;
		}
		
		return status;
	}

	@Override
	public StdScholarshipVO sclsAplyDetail(String sclsapNo) {
		return mapper.sclsAplyDetail(sclsapNo);
	}

}
