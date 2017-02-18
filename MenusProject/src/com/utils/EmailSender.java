package com.utils;
import org.apache.commons.mail.*;
import javax.mail.*;  
import javax.mail.MessagingException;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage; 
public class EmailSender {

	
	public static void sendMail(String subject, String msg, String to){
		try{
	Email email = new SimpleEmail();
	email.setHostName("smtp.gmail.com");
	email.setSmtpPort(587);
	email.setAuthenticator(new DefaultAuthenticator("sivsivanihighschoolhod@gmail.com", "sivsivanihighschool@hod"));
	email.setStartTLSEnabled(true);
	email.setFrom("sivsivanihighschoolhod@gmail.com", "Siva Sivani High School");
	email.setSubject(subject);
	email.setMsg(msg);
	email.addTo(to);
	email.send();
		}
		catch(Exception e){
			e.printStackTrace();
		}
}
	
}
