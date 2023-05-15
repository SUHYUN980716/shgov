package org.shgov.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shgov.domain.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("BoardDao")
public class BoardDao {
	@Autowired
	public SqlSession sql;
	 
	public static final String namespace = "Board.";
	
	public List<Board> selectList(Board board){
		return sql.selectList(namespace+"selectList",board);
	}
	public List<Board> selectList2(){
		return sql.selectList(namespace+"selectList2");
	}
	public List<Board> selectListNotice(Board board){
		return sql.selectList(namespace+"selectListNotice",board);
	}
	public List<Board> selectList2Notice(){
		return sql.selectList(namespace+"selectList2Notice");
	}
	public Board selectDetail(String boardNum) {
		return sql.selectOne(namespace+"selectDetail",boardNum);
	}
	
	public int updatePost(Board board) {
		return sql.update(namespace+"updatePost",board);
	}
	public int deletePost(String boardNum) {
		return sql.delete(namespace+"deletePost",boardNum);
	}
	public int CountSelectList() {
		return sql.selectOne(namespace+"CountSelectList");
	}
	public int CountSelectListNotice() {
		return sql.selectOne(namespace+"CountSelectListNotice");
	}
}
