package com.jianma.designyl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jianma.designyl.dao.StageDao;
import com.jianma.designyl.model.Stage;
import com.jianma.designyl.service.StageService;

@Service
@Component
@Qualifier(value = "stageServiceImpl")
@Transactional
public class StageServiceImpl implements StageService {

	@Autowired
	@Qualifier(value = "stageDaoImpl")
	private StageDao stageDaoImpl;
	
	@Override
	public void createStage(Stage stage) {
		stageDaoImpl.createStage(stage);
	}

	@Override
	public void updateStage(Stage stage) {
		stageDaoImpl.updateStage(stage);
	}

	@Override
	public void deleteStage(int id) {
		stageDaoImpl.deleteStage(id);
	}

	@Override
	public List<Stage> getAllStage() {
		
		return stageDaoImpl.getAllStage();
	}

}
