function addUser()
{
	var userCode = $('#addUserCode').textbox('getValue');
	var userName = $('#addUserName').textbox('getValue');
	var userType = $('#addUserType').textbox('getValue');
	var password = $('#addPassword').textbox('getValue');
	
	$.post
	(
		contextPath + "/addUser.action",
		{
			"userCode": userCode,
			"userName": userName,
			"userType": userType,
			"password": password
		},
		function(data)
		{
			alert("新增用户成功");
			
			$('#dlgAddUser').dialog('close');
			
			findUserList();
		}
	);
}
