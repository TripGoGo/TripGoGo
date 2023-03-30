package com.tripgogo.user.model;

public class UserDto {

	private String id;
	private String password;
	private String email;
	private String username;
	private String joinDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "UserDto [id=" + id + ", password=" + password + ", email=" + email + ", username=" + username
				+ ", joinDate=" + joinDate + "]";
	}
	
}
