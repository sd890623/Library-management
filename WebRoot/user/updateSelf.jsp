<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form id="updateSelfForm" class="easyui-form iform-horizontal" method="post" 
	data-options="novalidate:false">
	<input id="updateSelfId" name="userId" type="hidden"></input>	

	<div class="icontrol-group" style="margin-bottom:20px;">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Edit Name </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updateSelfName" name="selfName" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div class="icontrol-group" style="margin-bottom:20px">
		<div class="icontrol-label" style="width:200px;"><i class="required">*</i>Change Password </div>
		<div class="icontrols">
			<input class="easyui-textbox" id="updateSelfPassword" name="password" type="text" style="width:200px;height:26px;"></input>
		</div>
	</div>
	
	<div>
		<a href="javascript:void(0)"
			class="easyui-linkbutton l-btn-red button-color"
			onclick="updateSelf();"
			data-options="iconCls:'icon-ok'">OK</a>
		<a href="javascript:void(0)"
			class="easyui-linkbutton button-color"
			onclick="$('#dlgUpdateSelf').dialog('close')"
			data-options="iconCls:'icon-no'">Cancel</a>
	</div>
</form> 

<script>

	$(function()
	{
		$('#updateSelfId').val($('#userId').val());
		$('#updateSelfName').textbox('setValue', $('#userName').val());
	});
	
</script>

<script src="<%=request.getContextPath()%>/user/js/updateUser.js" type="text/javascript" charset="gb2312"></script>
