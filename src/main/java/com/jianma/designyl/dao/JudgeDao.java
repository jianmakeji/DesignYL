package com.jianma.designyl.dao;

import java.util.List;
import java.util.Optional;

import com.jianma.designyl.model.Judge;
import com.jianma.designyl.model.News;

public interface JudgeDao {

	public void createJudge(Judge judge);
	
	public void deleteJudge(int id);
	
	public void updateJudge(Judge judge);
	
	public Optional<Judge> findJudgeById(int id);
	
	public Integer findJudgeIdByEmail(String email);
	
	public List<Judge> getAllJudge();
	
	public List<Judge> findJudgeByPage(int offset, int limit);
	
	public int getCountJudge();
	
	public String findJudgePwdByEmail(String email,String validCode);
	
	public void updateJudgeValidCodeByEmail(String email, String validCode);
	
	public String getJudgeValidCodeByEmail(String email);
}
