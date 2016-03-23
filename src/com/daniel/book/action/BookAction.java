package com.daniel.book.action;

import java.util.HashMap;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.daniel.book.bean.Book;
import com.daniel.book.service.BookService;
import com.daniel.user.bean.User;
import com.daniel.userBook.bean.UserBook;
import com.daniel.userBook.service.UserBookService;
import com.daniel.utils.DateUtils;
import com.opensymphony.xwork2.ActionContext;

public class BookAction
{
	private BookService bookService;
	private UserBookService userBookService;
	//private DateUtils DataUtility;
	
	private JSONObject bookJson;
	private JSONObject bookListJson;
	private JSONObject borrowListJson;

	private String bookId;
	private String bookCode;
	private String bookName;
	private String contentType;
	private String price;
	private String penaltyPerDay;	
	
	private String startDate;
	private String endDate;
	private String status;
	private String userCode;
	
	private String id;
	
	public String addBook()
	{
		Book book = new Book();
		
		book.setBookCode(bookCode);
		book.setBookName(bookName);
		book.setContentType(contentType);
		book.setPrice(price);
		book.setPenaltyPerDay(penaltyPerDay);
		book.setStatus("0");
		
		bookService.addBook(book);
		
		return "bookList";
	}
	
	public String deleteBook()
	{
		Book book = bookService.findBookById(bookId);
		bookService.deleteBook(book);
		
		return "bookList";
	}
	
	public String updateBook()
	{
		Book book = bookService.findBookById(bookId);
		
		book.setBookCode(bookCode);
		book.setBookName(bookName);
		book.setContentType(contentType);
		book.setPrice(price);
		book.setPenaltyPerDay(penaltyPerDay);
		book.setStatus(status);
		
		bookService.updateBook(book);
		
		return "bookList";
	}
	
	public String findBookById()
	{
		Book book = bookService.findBookById(bookId);
		bookJson = JSONObject.fromObject(book);
		
		return "book";
	}
	
	public String findBookList()
	{
		List <Book> bookList = bookService.findBookList(bookCode, bookName, contentType, status);
		
		JSONObject bookJsonTemp = new JSONObject();
		JSONArray bookJsonList = new JSONArray();
		for(Book book : bookList)
		{
			bookJsonTemp.put("bookId", book.getBookId());
			bookJsonTemp.put("bookCode", book.getBookCode());
			bookJsonTemp.put("bookName", book.getBookName());
			bookJsonTemp.put("contentType", book.getContentType());
			bookJsonTemp.put("price", book.getPrice());
			bookJsonTemp.put("penaltyPerDay", book.getPenaltyPerDay());
			bookJsonTemp.put("status", book.getStatus());
			
			bookJsonList.add(bookJsonTemp);
		}
		
		HashMap <String, Object> rtnMap = new HashMap <String, Object>();
		rtnMap.put("all", bookList.size());
		rtnMap.put("rows", bookJsonList);
		
		bookListJson = JSONObject.fromObject(rtnMap);
		
		return "bookList";
	}
	
	public String findBorrowList()
	{
		JSONArray borrowJsonArray = bookService.findBorrowList(bookCode, bookName, userCode, startDate, endDate, status);
		
		HashMap <String, Object> rtnMap = new HashMap <String, Object>();
		rtnMap.put("all", borrowJsonArray.size());
		rtnMap.put("rows", borrowJsonArray);
		
		borrowListJson = JSONObject.fromObject(rtnMap);
		
		return "borrowList";
	}
	
	public String addBorrow()
	{
		User user = (User) ActionContext.getContext().getSession().get("user");
		
		UserBook userBook = new UserBook();
		userBook.setBookId(bookId);
		userBook.setUserId(user.getUserId());
		userBook.setStartDate(startDate);
		userBook.setEndDate(endDate);
		if (DateUtils.compareDate(endDate)<0) {
			userBook.setStatus("1");
		}
		else { 
			userBook.setStatus("0");
		}
		System.out.print(endDate);
		
		userBook.setBorrow("1");
		
		userBookService.addUserBook(userBook);
		
		Book book = bookService.findBookById(bookId);
		book.setStatus("1");
		bookService.updateBook(book);
		
		return "bookList";
	}
	
	public String deleteBorrow()
	{
		UserBook userBook = userBookService.findUserBookById(id);
		userBookService.deleteUserBook(userBook);
		
		String bookId = userBook.getBookId();
		Book book = bookService.findBookById(bookId);
		if(userBook.getBorrow()!=null && !"".equals(userBook.getBorrow()))
		{
			if(userBook.getBorrow().equals("1"))
			{
				book.setStatus("0");
				bookService.updateBook(book);
			}
		}
		
		return "borrowList";
	}
	
	public String setAsReturn()
	{
		UserBook userBook = userBookService.findUserBookById(id);
		userBook.setBorrow("0");
		userBookService.updateUserBook(userBook);
		
		String bookId = userBook.getBookId();
		Book book = bookService.findBookById(bookId);
		book.setStatus("0");
		bookService.updateBook(book);
		
		return "borrowList";
	}

	/**Getters and setters*/
	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	@JSON(serialize = false)
	public JSONObject getBookJson() {
		return bookJson;
	}

	public void setBookJson(JSONObject bookJson) {
		this.bookJson = bookJson;
	}

	@JSON(serialize = false)
	public JSONObject getBookListJson() {
		return bookListJson;
	}

	public void setBookListJson(JSONObject bookListJson) {
		this.bookListJson = bookListJson;
	}
	
	public JSONObject getBorrowListJson() {
		return borrowListJson;
	}

	public void setBorrowListJson(JSONObject borrowListJson) {
		this.borrowListJson = borrowListJson;
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public UserBookService getUserBookService() {
		return userBookService;
	}

	public void setUserBookService(UserBookService userBookService) {
		this.userBookService = userBookService;
	}
}
