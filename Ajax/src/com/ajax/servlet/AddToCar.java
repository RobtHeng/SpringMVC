package com.ajax.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import com.ajax.beans.ShoppingCart;

/**
 * Servlet implementation class AddToCar
 */
public class AddToCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String bookName=request.getParameter("id");
		int price=Integer.parseInt(request.getParameter("price"));
		
		HttpSession session=request.getSession();
		ShoppingCart sc=(ShoppingCart) session.getAttribute("sc");
		
		if(sc==null){
			sc=new ShoppingCart(bookName, price);
			session.setAttribute("sc", sc);
		}
		
		sc.addToCart(bookName, price);
		
	   // String callback = request.getParameter("callback");		
		StringBuilder result=new StringBuilder();
		
		ObjectMapper mapper=new ObjectMapper();
		
		
//		result.append("{")
//			.append("\"bookName\":"+bookName+"")
//			.append(",")
//			.append("\"totalBookNumber\":"+sc.getTotalBookNumber()+"")
//			.append(",")
//			.append("\"totalMoney\":"+sc.getTotalMoney()+" }");
		//String res = callback + "(" + result.toString() + ")";   
		response.setContentType("text/javaScript; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(mapper.writeValueAsString(sc));
	}

}
