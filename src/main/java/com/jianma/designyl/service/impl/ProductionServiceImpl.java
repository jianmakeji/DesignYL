package com.jianma.designyl.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jianma.designyl.dao.ProductionDao;
import com.jianma.designyl.dao.ReviewDao;
import com.jianma.designyl.model.PagingModel;
import com.jianma.designyl.model.Production;
import com.jianma.designyl.model.ScoreBean;
import com.jianma.designyl.service.ProductionService;

@Service
@Component
@Qualifier(value = "productionServiceImpl")
@Transactional
public class ProductionServiceImpl implements ProductionService {

	@Autowired
	@Qualifier(value = "productionDaoImpl")
	private ProductionDao productionDaoImpl;
	
	@Autowired
	@Qualifier(value = "reviewDaoImpl")
	private ReviewDao reviewDaoImpl;
	
	@Override
	public void createProduction(Production production) {
		productionDaoImpl.createProduction(production);
	}

	@Override
	public void updateProduction(Production production) {
		productionDaoImpl.updateProduction(production);
	}

	@Override
	public void deleteProduction(int id) {
		productionDaoImpl.deleteProduction(id);
	}

	@Override
	public PagingModel getListProductionByPage(int offset, int limit, int groupId,int round,int status,int fileType) {
		List<Production> list = productionDaoImpl.getListProductionByPage(offset, limit, groupId,round,status,fileType);
		int count = productionDaoImpl.getCountProduction(groupId,round,status,fileType);
		PagingModel pagingModel = new PagingModel();
		pagingModel.setList(list);
		pagingModel.setCount(count);
		return  pagingModel;
	}

	@Override
	public PagingModel getListOnlyProductionInfoByPage(int offset, int limit, int groupId,int userId) {
		
		List<Production> list = productionDaoImpl.getListProductionByPageAndUserId(offset, limit, groupId,userId);
		int count = productionDaoImpl.getCountProductionByUserId(groupId,userId);
		PagingModel pagingModel = new PagingModel();
		pagingModel.setList(list);
		pagingModel.setCount(count);
		return  pagingModel;
	}

	@Override
	public Optional<Production> getProductionDetailById(int id) {
		
		return productionDaoImpl.getProductionDetailById(id);
	}

	@Override
	public void updateProductionScore(int round) {
		List<ScoreBean> list = reviewDaoImpl.getAllReviewResult(round);
		
		for (ScoreBean scoreBean : list){
			productionDaoImpl.updateProductionScore(scoreBean.getProductionId(), scoreBean.getAverageScore(),round);
		}
	}

	@Override
	public PagingModel getProductionPageByCondition(int groupId, int category, int status, int fileType, int userId, int round, int limit,
			int offset) {
		List<Production> list = productionDaoImpl.getProductionByCondition(groupId, category, status, fileType,userId, round, limit, offset);
		int count = productionDaoImpl.getProductionCountByCondition(groupId, category, status, fileType, userId,round);
		PagingModel pagingModel = new PagingModel();
		pagingModel.setList(list);
		pagingModel.setCount(count);
		return  pagingModel;
	}

	@Override
	public void updateProductionStatus(int id, int status) {
		productionDaoImpl.updateProductionStatus(id, status);
	}

}
