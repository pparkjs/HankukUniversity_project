package kr.or.hku.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.common.vo.AttachFileVO;

@Mapper
public interface CommonFileMapper {
	public int getAttachFileNo();
	public int insertFile(AttachFileVO fileVO);
	public List<AttachFileVO> getNoticeFile(int atchFileNo);
	public int deleteFile(int fileNo);
}
