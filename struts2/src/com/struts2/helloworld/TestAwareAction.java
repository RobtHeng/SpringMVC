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
		// TODO �Զ����ɵķ������
		this.application=application;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		// TODO �Զ����ɵķ������
		this.request=request;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		// TODO �Զ����ɵķ������
		this.parameters=parameters;
		
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO �Զ����ɵķ������
		this.session=session;
	}

}
