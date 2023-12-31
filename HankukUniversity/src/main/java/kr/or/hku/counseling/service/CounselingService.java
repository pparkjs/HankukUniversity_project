package kr.or.hku.counseling.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.hku.ServiceResult;
import kr.or.hku.counseling.vo.CounselingRsvtVO;
import kr.or.hku.lectureInfo.vo.LectureScheduleVO;
import kr.or.hku.professor.vo.ProfessorVO;

public interface CounselingService {
	public List<ProfessorVO> getProList(String deptCd);
	public List<LectureScheduleVO> getLecList(String proNo);
	public List<CounselingRsvtVO> getCounseList(String proNo);
	public ServiceResult counselingRsvt(CounselingRsvtVO vo, HttpSession session);
	public List<CounselingRsvtVO> counselingRecord(String stdNo);
	public List<CounselingRsvtVO> studentCounseList(String proNo);
	public ServiceResult studentCounseAppv(CounselingRsvtVO vo, HttpSession session);
	public ServiceResult studentCounseRej(CounselingRsvtVO vo, HttpSession session);
}
