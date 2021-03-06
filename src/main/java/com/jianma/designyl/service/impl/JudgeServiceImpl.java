package com.jianma.designyl.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jianma.designyl.dao.JudgeDao;
import com.jianma.designyl.dao.UserDao;
import com.jianma.designyl.model.Judge;
import com.jianma.designyl.model.PagingModel;
import com.jianma.designyl.model.Role;
import com.jianma.designyl.model.User;
import com.jianma.designyl.model.UserRole;
import com.jianma.designyl.service.JudgeService;
import com.jianma.designyl.util.PasswordHelper;
import com.jianma.designyl.util.ResponseCodeUtil;

@Service
@Component
@Qualifier(value = "judgeServiceImpl")
@Transactional
public class JudgeServiceImpl implements JudgeService {

	@Autowired
	@Qualifier(value = "judgeDaoImpl")
	private JudgeDao judgeDaoImpl;

	@Autowired
	@Qualifier(value = "userDaoImpl")
	private UserDao userDaoImpl;

	@Override
	public int createJudge(Judge judge) {
		try {
			Optional<User> optUser = userDaoImpl.findByEmail(judge.getEmail());

			if (optUser.isPresent()) {
				return ResponseCodeUtil.UESR_CREATE_EXIST;
			} else {
				judgeDaoImpl.createJudge(judge);
				User user = new User();
				user.setEmail(judge.getEmail());
				user.setPassword(judge.getPassword());
				user.setValid((byte) 0);
				user.setActivesign((byte) 1);
				PasswordHelper.encryptAppPassword(user);
				user.setActivecode(PasswordHelper.getMD5(user.getEmail()));
				Set<UserRole> userRoles = new HashSet<>();
				UserRole userRole = new UserRole();
				userRole.setUser(user);
				Role role = new Role();
				role.setId(2);
				userRole.setRole(role);
				userRoles.add(userRole);
				user.setUserRoles(userRoles);
				user.setCreatetime(new Date());
				userDaoImpl.createUser(user);
				return ResponseCodeUtil.UESR_OPERATION_SUCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseCodeUtil.UESR_OPERATION_FAILURE;
		}
	}

	@Override
	public void deleteJudge(int id) {
		Optional<Judge> judge = judgeDaoImpl.findJudgeById(id);
		if (judge.isPresent()){
			String judgeEmail = judge.get().getEmail();
			userDaoImpl.deleteUserByEmail(judgeEmail);
			judgeDaoImpl.deleteJudge(id);
			
		}
		
	}

	@Override
	public void updateJudge(Judge judge) {
		judgeDaoImpl.updateJudge(judge);
		// 修改评委登录表信息
		User user = new User();
		user.setPassword(judge.getPassword());
		user.setEmail(judge.getEmail());
		PasswordHelper.encryptAppPassword(user);
		userDaoImpl.updateJudgePwd(user.getEmail(), user.getPassword(), user.getSlot());
	}

	@Override
	public Optional<Judge> findJudgeById(int id) {

		return judgeDaoImpl.findJudgeById(id);
	}

	@Override
	public List<Judge> getAllJudge() {
		return judgeDaoImpl.getAllJudge();
	}

	@Override
	public PagingModel findJudgeByPage(int offset, int limit) {
		
		PagingModel pagingModel = new PagingModel();
		pagingModel.setList(judgeDaoImpl.findJudgeByPage(offset, limit));
		pagingModel.setCount(judgeDaoImpl.getCountJudge());
		return pagingModel;
	}

	@Override
	public String findJudgePwdByEmail(String email, String validCode) {
		return judgeDaoImpl.findJudgePwdByEmail(email, validCode);
	}

	@Override
	public void updateJudgeValidCodeByEmail(String email, String validCode) {
		judgeDaoImpl.updateJudgeValidCodeByEmail(email, validCode);
	}

	@Override
	public Integer findJudgeIdByEmail(String email) {
		return judgeDaoImpl.findJudgeIdByEmail(email);
	}

}
