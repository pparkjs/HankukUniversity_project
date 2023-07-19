package kr.or.hku.counseling.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.counseling.vo.CounselingRsvtVO;
import kr.or.hku.lectureInfo.vo.LectureScheduleVO;
import kr.or.hku.professor.vo.ProfessorVO;

@Mapper
public interface CounselingMapper {
	public List<ProfessorVO> getProList(String deptCd);
	public List<LectureScheduleVO> getLecList(String proNo);
	public List<CounselingRsvtVO> getCounseList(String proNo);
	public int counselingRsvt(CounselingRsvtVO vo);
}
