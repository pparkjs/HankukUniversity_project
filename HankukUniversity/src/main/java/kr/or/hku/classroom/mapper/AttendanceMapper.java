package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.AttendanceVO;

@Mapper
public interface AttendanceMapper {
 
	public List<AttendanceVO> dmrList();
	public AttendanceVO dmrDetail(String stdNo);
	public int writeDmr(AttendanceVO attendanceVO);
	public int updateDmr(AttendanceVO attendanceVO);
	public int deleteDmr(String stdNo);

}
