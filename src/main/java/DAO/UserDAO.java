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
			Querry = "select * from user where email = ? and password = ?";
			prst= this.conn.prepareStatement(Querry);
			prst.setString(1 ,Email);
			prst.setString(2, password);
			rs = prst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setEmail(rs.getString(1));
//				user.setPassword(rs.getString(2));
				user.setPhoneNumber(rs.getString(3));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	
	
}
