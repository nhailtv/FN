package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import Java.*;

/**
 * Servlet implementation class AddToCartServlet
 */
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			ArrayList<Cart> cartList = new ArrayList<>();

			String ID = request.getParameter("Name");
			System.out.println(ID);
			Cart cm = new Cart();
			cm.setName(ID);
			cm.setQuantity(1);
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

			if (cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				out.println("<script type=\"text/javascript\">");
				out.println("location='Index.jsp';");
				out.println("</script>");
			} else {
				cartList = cart_list;
				boolean exist = false;

				cartList.contains(cm);

				for (Cart c : cart_list) {
					if (c.getName().equals(ID)) {
						exist = true;
						out.println(
								"<h3 style = 'color:crimson; text-align:center'>Item exist in Cart.<a href = 'cart.jsp'>Go to Cart page</a></h3>");
					}
				}
				if (!exist) {
					cartList.add(cm);
					response.sendRedirect("Index.jsp");
					;
				}
			}
		}
	}

}
