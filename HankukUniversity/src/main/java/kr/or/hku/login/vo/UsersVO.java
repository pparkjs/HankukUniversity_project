package kr.or.hku.login.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UsersVO {
	private String userNo; //사용자식별번호
	private String userPw; //사용자비밀번호
	private String userClsCd; //사용자구분코드
	private int enabled; //스프링시큐리티
}
