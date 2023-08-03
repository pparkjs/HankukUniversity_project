package kr.or.hku.common.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.common.vo.AttachFileVO;

public interface CommonFileService {

	public int getAttachFileNo();

	public int insertFile(MultipartFile file, int attachFileNo, int i);

	public List<AttachFileVO> getFileList(int atchFileNo);

	public List<AttachFileVO> boardFileList(int atchFileNo);

	public int deleteFile(int fileNo);

}
