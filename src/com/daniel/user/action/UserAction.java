package com.daniel.user.action;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.daniel.user.bean.User;
import com.daniel.user.service.UserService;

public class UserAction
{
	private UserService userService;
	private JSONObject userJson;
	private JSONObject userListJson;
	
	private String userId;
	private String userCode;
	private String userName;
	private String userType;
	private String password;
	
	public String addUser()
	{
		User user = new User();
		
		user.setUserCode(userCode);
		user.setUserName(userName);
		user.setUserType(userType);
		user.setPassword(password);
		
		userService.addUser(user);
		
		return "userList";
	}
	
	public String deleteUser()
	{
		User user = userService.findUserById(userId);
		userService.deleteUser(user);
		
		return "userList";
	}
	
	public String updateUser()
	{
		User user = userService.findUserById(userId);
		
		user.setUserCode(userCode);
		user.setUserName(userName);
		user.setUserType(userType);
		user.setPassword(password);
		
		userService.updateUser(user);
		
		return "userList";
	}
	
	public String updatePassword() {
		User user = userService.findUserById(userId);
		user.setUserName(userName);
		user.setPassword(password);
		
		userService.updateUser(user);
		
		return "userList";
	}
	
	public String findUserById()
	{
		User user = userService.findUserById(userId);
		userJson = JSONObject.fromObject(user);
		
		return "user";
	}
	
	public String findUserList()
	{
		List <User> userList = userService.findUserList(userCode, userName, userType);
		
		JSONObject userJsonTemp = new JSONObject();
		JSONArray userJsonList = new JSONArray();
		for(User user : userList)
		{
			userJsonTemp.put("userId", user.getUserId());
			userJsonTemp.put("userCode", user.getUserCode());
			userJsonTemp.put("password", user.getPassword());
			userJsonTemp.put("userName", user.getUserName());
			userJsonTemp.put("userType", user.getUserType());
			
			userJsonList.add(userJsonTemp);
		}
		
		HashMap <String, Object> rtnMap = new HashMap <String, Object>();
		
		rtnMap.put("all", userList.size());
		rtnMap.put("rows", userJsonList);
		
		userListJson = JSONObject.fromObject(rtnMap);
		
		return "userList";
	}

	/**Getters and Setters*/
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public JSONObject getUserJson() {
		return userJson;
	}

	public void setUserJson(JSONObject userJson) {
		this.userJson = userJson;
	}

	public JSONObject getUserListJson() {
		return userListJson;
	}

	public void setUserListJson(JSONObject userListJson) {
		this.userListJson = userListJson;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}