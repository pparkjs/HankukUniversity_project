package kr.or.hku.security;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.or.hku.login.mapper.LoginMapper;
import kr.or.hku.login.vo.CustomUser;
import kr.or.hku.login.vo.SecUserVO;
import kr.or.hku.login.vo.UsersVO;

public class CustomUserDetailsService implements UserDetailsService {

	private static final Logger log = LoggerFactory.getLogger(CustomUserDetailsService.class);
	@Inject
	private BCryptPasswordEncoder pe;
	@Inject
	private LoginMapper loginMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		String password = "1234";
		System.out.println("### 인코딩한 비밀번호를 확인합니다. ### : " + pe.encode(password));
		log.debug("### 인코딩한 비밀번호를 확인합니다. ### : " + pe.encode(password));
		log.debug("### 인코딩한 비밀번호를 확인합니다. ### : " + pe.encode(password));
		log.debug("### 인코딩한 비밀번호를 확인합니다. ### : " + pe.encode(password));
		log.debug("### 인코딩한 비밀번호를 확인합니다. ### : " + pe.encode(password));
		log.debug("### 인코딩한 비밀번호를 확인합니다. ### : " + pe.encode(password));
		log.info("load User by username : " + username);
		
		// userName은 사용자명이 아니라 사용자 아이디를 의미한다.
		// member를 가지고 최종 리턴해서 넘겨야할 UserDetails를 만들어준다.
		SecUserVO user;
		try {
			String clsCd = loginMapper.selectUserClsCd(username);
			UsersVO uVO = new UsersVO();
			uVO.setUserNo(username);
			uVO.setUserClsCd(clsCd);
			user = loginMapper.readByUserNo(uVO);
			log.info("query by member mapper : " + user);
			return user == null ? null : new CustomUser(user);
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return null;
	}

}













