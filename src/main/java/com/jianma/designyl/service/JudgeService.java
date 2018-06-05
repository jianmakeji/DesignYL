package com.jianma.designyl.service;

import java.util.List;
import java.util.Optional;

import com.jianma.designyl.model.Judge;
import com.jianma.designyl.model.PagingModel;

public interface JudgeService {

	public int createJudge(Judge judge);
	
	public void deleteJudge(int id);
	
	public void updateJudge(Judge judge);
	
	public Optional<Judge> findJudgeById(int id);
	
	public Integer findJudgeIdByEmail(String email);
	
	public List<Judge> getAllJudge();
	
	public PagingModel findJudgeByPage(int offset, int limit);
	
	public String findJudgePwdByEmail(String email,String validCode);
	
	public void updateJudgeValidCodeByEmail(String email, String validCode);
}
