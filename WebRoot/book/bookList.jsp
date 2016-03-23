<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="searchBookForm" class="easyui-form iform-horizontal" method="post" data-options="novalidate:true">
	<span>Book ID: </span> 
	<input id="searchBookCode" name="searchBookName" class="easyui-textbox" type="text"></input>
	<span>Book Name: </span> 
	<input id="searchBookName" name="searchBookName" class="easyui-textbox" type="text"></input>
	<span>Book Category </span> 
	<input id="searchContentType" name="searchContentType" class="easyui-textbox" type="text"></input> 					 
	<span>Status </span> 
	<select id="searchStatus" name="searchStatus" class="easyui-combobox" type="text">
		<option value=""></option>
		<option value="0">Not Borrowed</option>
		<option value="1">Borrowed</option>
	</select> 	
	
	<a href="javascript:;" class="easyui-linkbutton" 
		data-options="iconCls:'icon-search'"
		onclick="findBookList();"
		style="width:80px">Search</a> 
</form>

<div id="addBook">
	<a href="#" class="easyui-linkbutton" 
		onclick="$('#dlgAddBook').dialog('open')"
		data-options="iconCls:'icon-add'"
		style="width:130px;margin-bottom:5px">Add New Book</a>
</div>

<table id="bookList"></table>

<div id="dlgAddBook" class="easyui-dialog" title="Add a Book" data-options="closed:true" style="width:240px;height:400px;padding:10px">
	<jsp:include page="/book/addBook.jsp" />
</div>
<div id="dlgUpdateBook" class="easyui-dialog" title="Edit Books" data-options="closed:true" style="width:260px;height:450px;padding:10px">	
	<jsp:include page="/book/updateBook.jsp" />
</div>
<div id="dlgAddBorrow" class="easyui-dialog" title="Borrow Books" data-options="closed:true" style="width:240px;height:400px;padding:10px">
	<jsp:include page="/book/addBorrow.jsp" />
</div>

<script src="<%=request.getContextPath()%>/book/js/bookList.js" type="text/javascript"></script>