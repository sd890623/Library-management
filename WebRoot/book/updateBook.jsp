<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="updateBookForm" class="easyui-form iform-horizontal" method="post" 
	data-options="novalidate:false">
	<input id="updateBookId" name="bookId" type="hidden"></input>
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Book No. </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updateBookCode" name="bookCode" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>

	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Book Name </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updateBookName" name="bookName" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Category</div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updateContentType" name="contentType" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Price: </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updatePrice" name="price" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:15px">
		<div class="icontrol-label" style="width:200px;">Penalty/day </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updatePenaltyPerDay" name="penaltyPerDay" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:15px">
		<div class="icontrol-label" style="width:200px;">Status </div>
		<div class="icontrols">
			<select class="easyui-combobox" id="updateStatus" name="status" validType="length[0,256]" type="text" style="width:200px;height:26px;">
				<option value=""></option>
				<option value="1">Borrowed</option>
				<option value="0">Not Borrowed</option>
			</select>
		</div>
	</div>
	
	<div>
		<a href="javascript:void(0)"
			class="easyui-linkbutton l-btn-red button-color"
			onclick="updateBook();"
			data-options="iconCls:'icon-ok'">OK</a>
		<a href="javascript:void(0)"
			class="easyui-linkbutton button-color"
			onclick="$('#dlgUpdateBook').dialog('close')"
			data-options="iconCls:'icon-no'">Cancel</a>
	</div>
</form> 

<script src="<%=request.getContextPath()%>/book/js/updateBook.js" type="text/javascript" charset="gb2312"></script>