package org.shgov.dao;

import org.apache.ibatis.session.SqlSession;
import org.shgov.domain.Board;
import org.shgov.domain.File;
import org.shgov.domain.MappingFileBoard;
import org.shgov.domain.UserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("AdminDao")
public class AdminDao {
	@Autowired
	public SqlSession sql;
	 
	public static final String namespace = "Admin."; 
	

	public int approveUser(String userId) {
		return sql.update(namespace+"approveUser",userId);
	}
	public int approveUserRole(String userId) {
		return sql.update(namespace+"approveUserRole",userId);
	}
	public int banUser(String userId) {
		return sql.update(namespace+"banUser",userId);
	}
	public int banUserRole(String userId) {
		return sql.update(namespace+"banUserRole",userId);
	}
	public int resetPassword(UserForm user) {
		return sql.update(namespace+"resetPassword",user);
	}
	public int boardInsert(Board board) {
		return sql.insert(namespace+"boardInsert",board);
	}
	public int fileInsert(File file) {
		return sql.insert(namespace+"fileInsert",file);
	}
	public int MappingInsert(MappingFileBoard mfb) {
		return sql.insert(namespace+"MappingInsert",mfb);
	}
	public File fileSelect(String boardNum) throws Exception {
		return sql.selectOne(namespace+"fileSelect",boardNum);
	}
}
