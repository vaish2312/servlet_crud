package com.bin;

public class register_bin {
	private int id ;
	 private String User_Name;
	 public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_Name() {
		return User_Name;
	}
	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone_Number() {
		return Phone_Number;
	}
	public void setPhone_Number(String phone_Number) {
		Phone_Number = phone_Number;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	private String Email;
	 private String Phone_Number;
	 private String Password;
	@Override
	public String toString() {
		return "register_bin [id=" + id + ", User_Name=" + User_Name + ", Email=" + Email + ", Phone_Number="
				+ Phone_Number + ", Password=" + Password + "]";
	}
	 
	 
	 
	

}
