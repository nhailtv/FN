package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import Java.Product;

public class ProductDAO {
	private Connection conn ;
	private String Querry ;
	private PreparedStatement prst;
	private ResultSet rs;
	
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		try {
			prst = conn.prepareStatement("select * from product");
			rs=prst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setName(rs.getString(1));
				row.setCategory(rs.getString(2));
				row.setPrice(rs.getString(3));
				row.setImage(rs.getString(4));
				products.add(row);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	public ProductDAO(Connection conn) {
		this.conn = conn;
	}
	
}
