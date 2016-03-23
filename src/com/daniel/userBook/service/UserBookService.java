package com.daniel.userBook.service;

import com.daniel.userBook.bean.UserBook;

public interface UserBookService
{
	public void addUserBook(UserBook userBook);
	
	public void updateUserBook(UserBook userBook);
	
	public void deleteUserBook(UserBook userBook);
	
	public UserBook findUserBookById(String id);
}
