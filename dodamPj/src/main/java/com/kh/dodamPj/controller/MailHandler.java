package com.kh.dodamPj.controller;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	
	private JavaMailSender sender;
	private MimeMessage msg;
    private MimeMessageHelper msgHelper;

    public MailHandler(JavaMailSender sender) throws MessagingException {
        this.sender = sender;
        msg = this.sender.createMimeMessage();
        msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
    }
    
    // Email Title
    public void setSubject(String subject) throws MessagingException {
        msgHelper.setSubject(subject);
    }
    
    // Email Content(Text)
    public void setText(String htmlContent) throws MessagingException {
        msgHelper.setText(htmlContent, true);
    }
    
    // Sender Info
    public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
        msgHelper.setFrom(email, name);
    }
    
    // Recipient Info
    public void setTo(String email) throws MessagingException {
        msgHelper.setTo(email);
    }
    
    public void addInline(String cotentId, DataSource dataSource) throws MessagingException {
        msgHelper.addInline(cotentId, dataSource);
    }
    
    public void send() {
        try {
            sender.send(msg);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

}
