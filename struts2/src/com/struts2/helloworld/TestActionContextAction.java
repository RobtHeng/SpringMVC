package com.struts2.helloworld;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class TestActionContextAction {
	
	public String execute(){
		
		ActionContext actionContext= ActionContext.getContext();
		
		//application
		Map<String,Object> applicationMap= actionContext.getApplication();
		//��������
		applicationMap.put("applicationKey", "applicationValue");
		
		//��ȡ����
		Object date=applicationMap.get("date");
		System.out.println("date:"+date);
		
		//session
		Map<String,Object> sesssionMap= actionContext.getSession();
		
		//request
		Map<String,Object> requestMap= (Map<String, Object>) actionContext.get("request");
		requestMap.put("requestKey", "requestValue");
		
		//��ȡ���������Ӧmap
		//ֻ�ܶ�����д��д�������ã�Ҳ������
		Map<String,Object> parameters=actionContext.getParameters();
		System.out.println(((String[])parameters.get("name"))[0]);
		
		
		return "success";
	}
	
}
