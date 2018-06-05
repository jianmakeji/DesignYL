package com.jianma.designyl.service;

import java.util.List;
import java.util.Optional;

import com.jianma.designyl.model.Rule;

public interface RuleService {
	
	public void createRule(Rule rule);
	
	public void updateRule(Rule rule);
	
	public void deleteRule(int id);
	
	public List<Rule> getAllRule();
	
	public Optional<Rule> getRuleById(int id);
}
