package org.shgov.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shgov.domain.Role;
import org.shgov.domain.User;
import org.shgov.domain.UserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemberDao")
public class MemberDao {
	
	@Autowired
	public SqlSession sql;
	 
	public static final String namespace = "Member.";
	
	public int registerUser(UserForm user) {
		return sql.insert(namespace+"registerUser",user);
	}
	public int registerRole(Role role) {
		return sql.insert(namespace+"registerRole",role);
	}
	public User read(String userId) {
		return sql.selectOne(namespace+"read",userId);
	}
	public int updateUser(UserForm user) {
		return sql.update(namespace+"updateUser",user);
	}
	public List<User> selectAllUser() {
		return sql.selectList(namespace+"selectAllUser");
	}
	
}
