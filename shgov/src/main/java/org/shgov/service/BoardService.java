package org.shgov.service;

import java.util.List;

import javax.annotation.Resource;

import org.shgov.dao.BoardDao;
import org.shgov.domain.Board;
import org.springframework.stereotype.Service;

@Service("BoardService")
public class BoardService {
	
	@Resource(name="BoardDao")
	public BoardDao dao;
	
	public List<Board> selectList(Board board){
		return dao.selectList(board);
	}
	public List<Board> selectList2(){
		return dao.selectList2();
	}
	public List<Board> selectListNotice(Board board){
		return dao.selectListNotice(board);
	}
	public List<Board> selectList2Notice(){
		return dao.selectList2Notice();
	}
	
	public Board selectDetail(String boardNum) {
		return dao.selectDetail(boardNum);
	}
	
	public int updatePost(Board board) {
		return dao.updatePost(board);
	}
	public int deletePost(String boardNum) {
		return dao.deletePost(boardNum);
	}
	public int CountSelectList() {
		return dao.CountSelectList();
	}
	public int CountSelectListNotice() {
		return dao.CountSelectListNotice();
	}

}
