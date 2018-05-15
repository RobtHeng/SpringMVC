package com.struts2.helloworld;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class FilterDispatcher
 */
public class FilterDispatcher implements Filter {

    /**
     * Default constructor. 
     */
    public FilterDispatcher() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		String servletPath=req.getServletPath();
		System.out.println(servletPath);
		
		String path=null;
		
		if("/product-input.action".equals(servletPath)){
			path="/WEB-INF/Pages/input.jsp";
			
		}
		
		if("/product-save.action".equals(servletPath)){
			request.setCharacterEncoding("UTF-8");
			String productName=request.getParameter("productName");
			String productDesc=request.getParameter("productDesc");
			String productPrice=request.getParameter("productPrice");
			
			Product product=new Product(null,productName,productDesc,productPrice);
			System.out.println("save Product"+product);
			product.setProductId(1001);
			
			request.setAttribute("product", product);
			path="/WEB-INF/Pages/details.jsp";
			
		}
		
		
		if(path!=null){
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
