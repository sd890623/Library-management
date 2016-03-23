package com.daniel.user.service;

import java.util.List;

import com.daniel.user.bean.User;

public interface UserService 
{
	public void addUser(User user);
	
	public void deleteUser(User user);
	
	public void updateUser(User user);
	
	public User findUserById(String userId);
	
	public List <User> findUserList(String userCode, String userName, String userType);
	
	public User findUserByUserCode(String userCode);
}
