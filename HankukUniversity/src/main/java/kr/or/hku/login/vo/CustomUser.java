package kr.or.hku.login.vo;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;


public class CustomUser extends User{
	
	private SecUserVO user;
	
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username,password,authorities);
	}
	
	public CustomUser(SecUserVO user) {
		super(user.getUserNo(), user.getUserPw(), 
				user.getUserAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getUserAuth())).collect(Collectors.toList()));
		this.user = user;
	}
		
	public SecUserVO getMember() {
		return user;
	}
	
	public void setMember(SecUserVO user) {
		this.user = user;
	}
}

