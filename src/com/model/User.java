package com.model;

/** 用户 */
public class User {
	private Integer id; //序号
	private String username; //账户
	private String password; //密码
	private int credit; //信用度 100-0
	private int cday; //封号天数
	public User() {
		super();
	}

	public User(Integer id, String username, String password, int credit, int cday) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.credit = credit;
		this.cday = cday;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	
	public int getCday() {
		return cday;
	}

	public void setCday(int cday) {
		this.cday = cday;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", credit=" + credit + ", cday="
				+ cday + "]";
	}

}
