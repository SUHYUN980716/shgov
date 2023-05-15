package org.shgov.domain;

import java.util.List;

public class User {
	private String userNum;
	private String userId;
	private String userName;
	private String userPassword;
	private int userApproved;
	private int userAvailable;
	private List<Role> authList;
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getUserApproved() {
		return userApproved;
	}
	public void setUserApproved(int userApproved) {
		this.userApproved = userApproved;
	}
	public int getUserAvailable() {
		return userAvailable;
	}
	public void setUserAvailable(int userAvailable) {
		this.userAvailable = userAvailable;
	}
	public List<Role> getAuthList() {
		return authList;
	}
	public void setAuthList(List<Role> authList) {
		this.authList = authList;
	}
	public User(String userNum, String userId, String userName, String userPassword, int userApproved,
			int userAvailable, List<Role> authList) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userApproved = userApproved;
		this.userAvailable = userAvailable;
		this.authList = authList;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [userNum=" + userNum + ", userId=" + userId + ", userName=" + userName + ", userPassword="
				+ userPassword + ", userApproved=" + userApproved + ", userAvailable=" + userAvailable + ", authList="
				+ authList + "]";
	}
	
	
	
}
