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
	
	public String registerUser(String email, String password, String phoneNumber, String address) {
	    try {
	        String query = "SELECT COUNT(*) FROM user WHERE email = ? OR phoneNumber = ?";
	        PreparedStatement stmt = conn.prepareStatement(query);
	        stmt.setString(1, email);
	        stmt.setString(2, phoneNumber);
	        ResultSet rs = stmt.executeQuery();
	        rs.next();
	        int count = rs.getInt(1);
	        rs.close();
	        
	        if (count > 0) {
	            // Email or phone number already exists
	            return "Email or Phone number are exist";
	        } else {
	            query = "INSERT INTO user (email, password, phoneNumber, address) VALUES (?, ?, ?, ?)";
	            stmt = conn.prepareStatement(query);
	            stmt.setString(1, email);
	            stmt.setString(2, password);
	            stmt.setString(3, phoneNumber);
	            stmt.setString(4, address);

	            int rowsAffected = stmt.executeUpdate();
	            if(rowsAffected > 0) {
	            	return null;
	            }else {
	            	return "Something went Wrong , please try again";
	            }
	           
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "Something went Wrong , please try again";
	    }
	}

	
	
}
