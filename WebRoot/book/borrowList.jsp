<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="searchBorrowForm" class="easyui-form iform-horizontal" method="post" data-options="novalidate:true">
	<span>Book ID </span> 
	<input id="searchBorrowBookCode" name="searchBorrowBookCode" class="easyui-textbox" type="text"></input> 
	<span>Book Name </span> 
	<input id="searchBorrowBookName" name="searchBorrowBookName" class="easyui-textbox" type="text"></input> 				 
	<span>Borrower </span> 
	<input id="searchBorrowUserCode" name="searchBorrowUserId" class="easyui-textbox" type="text"></input> 	
	<span>Borrow Date</span> 
	<input id="searchStartDate" name="searchStartDate" class="easyui-datebox" type="text"></input> 	
	<span>Return Date </span> 
	<input id="searchEndDate" name="searchEndDate" class="easyui-datebox" type="text"></input> 
	<span>Expired</span> 
	<select id="searchBorrowStatus" name="searchBorrowStatus" class="easyui-combobox" type="text">
		<option value=""></option>
		<option value="0">Not Expired</option>
		<option value="1">Expired</option>
	</select>

	<a href="javascript:;" class="easyui-linkbutton" 
		data-options="iconCls:'icon-search'"
		onclick="findBorrowList();"
		style="width:80px">Search</a> 
</form>

<table id="borrowList"></table>

<script src="<%=request.getContextPath() %>/book/js/borrowList.js" type="text/javascript" charset="gb2312"></script>
