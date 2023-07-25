package kr.or.hku.login.service.impl;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.vo.EmployeeVO;
import kr.or.hku.login.mapper.LoginMapper;
import kr.or.hku.login.service.ILoginService;
import kr.or.hku.login.vo.ApiVO;
import kr.or.hku.login.vo.UsersVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;

@Service
public class LoginServiceImpl implements ILoginService {
	 private static final String CHARACTERS = "abcdefghijklmnopqrstuvwxyz0123456789";
	   private static final int LENGTH = 6;
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Inject
	BCryptPasswordEncoder pe;
	
	
	
	@Override
	public UsersVO loginUser(String username) {
		return loginMapper.loginUser(username);
	}
	@Override
	public StudentVO studentUser(String userNo) {
		return loginMapper.studentUser(userNo);
	}
	@Override
	public ProfessorVO professorUser(String userNo) {
		// TODO Auto-generated method stub
		return loginMapper.professorUser(userNo);
	}

	@Override
	public EmployeeVO employeeUser(String userNo) {
		// TODO Auto-generated method stub
		return loginMapper.employeeUser(userNo);
	}
	
	@Override
	public String forgetProcess(String userName, String type, String userBd) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("userName", userName);
		map.put("type", type);
		map.put("userBd", userBd);
		// TODO Auto-generated method stub
		return loginMapper.forgetProcess(map);
	}
	
	@Override
	public int sendPassword(String userNo, String userEmail) throws EmailException {
		String cslcd = loginMapper.selectUserClsCd(userNo);
		Map<String,String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("userEmail", userEmail);
		map.put("clscd", cslcd);
		
		int res = loginMapper.getIsEmail(map);
		UsersVO user = loginMapper.loginUser(userNo);
		
		//랜덤난수로 암호화해서 user비번 업데이트
		String rs = randomPw();
		String pepw = pe.encode(rs);
		System.out.println("랜덤 비번"+rs); 
		System.out.println("암호화비번"+pepw);
		user.setUserPw(pepw);
		int pw = loginMapper.updatePw(user);
		
		//이메일 발송 메소드
		if(res > 0) {
			ApiVO vo =  loginMapper.getAuthInfo("MAIL");
			HtmlEmail mail= new HtmlEmail();
			mail.setHostName("smtp.naver.com");
			mail.setSmtpPort(465);
			mail.setCharset("utf-8");
			mail.setAuthenticator(new DefaultAuthenticator(vo.getApiId(), vo.getApiPw()));
			mail.setSSL(true);
			mail.setFrom(vo.getApiId(),"한국대학교");
			mail.setSubject("[한국대학교] 임시비밀번호 안내입니다.");
			mail.setHtmlMsg("<html><div style='width:100%; height:50px; background:#800000;'><h1 style='color:white'> 임시비밀번호 발급 </h1></div>"
					+ "<br><div style='text-align:center;'>"
					+"<h4>안녕하세요,한국대학교에서 요청하신 임시비밀번호를 전달드립니다.<br>고객님의 개인정보 보호를 위해 로그인 즉시 비밀번호를 재설정바랍니다." 
					+ "<h2>임시비밀번호는"+ rs +"입니다.</h2></div>"
							+ "<div style='width:100%; height:30px; background:#800000;'></div></html>");
			mail.addTo(userEmail);
			mail.send();
		}else {
			return res;
		}
		return res;
	}

    public static String randomPw() {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(LENGTH);

        for (int i = 0; i < LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            sb.append(randomChar);
        }

        return sb.toString();
    }
	@Override
	public int changePassword(Map<String, String> map) {
		String temporary = map.get("temporary");
		String newPw = map.get("newPw");
		String userNo = map.get("userNo");
		UsersVO user = loginMapper.loginUser(userNo); 
		int res;
		boolean rs = pe.matches(temporary, user.getUserPw());
		if(rs) {
			map.put("newPw", pe.encode(newPw));
			res = loginMapper.changePassword(map);
		}else {
			res = 0 ;
		}
		
		return res;
	}
}


