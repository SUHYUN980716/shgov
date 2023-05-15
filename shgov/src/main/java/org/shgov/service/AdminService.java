package org.shgov.service;

import java.io.BufferedInputStream;
import java.io.FileInputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.shgov.dao.AdminDao;
import org.shgov.domain.Board;
import org.shgov.domain.File;
import org.shgov.domain.MappingFileBoard;
import org.shgov.domain.UserForm;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("AdminService")
public class AdminService {
	
	@Resource(name="AdminDao")
	public AdminDao dao;
	
	@Resource(name="boardIdgen")
	public EgovIdGnrService boardIdgen;
	
	@Resource(name="fileIdgen")
	public EgovIdGnrService fileIdgen;
	

	public int approveUser(String userId) {
		return dao.approveUser(userId);
	}
	public int approveUserRole(String userId) {
		return dao.approveUserRole(userId);
	}
	public int banUser(String userId) {
		return dao.banUser(userId);
	}
	public int banUserRole(String userId) {
		return dao.banUserRole(userId);
	}
	public int resetPassword(UserForm user) {
		String newPassword = "password";
		BCryptPasswordEncoder pass = new BCryptPasswordEncoder();
		user.setUserPassword(pass.encode(newPassword));
		
		return dao.resetPassword(user);
	}
	
	public int boardInsert(Board board,File file,MappingFileBoard mfb) throws FdlException {
		int count = 0;
		board.setBoardNum(boardIdgen.getNextStringId());
		count += dao.boardInsert(board);
		
		file.setFileNum(fileIdgen.getNextStringId());
		count += dao.fileInsert(file);
		
		mfb.setBoardNum(board.getBoardNum());
		mfb.setFileNum(file.getFileNum());
		count += dao.MappingInsert(mfb);
		
		return count;
	}
	
	public void fileDownload(Board bd, HttpServletRequest req, HttpServletResponse res) throws Exception {
		File fileEntity = dao.fileSelect(bd.getBoardNum());
//		String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/");
//		String fileRoot = contextRoot;
		String fileRoot = "/home/hosting_users/shgov/tomcat/webapps/ROOT/images/";
		java.io.File file = new java.io.File(fileRoot,fileEntity.getFileServerName());
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		
		String fileName = fileEntity.getFileName();

		res.setContentType("application/octet-stream");
		res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		FileCopyUtils.copy(in, res.getOutputStream());
		in.close();
		res.getOutputStream().flush();
		res.getOutputStream().close();
	}
}
