package com.test.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private File ppt;
	private String pptContentType;
	private String pptFileName;
	private String pptDesc;

	
	public String getPptDesc() {
		return pptDesc;
	}

	public void setPptDesc(String pptDesc) {
		this.pptDesc = pptDesc;
	}

	public File getPpt() {
		return ppt;
	}

	public void setPpt(File ppt) {
		this.ppt = ppt;
	}

	public String getPptContentType() {
		return pptContentType;
	}

	public void setPptContentType(String pptContentType) {
		this.pptContentType = pptContentType;
	}

	public String getPptFileName() {
		return pptFileName;
	}

	public void setPptFileName(String pptFileName) {
		this.pptFileName = pptFileName;
	}

	@Override
	public String execute() throws Exception {
		// TODO 自动生成的方法存根
		System.out.println(ppt);
		System.out.println(pptContentType);
		System.out.println(pptFileName);
		System.out.println(pptDesc);

		ServletContext servletcontext = ServletActionContext.getServletContext();
		String dir=servletcontext.getRealPath("/files/"+pptFileName);
		System.out.println(dir);
		
		
		FileOutputStream out = new FileOutputStream(dir);
		FileInputStream in= new FileInputStream(ppt);
		
		byte[] buffer=new byte[1024];
		int len=0;
		while((len=in.read(buffer)) !=-1){
			out.write(buffer,0,len);
		}
		
		out.close();
		in.close();
		
		return super.execute();
	}

}
