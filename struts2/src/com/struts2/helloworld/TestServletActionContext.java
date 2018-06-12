package com.struts2.helloworld;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class TestServletActionContext {

	public String execute(){
		
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpSession sesson = ServletActionContext.getRequest().getSession();
		ServletContext servletContext = ServletActionContext.getServletContext();
		
		servletContext.setAttribute("key", "value");
		
		sesson.setAttribute("key1", "value2");
		
		System.out.println("execute...");
		
		return "success";
		
	}
}
