package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import Java.Cart;

/**
 * Servlet implementation class QuantityIncDecServlet
 */
public class QuantityIncDecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset = UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String action = request.getParameter("action");
			String name = request.getParameter("Name");
		
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			
			if(action!= null && name != null) {
				if(action.equals("inc")){
					for(Cart c : cart_list) {
						
						if(c.getName().equals(name)) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
				}else if(action.equals("dec")) {
					for(Cart c : cart_list) {
						
						if(c.getName().equals(name) && c.getQuantity() > 1 ) {
							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							break;
						}
					}
					response.sendRedirect("cart.jsp");
				}else {
					response.sendRedirect("cart.jsp");
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
	}

}
