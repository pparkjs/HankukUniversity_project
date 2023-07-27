package kr.or.hku.professor.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProfessorVO {
	
	private String proNo          ;
	private String deptCd         ;
	private String proJbttlCd    ;
	private String proJncmpYmd   ;
	private String proRsgntnYmd  ;
	private String proLab         ;
	private String proLabTelno   ;
	private String proNm          ;
	private String proTelno       ;
	private String sexCd          ;
	private String proZip         ;
	private String proAddr        ;
	private String proDaddr       ;
	private String proMail        ;
	private String proBrdt        ;
	private String proRrno        ;
	private String bankCd         ;
	private String proActno       ;
	private String proProfilePath;
	
	// 조인해서 가져올 학과이름, 단과대이름
	private String deptNm;
	private String colNm;
}
