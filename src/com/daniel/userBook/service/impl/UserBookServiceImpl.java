package com.daniel.userBook.service.impl;

import com.daniel.userBook.bean.UserBook;
import com.daniel.userBook.dao.UserBookDao;
import com.daniel.userBook.service.UserBookService;

public class UserBookServiceImpl implements UserBookService
{
	private UserBookDao userBookDao;
	
	public void addUserBook(UserBook userBook)
	{
		userBookDao.getHibernateTemplate().save(userBook);
	}
	
	public void deleteUserBook(UserBook userBook)
	{
		userBookDao.getHibernateTemplate().delete(userBook);
	}
	
	public void updateUserBook(UserBook userBook)
	{
		userBookDao.getHibernateTemplate().update(userBook);
	}
	
	public UserBook findUserBookById(String id)
	{
		return (UserBook) userBookDao.getHibernateTemplate().get(UserBook.class, id);
	}

	public UserBookDao getUserBookDao() {
		return userBookDao;
	}

	public void setUserBookDao(UserBookDao userBookDao) {
		this.userBookDao = userBookDao;
	}
}
