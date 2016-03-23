<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="addBorrowForm" class="easyui-form iform-horizontal" method="post" 
	data-options="novalidate:false">
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Book ID </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="borrowBookCode" name="borrowBookCode" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>

	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Book Name </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="borrowBookName" name="borrowBookName" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Borrow Date </div>
		<div class="icontrols">
			<input class="easyui-datebox" id="borrowStartDate" name="startTime" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:15px">
		<div class="icontrol-label" style="width:200px;">Return Date </div>
		<div class="icontrols">
			<input class="easyui-datebox" id="borrowEndDate" name="endDate" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>

	<div>
		<a href="javascript:void(0)"
			class="easyui-linkbutton l-btn-red button-color"
			onclick="addBorrow();"
			data-options="iconCls:'icon-ok'">Borrow</a>
		<a href="javascript:void(0)"
			class="easyui-linkbutton button-color"
			onclick="$('#dlgAddBorrow').dialog('close')"
			data-options="iconCls:'icon-no'">Cancel</a>
	</div>
</form> 

<input class="easyui-textbox" id="borrowBookId" name="bookId" type="hidden"></input>

<script src="<%=request.getContextPath()%>/book/js/addBorrow.js" type="text/javascript" charset="gb2312"></script>