package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Java.User;

public class UserDAO {
	private Connection conn ;
	private String Querry ;
	private PreparedStatement prst;
	private ResultSet rs;
	
	
	public UserDAO(Connection conn) {
		this.conn = conn;
	}
	
	public User userLogin(String Email , String password) {
		User user = null;
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	
	
}
