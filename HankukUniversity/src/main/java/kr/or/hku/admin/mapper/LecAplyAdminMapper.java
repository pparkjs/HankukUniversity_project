package kr.or.hku.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.LectureBasicVO;
import kr.or.hku.admin.vo.LectureProgramVO;

@Mapper
public interface LecAplyAdminMapper {
	public List<Map<String, Object>> getLecApList();
	public LectureBasicVO getLecBasicOne(int lecApNo);
	public LectureProgramVO getLecProgam(int lecApNo);
}
