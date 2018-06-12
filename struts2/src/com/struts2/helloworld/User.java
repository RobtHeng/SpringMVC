package com.struts2.helloworld;

public class User {

	private String userName;
	private String password;
	private String userId;
	private String desc;
	private Boolean married;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Boolean getMarried() {
		return married;
	}

	public void setMarried(Boolean married) {
		this.married = married;
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + ", password=" + password
				+ ", userId=" + userId + ", desc=" + desc + ", married="
				+ married + "]";
	}

	public String save() {

		System.out.println(this);
		return "success";
	}

}
