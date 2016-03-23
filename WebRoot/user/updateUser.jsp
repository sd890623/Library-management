<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="updateUserForm" class="easyui-form iform-horizontal" method="post" 
	data-options="novalidate:false">
	<input id="updateUserId" name="userId" validType="length[0,256]" type="hidden"></input>	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>User ID </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updateUserCode" name="userCode" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>

	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>User Name</div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updateUserName" name="userName" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px;display:none">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Password </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updatePassword" name="password" validType="length[0,256]" type="hidden" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>User Type</div>
		<div class="icontrols">
			<select class="easyui-combobox" id="updateUserType" name="userType" validType="length[0,256]" type="text" style="width:200px;height:26px;">
				<option value=""></option>
				<option value="0">Admin</option>
				<option value="1">Standard</option>
				<option value="2">Blacklisted</option>
			</select>
		</div>
	</div>
	
	<div>
		<a href="javascript:void(0)"
			class="easyui-linkbutton l-btn-red button-color"
			onclick="updateUser();"
			data-options="iconCls:'icon-ok'">OK</a>
		<a href="javascript:void(0)"
			class="easyui-linkbutton button-color"
			onclick="$('#dlgUpdateUser').dialog('close')"
			data-options="iconCls:'icon-no'">Cancel</a>
	</div>
</form> 

<script src="<%=request.getContextPath()%>/user/js/updateUser.js" type="text/javascript" charset="gb2312"></script>