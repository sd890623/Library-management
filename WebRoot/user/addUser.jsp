<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="addUserForm" class="easyui-form iform-horizontal" method="post" 
	data-options="novalidate:false">
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>用户编号: </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="addUserCode" name="userCode" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>

	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>用户姓名: </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="addUserName" name="userName" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>密码: </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="addPassword" name="password" validType="length[0,256]" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>用户类别: </div>
		<div class="icontrols">
			<select class="easyui-combobox" id="addUserType" name="userType" validType="length[0,256]" type="text" style="width:200px;height:26px;">
				<option value=""></option>
				<option value="0">管理员</option>
				<option value="1">普通用户</option>
				<option value="2">黑名单用户</option>
			</select>
		</div>
	</div>
	
	<div>
		<a href="javascript:void(0)"
			class="easyui-linkbutton l-btn-red button-color"
			onclick="addUser();"
			data-options="iconCls:'icon-ok'">确定</a>
		<a href="javascript:void(0)"
			class="easyui-linkbutton button-color"
			onclick="$('#dlgAddUser').dialog('close')"
			data-options="iconCls:'icon-no'">取消</a>
	</div>
</form> 

<script src="<%=request.getContextPath()%>/user/js/addUser.js" type="text/javascript" charset="gb2312"></script>