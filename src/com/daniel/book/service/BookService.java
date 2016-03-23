package com.daniel.book.service;

import java.util.List;

import net.sf.json.JSONArray;

import com.daniel.book.bean.Book;

public interface BookService
{
	public void addBook(Book book);
	
	public void deleteBook(Book book);
	
	public void updateBook(Book book);
	
	public Book findBookById(String bookId);
	
	public List <Book> findBookList(String bookCode, String bookName, String contentType, String status);

	public JSONArray findBorrowList(String bookCode, String bookName, String userCode, String startDate, String endDate, String status);
}

