package com.ajax.beans;

import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {
	private String bookName;
	private int price;
	private Map<String, ShoppingCartItem> items = new HashMap<String, ShoppingCartItem>();

	public void addToCart(String bookName, int price) {
		if (items.containsKey(bookName)) {
			ShoppingCartItem item = items.get(bookName);
			item.setNumber(item.getNumber() + 1);
		} else {
			ShoppingCartItem item = new ShoppingCartItem(1, bookName, price);
			items.put(bookName, item);
		}
	}

	public int getTotalBookNumber() {
		int total = 0;
		for (ShoppingCartItem item : items.values()) {
			total += item.getNumber();
		}
		return total;
	}

	public int getTotalMoney() {
		int money = 0;
		for (ShoppingCartItem item : items.values()) {
			money += item.getPrice() * item.getNumber();
		}

		return money;

	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public ShoppingCart(String bookName, int price) {
		super();
		this.bookName = bookName;
		this.price = price;
	}

	public ShoppingCart(){
		
	}
}
