package com.daniel.user.service.impl;

import java.util.List;

import com.daniel.user.bean.User;
import com.daniel.user.dao.UserDao;
import com.daniel.user.service.UserService;
import com.daniel.userBook.bean.UserBook;
import com.daniel.userBook.dao.UserBookDao;

public class UserServiceImpl implements UserService
{
	private UserDao userDao;
	private UserBookDao userBookDao;

	public void addUser(User user) 
	{
		userDao.getHibernateTemplate().save(user);
	}

	@SuppressWarnings("unchecked")
	public void deleteUser(User user)
	{
		userDao.getHibernateTemplate().delete(user);
		
		String hql = "FROM UserBook ub WHERE ub.userId = '" + user.getUserId() + "'";
		List <UserBook> borrowList = (List <UserBook>) userBookDao.executeQuery(hql.toString());
		
		for(UserBook userBook : borrowList)
		{
			userBookDao.getHibernateTemplate().delete(userBook);
		}
	}

	public void updateUser(User user)
	{
		userDao.getHibernateTemplate().update(user);
	}
	
	public User findUserById(String userId)
	{
		return (User) userDao.getHibernateTemplate().get(User.class, userId);
	}

	@SuppressWarnings("unchecked")
	public List<User> findUserList(String userCode, String userName, String userType) 
	{
		StringBuffer hql = new StringBuffer("FROM User u WHERE 1=1 ");
		
		if(userCode!=null && !"".equals(userCode))
		{
			hql.append("AND u.userCode = '" + userCode + "' ");
		}
		
		if(userName!=null && !"".equals(userName))
		{
			hql.append("AND u.userName LIKE '%" + userName + "%' ");
		}
		
		if(userType!=null && !"".equals(userType))
		{
			hql.append("AND u.userType = '" + userType + "' ");
		}
		
		return (List <User>) userDao.getHibernateTemplate().find(hql.toString());
	}
	
	public User findUserByUserCode(String userCode)
	{
		String hql = "FROM User u WHERE u.userCode = '" + userCode + "' ";

		@SuppressWarnings("unchecked")
		List <User> users = userDao.executeQuery(hql);
		
		if(users.size() != 1)
		{
			return null;
		}
		else
		{
			return users.get(0);
		}
	}

	public UserBookDao getUserBookDao() {
		return userBookDao;
	}

	public void setUserBookDao(UserBookDao userBookDao) {
		this.userBookDao = userBookDao;
	}
	
	public UserDao getUserDao()
	{
		return userDao;
	}
	
	public void setUserDao(UserDao userDao)
	{
		this.userDao = userDao;
	}
}
