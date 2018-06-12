package com.struts2.helloworld;

import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

public class TestAwareAction implements ApplicationAware,SessionAware,ParameterAware,RequestAware {
	
	public String execute(){
		
		application.put("applicationKey2", "applicationValue2");
		
		System.out.println(application.get("date"));
		
		request.put("requestKey", "requestValue");
		
		session.put("sessionKey", "sessionValue");
		
		System.out.println(parameters.get("name")[0]);
		
		return "success";
	}
	
	private Map<String,Object> application;
	private Map<String,Object> request;
	private Map<String,String[]> parameters;
	private Map<String,Object> session;

	@Override
	public void setApplication(Map<String, Object> application) {
		// TODO 自动生成的方法存根
		this.application=application;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		// TODO 自动生成的方法存根
		this.request=request;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		// TODO 自动生成的方法存根
		this.parameters=parameters;
		
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO 自动生成的方法存根
		this.session=session;
	}

}
