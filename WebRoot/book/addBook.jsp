<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="addBookForm" class="easyui-form iform-horizontal" method="post" 
	data-options="novalidate:false">
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Book ID </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="addBookCode" name="bookCode" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>

	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Book Name </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="addBookName" name="bookName" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Book Category </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="addContentType" name="contentType" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Price </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="addPrice" name="price" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:15px">
		<div class="icontrol-label" style="width:200px;">Penalty/day </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="addPenaltyPerDay" name="penaltyPerDay" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>

	<div>
		<a href="javascript:void(0)"
			class="easyui-linkbutton l-btn-red button-color"
			onclick="addBook();"
			data-options="iconCls:'icon-ok'">OK</a>
		<a href="javascript:void(0)"
			class="easyui-linkbutton button-color"
			onclick="$('#dlgAddBook').dialog('close')"
			data-options="iconCls:'icon-no'">Cancel</a>
	</div>
</form> 

<script src="<%=request.getContextPath()%>/book/js/addBook.js" type="text/javascript" charset="gb2312"></script>