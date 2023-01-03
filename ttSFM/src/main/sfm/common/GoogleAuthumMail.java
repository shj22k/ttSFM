package main.sfm.common;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GoogleAuthumMail {
	
	public void authumMail(String resiveMail, String sendMsg) {
		
		String mailSubject = "임시 인증번호 메일 입니다.";
		sendMsg = "<h2 style='color:blue'> " + sendMsg + " </h2>";
		System.out.println("googleMailSender resiveMail >>> "	 	+ resiveMail);
		System.out.println("googleMailSender sendMsg >>> : " 		+ sendMsg);
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("lee15975@gmail.com", "snwzegziiwnlocre");
			}
		});
		
		
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(resiveMail, "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(resiveMail));
			message.setSubject(mailSubject);
			message.setContent(sendMsg, "text/html; charset=utf-8");

			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public static void main(String args[]) {
				
		String resiveMail = "lee15975@gmail.com";
		String sendMsg = "123456";
		
		GoogleAuthumMail gms = new GoogleAuthumMail();
		gms.authumMail(resiveMail, sendMsg);
	}
}
