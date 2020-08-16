package com.jujumarket.member.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;

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
		String str = "<div style=\"position:relative; background-image: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Ft35le%2FbtqGFbBdyct%2FUesPHmRNBcz5SRD1jAqO80%2Fimg.png'); width: 600px; height: 300px; \">";
		str += "<div style=\"font-size:25px ; margin-left: 43%; padding-top: 190px;\">";
		str += authKey;
		str += "</div></div>";
		
		try {
			mailHandler.init();
			mailHandler.setSubject("[주주마켓]이메일인증하기");
			mailHandler.setText(str);
//			mailHandler.setFrom("jujumarket6@gmail.com", "juju");
			mailHandler.setFrom(FROM, "juju");
			mailHandler.setTo(userEmail);
			mailHandler.send();

		} catch (Exception e) {
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
