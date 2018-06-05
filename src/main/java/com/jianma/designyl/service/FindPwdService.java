package com.jianma.designyl.service;


import com.jianma.designyl.model.FindPwd;

public interface FindPwdService {

	public int createFindPwd(FindPwd findPwd);
	
	public int getFindPwdByCondition(String email, String validCode, int id);
}
