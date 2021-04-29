package com.shs.s1.email;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {

	public static void sendMail(String email, String subject, String msg) throws Exception {
		//mail server 설정 
		String charSet ="utf-8";
		String hostSMTP="smtp.naver.com";
		
		//SMTP 서버명
		String hostSMTPid=""; //네이버 이메일
		String hostSMTPpwd=""; //네이버 비밀번호
		
		//보내는 사람
		String fromEmail ="shs@naver.com";
		String fromName="SHS";
		
		//email 전송
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
