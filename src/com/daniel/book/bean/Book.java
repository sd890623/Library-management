package com.daniel.book.bean;

public class Book
{
	private String bookId;
	private String bookCode;
	private String bookName;
	private String contentType;
	private String price;
	
	private String penaltyPerDay;	
	private String status;
	
	
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPenaltyPerDay() {
		return penaltyPerDay;
	}
	public void setPenaltyPerDay(String penaltyPerDay) {
		this.penaltyPerDay = penaltyPerDay;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
}
