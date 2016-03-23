<%@ page language="java" import="com.daniel.user.bean.User" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link href="<%=request.getContextPath() %>/book/css/book.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/user/css/user.css" rel="stylesheet" type="text/css">

<%
	User user = (User) session.getAttribute("user");
	
	String userId = user.getUserId();
	String userCode = user.getUserCode();
	String userName = user.getUserName();
	String userType = user.getUserType();
	String password = user.getPassword();
 %>

<html>
	<head>
		<jsp:include page="/common/top.jsp" flush="true" />
	</head>
	<body class="easyui-layout">
		<div style="margin:20px 0;"></div>
		<p align="right" style="margin-right:10px; font-size:14px">
			Welcome，<%=user.getUserName() %>
			<a href="<%=request.getContextPath()%>/logout.action" class="easyui-linkbutton" 
				data-options="iconCls:'icon-undo'"
				style="width:80px;margin-bottom:5px">Log out</a>
		</p>
		<div class="easyui-tabs" style="width:100%;height:80%">
			<div id='commomBookList' title="Book List" style="padding:10px">
				<jsp:include page="/book/bookList.jsp" />
			</div>
			<div id='commonBorrowList' title="Borrow Record" style="padding:10px">
				<jsp:include page="/book/borrowList.jsp" />
			</div>
			
			<%
				if(userType!=null && !"".equals(userType))
				{
					if(userType.equals("0"))
					{
			 %>
						<div id='commonUserList' title="User Management" style="padding:10px">
							<jsp:include page="/user/userList.jsp" />
						</div>
			<%
					}
				}
			 %>
			 
			 <div title="Edit User" style="padding:10px">
			 	<jsp:include page="/user/updateSelf.jsp" />
			 </div>
		</div>	
		
		<input id="userId" name="userId" value=<%=userId %> type="hidden"></input>
		<input id="userCode" name="userCode" value=<%=userCode %> type="hidden"></input>
		<input id="userName" name="userName" value=<%=userName %> type="hidden"></input>
		<input id="userType" name="userType" value=<%=userType %> type="hidden"></input>
		<input id="password" name="password" value=<%=password %> type="hidden"></input>
		
		<jsp:include page="/common/footer.jsp" flush="true" />
	</body>
</html>