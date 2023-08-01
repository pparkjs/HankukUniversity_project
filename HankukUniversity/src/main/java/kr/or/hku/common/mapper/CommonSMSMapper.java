package kr.or.hku.common.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.SmsTemplateVO;

@Mapper
public interface CommonSMSMapper {

	public int addSmsTemplate(SmsTemplateVO smsTemplateVO);

	public int updateSmsTemplate(SmsTemplateVO smsTemplateVO);

}
