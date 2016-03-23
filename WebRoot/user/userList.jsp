<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="searchUserForm" class="easyui-form iform-horizontal" method="post" data-options="novalidate:true">
	<span>User ID</span> 
	<input id="searchUserCode" name="searchUserCode" class="easyui-textbox" type="text"></input> 
	<span>User Name </span> 
	<input id="searchUserName" name="searchUserName" class="easyui-textbox" type="text"></input> 				 
	<span>User Type </span> 
	<select id="searchUserType" name="searchUserType" class="easyui-combobox" type="text">
		<option value=""></option>
		<option value="0">Admin</option>
		<option value="1">User</option>
		<option value="2">BlackListed</option>
	</select> 	

	<a href="javascript:;" class="easyui-linkbutton" 
		data-options="iconCls:'icon-search'"
		onclick="findUserList();"
		style="width:80px">Search</a> 
</form>

<div id="addUser">
	<a href="#" class="easyui-linkbutton" 
		onclick="$('#dlgAddUser').dialog('open')"
		data-options="iconCls:'icon-add'"
		style="width:120px;margin-bottom:5px">Add an User</a>
</div>

<table id="userList"></table>

<div id="dlgAddUser" class="easyui-dialog" title="Add User" data-options="closed:true" style="width:240px;height:340px;padding:10px">
	<jsp:include page="/user/addUser.jsp" />
</div>
<div id="dlgUpdateUser" class="easyui-dialog" title="Edit User" data-options="closed:true" style="width:240px;height:340px;padding:10px">	
	<jsp:include page="/user/updateUser.jsp" />
</div>

<script src="<%=request.getContextPath() %>/user/js/userList.js" type="text/javascript" charset="gb2312"></script>
