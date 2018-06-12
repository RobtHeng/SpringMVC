package com.struts2.helloworld;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

public class UserAction implements SessionAware,ApplicationAware{
	private Map<String, Object> session;
	private Map<String, Object> application;
	
	private String username;
	
	public void setUsername(String username) {
		this.username=username;
	}
	
	public String logout(){
		Integer count = (Integer) application.get("count");
		
		if(count != null && count>0){
			count--;
			application.put("count", count);
			
		}
		
		((SessionMap)session).invalidate();
		
		return "logout-success";
	}
	
	public String loggo(){
		return  "loggo-success";
	}
	
	public String execute(){
		
		session.put("username", username);
		
		Integer count=(Integer) application.get("count");
		if(count==null){
			count=0;
		}
		
		count++;
		application.put("count", count);
		
		return "login-success";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO 自动生成的方法存根
		this.session = session;
	}

	@Override
	public void setApplication(Map<String, Object> application) {
		// TODO 自动生成的方法存根
		this.application=application;
	}
}
