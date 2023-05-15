package org.shgov.service;

import java.util.List;

import javax.annotation.Resource;

import org.shgov.dao.MemberDao;
import org.shgov.domain.Role;
import org.shgov.domain.User;
import org.shgov.domain.UserForm;
import org.shgov.security.CustomPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("MemberService")
public class MemberService {
	
	@Resource(name="MemberDao")
	public MemberDao dao;
	
	@Resource(name="MemberIdgen")
	public EgovIdGnrService MemberIdgen;
	
	public int register(UserForm user) throws FdlException {
		int count = 0;
		BCryptPasswordEncoder pass = new BCryptPasswordEncoder();
		user.setUserPassword(pass.encode(user.getUserPassword()));
		user.setUserNum(MemberIdgen.getNextStringId());
		count += dao.registerUser(user);
		Role role = new Role();
		role.setUserId(user.getUserId());
		count += dao.registerRole(role);
		
		return count;
	}
	
	public User read(String userId) {
		return dao.read(userId);
	}
	
	public int updateUser(UserForm user) {
		BCryptPasswordEncoder pass = new BCryptPasswordEncoder();
		user.setUserPassword(pass.encode(user.getUserPassword()));
		return dao.updateUser(user);
	}
	
	public List<User> selectAllUser() {
		return dao.selectAllUser();
	}

}
