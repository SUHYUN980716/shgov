package org.shgov.domain;

public class Role {
	private String userId;
	private String userRole;
	public Role(String userId, String userRole) {
		super();
		this.userId = userId;
		this.userRole = userRole;
	}
	public Role() {
		super();
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	@Override
	public String toString() {
		return "Role [userId=" + userId + ", userRole=" + userRole + "]";
	}
	
}
