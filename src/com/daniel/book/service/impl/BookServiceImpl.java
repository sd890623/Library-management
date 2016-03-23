package com.daniel.book.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.daniel.book.bean.Book;
import com.daniel.book.dao.BookDao;
import com.daniel.book.service.BookService;
import com.daniel.userBook.bean.UserBook;
import com.daniel.userBook.dao.UserBookDao;
import com.daniel.utils.DateUtils;

public class BookServiceImpl implements BookService
{
	private BookDao bookDao;
	private UserBookDao userBookDao;
	
	public void addBook(Book book)
	{
		bookDao.getHibernateTemplate().save(book);
	}
	
	@SuppressWarnings("unchecked")
	public void deleteBook(Book book)
	{
		bookDao.getHibernateTemplate().delete(book);
		
		String hql = "FROM UserBook ub WHERE ub.bookId = '" + book.getBookId() + "'";
		List <UserBook> borrowList = (List <UserBook>) userBookDao.executeQuery(hql.toString());
		
		for(UserBook userBook : borrowList)
		{
			userBookDao.getHibernateTemplate().delete(userBook);
		}
	}
	
	public void updateBook(Book book)
	{
		bookDao.getHibernateTemplate().update(book);
	}
	
	public Book findBookById(String bookId)
	{
		return (Book) bookDao.getHibernateTemplate().get(Book.class, bookId);
	}
	
	@SuppressWarnings("unchecked")
	public List <Book> findBookList(String bookCode, String bookName, String contentType, String status)
	{
		StringBuffer hql = new StringBuffer("FROM Book book WHERE 1 = 1 ");
		
		
		if(bookCode!=null && !"".equals(bookCode))
		{
			hql.append("AND book.bookCode = '" + bookCode + "' ");
		}
		
		if(bookName!=null && !"".equals(bookName))
		{
			hql.append("AND book.bookName LIKE '%" + bookName + "%' ");
		}
		
		if(contentType!=null && !"".equals(contentType))
		{
			hql.append("AND book.contentType = '" + contentType + "' ");
		}
		
		if(status!=null && !"".equals(status))
		{
			hql.append("AND book.status = '" + status + "' ");
		}
		
		return (List <Book>) bookDao.getHibernateTemplate().find(hql.toString()); 
	}

	@SuppressWarnings("rawtypes")
	public JSONArray findBorrowList(String bookCode, String bookName,
			String userCode, String startDate, String endDate, String status) 
	{
		StringBuffer hql = new StringBuffer("SELECT b.bookCode, b.bookName, u.userCode, ub.startDate, ub.endDate, ub.status, b.penaltyPerDay, ub.id, ub.borrow FROM Book b, UserBook ub, User u WHERE b.bookId = ub.bookId AND u.userId = ub.userId ");
		
		if(bookCode!=null && !"".equals(bookCode))
		{
			hql.append("AND b.bookCode = '" + bookCode + "' ");
		}
		
		if(bookName!=null && !"".equals(bookName))
		{
			hql.append("AND b.bookName LIKE '%" + bookName + "%' ");
		}
		
		if(userCode!=null && !"".equals(userCode))
		{
			hql.append("AND u.userCode = '" + userCode + "' ");
		}
		
		if(startDate!=null && !"".equals(startDate))
		{
			hql.append("AND ub.startDate >= '" + startDate + "' ");
		}
		
		if(endDate!=null && !"".equals(endDate))
		{
			hql.append("AND ub.endDate <= '" + endDate + "' ");
		}
		
		if(status!=null && !"".equals(status))
		{
			hql.append("AND ub.status = '" + status + "' ");
		}
		
		List borrowList = bookDao.executeQuery(hql.toString());

		JSONArray borrowListJson = new JSONArray();
		for(int i=0; i<borrowList.size(); i++)
		{
			Object [] borrowObjArray = (Object []) borrowList.get(i);
			
			JSONObject borrowJson = new JSONObject();
			borrowJson.put("bookCode", borrowObjArray[0]);
			borrowJson.put("bookName", borrowObjArray[1]);
			borrowJson.put("userCode", borrowObjArray[2]);
			borrowJson.put("startDate", borrowObjArray[3]);
			borrowJson.put("endDate", borrowObjArray[4]);
			borrowJson.put("status", borrowObjArray[5]);
			borrowJson.put("penaltyPerDay", borrowObjArray[6]);
			borrowJson.put("id", borrowObjArray[7]);
			borrowJson.put("borrow", borrowObjArray[8]);
			
			double penaltyPerDay = Double.parseDouble((String) borrowObjArray[6]);
			int dateVariance = DateUtils.dateVariance((String) borrowObjArray[4]);
			
			String totalPenalty = "0";
			if(borrowObjArray[5].equals("1"))
			{
				totalPenalty = new DecimalFormat("0.00").format(penaltyPerDay * dateVariance);
			}
			
			borrowJson.put("totalPenalty", totalPenalty);
			
			borrowListJson.add(borrowJson);
		}
		
		return borrowListJson;
	}

	public UserBookDao getUserBookDao() {
		return userBookDao;
	}

	public void setUserBookDao(UserBookDao userBookDao) {
		this.userBookDao = userBookDao;
	}
	
	public BookDao getBookDao()
	{
		return bookDao;
	}
	
	public void setBookDao(BookDao bookDao)
	{
		this.bookDao = bookDao;
	}
}
