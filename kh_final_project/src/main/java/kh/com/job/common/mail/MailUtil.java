package kh.com.job.common.mail;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class MailUtil {
	
	private static JavaMailSender mailSender;
	
	@Autowired
	public void MailUtil(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public static int mailSend(String title, String from, String text, String to, String[] cc, int ccNum) {
		if(from == null || from.equals("")) {
			from = "tkdtlrdl99@gmail.com";
		}
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			
			message.setFrom(new InternetAddress(from));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			
			if(cc != null) {
				InternetAddress[] toAddr = new InternetAddress[ccNum];
				for(int i = 0; i<ccNum; i++ ) {
					toAddr[i] = new InternetAddress(cc[i]); 
				}
				message.setRecipients(Message.RecipientType.CC, toAddr);
			}
			
			message.setSubject(title);
			message.setContent(text,"text/html; charset=UTF-8");
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return 1;
	}

}