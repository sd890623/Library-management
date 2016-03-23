package com.daniel.user.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class UserDao extends HibernateDaoSupport
{
	@SuppressWarnings("rawtypes")
	public List executeQuery(String hql)
	{
		List list = null;
		
		Session session = this.getSessionFactory().openSession();
		list = session.createQuery(hql).list();
		
		session.close();
		
		return list;
	}
}
