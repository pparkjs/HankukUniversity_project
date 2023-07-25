package kr.or.hku.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomNoOpPasswordEncoder implements PasswordEncoder {
	
	private static final Logger log = LoggerFactory.getLogger(CustomNoOpPasswordEncoder.class);

	@Override
	public String encode(CharSequence rawPassword) {
		log.info("before encode : " + rawPassword);
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.info("matches : " + rawPassword + " ::: " + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}

}
