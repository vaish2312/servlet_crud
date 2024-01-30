package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.bin.register_bin;

public class register_dao {
	
	public static Connection getConnection()
	{
		Connection con=null;
		
		try
		{
			String url="jdbc:mysql://localhost:3306/servlet";
			String user="root";
			String password="root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		   con=DriverManager.getConnection(url,user,password);
			
		  
		} 
		catch (Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
	
	


}
