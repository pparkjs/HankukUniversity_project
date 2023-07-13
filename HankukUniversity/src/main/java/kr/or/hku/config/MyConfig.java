package kr.or.hku.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;

/*
 * 개발할 때 Development Mode, 필요한 값이 내눈 바로 근처에 있어야 됨
 *        Phase mode/ 공동작업은 통일성, 특히 설정은 개발자마다 따로 가져가는 건 회사에서 엄청 큰일!
 * Release  Production Mode  정리한거
 */

@Slf4j
@Configuration
@EnableWebMvc
public class MyConfig  implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		log.debug("요기가 실행되었는지 check?");
		registry.addResourceHandler("/download/**")             // 웹 접근 경로 
		        .addResourceLocations("file:///c:/uploadfiles/");  // 서버내 실제 경로
	}

}