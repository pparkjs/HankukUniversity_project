package kr.or.hku.common.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;

public interface CommonSMSService {
	/**
	 * 휴강된 수업을 학생에게 전파하는 기능
	 * @param dataMapList 학생들정보
	 * @param msg 전달할 내용
	 * @return
	 */
	public ServiceResult sendMsgToStudents(List<Map<String, String>> stdList, String msg);

	public ServiceResult sendShMsg(List<Map<String, String>> userList, String msg);
}
