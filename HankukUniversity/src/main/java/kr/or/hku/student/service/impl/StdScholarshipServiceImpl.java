package kr.or.hku.student.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import kr.or.hku.student.vo.SclsApPayVO;
import kr.or.hku.student.vo.StdScholarshipVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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

	@Override
	public int sclsAplyModify(StdScholarshipVO sclsAplyModiVO) {
		String atchFileNo = sclsAplyModiVO.getAtchFileNo();
		log.info("atchFileNo =>>>>> " + atchFileNo);
		String uploadPath = resourcePath;
		
		// 삭제대상 파일 데이터베이스에서 삭제 및 경로에서 삭제
		List<HashMap<String, String>> delFileInfoList = sclsAplyModiVO.getDelFileInfoList();
		if(delFileInfoList != null) {
			log.info("까꿍 : " + delFileInfoList.toString());
			log.info("까꿍 : " + delFileInfoList.size());
			
			for(int i=0; i<delFileInfoList.size(); i++) {
				AttachFileVO atchFileVO = mapper.getAtchFileInfo(delFileInfoList.get(i));
				log.info("삭제할 파일 정보들 : " + atchFileVO.toString());
				mapper.deleteSclsAplyFile(delFileInfoList.get(i));
				File file = new File(uploadPath + atchFileVO.getFilePath());
				file.delete();
			}
		}
		
		// 새로운 파일 업로드 시작
		List<MultipartFile> newAplyFileList = sclsAplyModiVO.getAplyFiles();
		
		int status = 1;
		if(newAplyFileList != null && newAplyFileList.size() > 0) {
			int nextSeq = fileMapper.getNextSeq(atchFileNo);
			for(int i=0; i<newAplyFileList.size(); i++) {
				String originalName = newAplyFileList.get(i).getOriginalFilename();
				String fileSize =  FileUtils.byteCountToDisplaySize(newAplyFileList.get(i).getSize());
				String fileContentType = newAplyFileList.get(i).getContentType();
				byte[] fileData = null;
				
				try {
					fileData = newAplyFileList.get(i).getBytes();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				String savedFileName = UploadFileUtils.uploadFileVer3(uploadPath, originalName, fileData);
				
				AttachFileVO atchFileVO = new AttachFileVO();
				atchFileVO.setAtchFileNo(Integer.parseInt(atchFileNo));
				atchFileVO.setAtchFileSeq(nextSeq + i);
				atchFileVO.setFilePath(savedFileName);
				atchFileVO.setFileOrgnlFileNm(originalName);
				atchFileVO.setFileSize(fileSize);
				atchFileVO.setFileContType(fileContentType);
				
				int fileStatus = fileMapper.insertFile(atchFileVO);
				if(fileStatus == 0) {
					status = 0;
				}
			}
		}
		return status;
	}

	@Override
	public int deleteSclsAply(HashMap<String, String> delData) {
		String atchFileNo = delData.get("atchFileNo");
		String sclsapNo = delData.get("sclsapNo");
		
		String uploadPath = resourcePath;
		
		int status = 1;
		// 삭제할 파일 리스트 정보
		List<AttachFileVO> delFileList = mapper.getAtchFileInfoList(atchFileNo);
		if(delFileList != null && delFileList.size() > 0) {
			for(int i=0; i<delFileList.size(); i++) {
				File file = new File(uploadPath + delFileList.get(i).getFilePath());
				file.delete();
			}
		}
		int std1 = mapper.deleteSclsAplyFile2(atchFileNo);
		
		// 신청내역 삭제
		int std2 = mapper.deleteSclsAply(sclsapNo);
		
		if(std1 == 0 || std2 == 0) {
			status = 0;
		}
		
		return status;
	}

	@Override
	public List<SclsApPayVO> selectSclsapPayList(HashMap<String, String> sclsapPaySearchData) {
		return mapper.selectSclsapPayList(sclsapPaySearchData);
	}
}
