package com.jianma.designyl.dao;

import java.util.List;

import com.jianma.designyl.model.Group;

public interface GroupDao {

	public void createGroup(Group group);
	
	public void deleteGroup(int id);
	
	public void updateGroup(Group group);
	
	public List<Group> getAllGroup();
}
