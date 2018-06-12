package com.struts2.helloworld;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

public class Product implements RequestAware {
	private Integer productId;
	private String productName;
	private String productDesc;
	private String productPrice;

	public Product(Integer productId, String productName, String productDesc,
			String productPrice) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPrice = productPrice;
	}
	

	public Product() {

	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName="
				+ productName + ", productDesc=" + productDesc
				+ ", productPrice=" + productPrice + "]";
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	
	public String save(){
		
		Product test= new Product();
		test.setProductName(this.getProductName());
		test.setProductDesc(this.getProductDesc());
		test.setProductPrice(this.getProductPrice());
		requestMap.put("test", test);
		System.out.println("product:"+this);
		
		//int i=3/0;
		return "details";
	}

	private Map<String,Object> requestMap;

	@Override
	public void setRequest(Map<String, Object> request) {
		requestMap=request;
		
	}
}
