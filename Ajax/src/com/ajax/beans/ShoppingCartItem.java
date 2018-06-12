package com.ajax.beans;

public class ShoppingCartItem {

	private int number;

	private String bookName;

	private int price;

	public int getNumber() {
		return number;
	}

	@Override
	public String toString() {
		return "ShoppingCartItem [bookName=" + bookName + ", price=" + price
				+ "]";
	}

	public ShoppingCartItem() {

	}

	public ShoppingCartItem(int number, String bookName, int price) {
		super();
		this.number = number;
		this.bookName = bookName;
		this.price = price;
	}

	public void setNumber(int number) {
		this.number = number;
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

}
