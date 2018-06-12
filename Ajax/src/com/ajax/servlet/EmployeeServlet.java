package com.ajax.servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.ajax.beans.Department;
import com.ajax.beans.Employee;
import com.ajax.beans.Location;
import com.ajax.dao.BaseDAO;

public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeServlet() {
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
	
	protected void listLocations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="select location_id locationId,city from Location";
		List<Location> locations=baseDAO.getForList(sql, Location.class);
		request.setAttribute("locations", locations);
	
		request.getRequestDispatcher("/employee.jsp").forward(request, response);
	
	}
	
	protected void listDepartments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String locationId=request.getParameter("locationId");
		String sql="select department_id departmentId,department_name departmentName from Department where location_id="+locationId;
		List<Department> departments=baseDAO.getForList(sql, Department.class);
		ObjectMapper mapper = new ObjectMapper();
		String result= mapper.writeValueAsString(departments);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/javascript");
		response.getWriter().print(result);
	}
	
	protected void listEmployees(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String departmentId=request.getParameter("departmentId");
		String sql="select employee_id employeeId,last_name lastName,email,salary from Employee where department_id="+departmentId;
		List<Employee> employees=baseDAO.getForList(sql, Employee.class);
		ObjectMapper mapper = new ObjectMapper();
		String result= mapper.writeValueAsString(employees);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/javascript");
		response.getWriter().print(result);
	}
	
	protected void getEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String employeeId=request.getParameter("employeeId");
		String sql="select employee_id employeeId,last_name lastName,email,salary from Employee where employee_id="+employeeId;
		Employee employee=baseDAO.get(sql, Employee.class);
		
		ObjectMapper mapper = new ObjectMapper();
		String result= mapper.writeValueAsString(employee);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/javascript");
		response.getWriter().print(result);
	}
	
	
}
