package com.struts2.helloworld;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

public class TestServletAwareAction implements ServletRequestAware,ServletContextAware,ServletResponseAware{
	private HttpServletResponse response;
	private ServletContext context;
	private HttpServletRequest request;
	
	
	public String execute(){
		request.getSession().setAttribute("key", "value");
		
		return "success";
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO 自动生成的方法存根
		System.out.println(response);
		this.response=response;
	}

	@Override
	public void setServletContext(ServletContext context) {
		// TODO 自动生成的方法存根
		System.out.println(context);
		this.context=context;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO 自动生成的方法存根
		System.out.println(request);
		this.request=request;
	}

}
