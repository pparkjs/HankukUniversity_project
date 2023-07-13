package kr.or.hku.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.admin.vo.LectureBasicVO;
import kr.or.hku.admin.vo.LectureProgramVO;

public interface LecAplyAdminService {
	public List<Map<String, Object>> getLecApList();
	public LectureBasicVO getLecBasicOne(int lecApNo);
	public LectureProgramVO getLecProgam(int lecApNo);
}
