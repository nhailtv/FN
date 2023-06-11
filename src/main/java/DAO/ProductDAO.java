package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import Java.Cart;
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
				row.setPrice(rs.getDouble(3));
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
	
	
	
	public List<Cart> getCartsProducts(ArrayList<Cart> cart_List){
		List<Cart> products = new ArrayList<Cart>();
		try {
			if(cart_List.size()>0) {
				for(Cart item : cart_List) {
					PreparedStatement prst = conn.prepareStatement("select * from product where Name = ?");
					prst.setString(1, item.getName());
					rs=prst.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						row.setName(rs.getString("Name"));
						row.setCategory(rs.getString("Category"));
						row.setPrice(rs.getDouble("Price")*item.getQuantity());
						row.setImage(rs.getString("Image"));
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return products;
	}
	
	public double GetTotalPrice(ArrayList<Cart> cart_list) {
		double sum = 0;
		if(cart_list!= null) {
			try {
				if(cart_list.size()>0) {
					for(Cart c : cart_list) {
						prst = conn.prepareStatement("select Price from product where Name = ?");
						prst.setString(1,c.getName());
						rs = prst.executeQuery();
						while(rs.next()) {
							sum +=rs.getDouble("Price")*c.getQuantity();
						}
					}
				
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		
		return sum;
	}
	
}
