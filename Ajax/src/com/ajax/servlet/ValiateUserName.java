package com.ajax.servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponse;

import com.ajax.beans.Location;
import com.ajax.dao.BaseDAO;

public class ValiateUserName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValiateUserName() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String methodName= request.getParameter("method");
		
		try {
			Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this, request,response);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} 
		
	}
	
	private BaseDAO baseDAO=new BaseDAO();
	
	protected void listLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="select location_id locationId,city from Location";
		List<Location> locations=baseDAO.getForList(sql, Location.class);
		request.setAttribute("locations", locations);
	
		request.getRequestDispatcher("/employee.jsp").forward(request, response);
	
	}
}
