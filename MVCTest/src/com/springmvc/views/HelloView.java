package com.springmvc.views;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.View;

@Component
public class HelloView implements View {

	@Override
	public String getContentType() {
		// TODO �Զ����ɵķ������
		return "text/html";
	}

	@Override
	public void render(Map<String, ?> arg0, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO �Զ����ɵķ������
		response.getWriter().print("hello view,time:"+new Date());
		
	}
	
}
