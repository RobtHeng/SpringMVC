package com.struts2.helloworld;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class TestActionContextAction {
	
	public String execute(){
		
		ActionContext actionContext= ActionContext.getContext();
		
		//application
		Map<String,Object> applicationMap= actionContext.getApplication();
		//设置属性
		applicationMap.put("applicationKey", "applicationValue");
		
		//获取属性
		Object date=applicationMap.get("date");
		System.out.println("date:"+date);
		
		//session
		Map<String,Object> sesssionMap= actionContext.getSession();
		
		//request
		Map<String,Object> requestMap= (Map<String, Object>) actionContext.get("request");
		requestMap.put("requestKey", "requestValue");
		
		//获取请求参数对应map
		//只能读不能写，写不起作用，也不报错
		Map<String,Object> parameters=actionContext.getParameters();
		System.out.println(((String[])parameters.get("name"))[0]);
		
		
		return "success";
	}
	
}
