package com.jianma.designyl.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import com.jianma.designyl.model.MailBean;

public interface MailService {

	public void sendMail(MailBean mailBean) throws MessagingException, UnsupportedEncodingException;
	 
}
