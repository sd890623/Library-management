package com.daniel.login.action;
import com.daniel.user.bean.User;
import com.daniel.user.service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction 
{
	private UserService userService;
	
	private String userCode;
	private String password;
	
	public String login()
	{	
		User user = userService.findUserByUserCode(userCode);
		
		try
		{
			if(user == null)
			{
				throw new Exception();
			}
			
			if(!user.getPassword().equals(password))
			{
				throw new Exception();
			}
			
			ActionContext.getContext().getSession().clear();
			ActionContext.getContext().getSession().put("user", user);
			
			return "success";
		}
		catch(Exception e)
		{
			ActionContext.getContext().getSession().put("loginFail", "failure");
			
			return "failure";
		}
	}

	public String logout()
	{
		ActionContext.getContext().getSession().clear();
		
		return "success";
	}
	
	/**Getters and Setters*/
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
