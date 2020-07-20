package com.jujumarket.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;

import com.jujumarket.member.mail.MailHandler;
import com.jujumarket.member.mail.TempKey;

import lombok.extern.log4j.Log4j;

@Log4j
public class MailService {
	
	final static String FROM = "jujumarket6@gmail.com";
	
	
	@Autowired
	private MailHandler mailHandler;
	
	public String sendMail(String userEmail) {
		String authKey = setKey();	
		
		try {
			mailHandler.init();
			mailHandler.setSubject("[주주마켓 회원가입] 이메일인증하기");
			mailHandler.setText("인증번호는 ["+authKey+"] 입니다.");
//			mailHandler.setFrom("jujumarket6@gmail.com", "juju");
			mailHandler.setFrom(FROM, "juju");
			mailHandler.setTo(userEmail);
			mailHandler.send();

		} catch (MessagingException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return authKey;
	}
	
	public String setKey() {
		TempKey tempKey = new TempKey();
		String key= tempKey.getKey(6, false);
		log.info("@@@@@@@@@@"+key);
		
		return key;
	}
	

}
