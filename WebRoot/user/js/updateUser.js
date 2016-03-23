
function updateUser()
{
	var userId = $('#updateUserId').val();
	var userCode = $('#updateUserCode').textbox('getValue');
	var userName = $('#updateUserName').textbox('getValue');
	var password = $('#updatePassword').textbox('getValue');
	var userType = $('#updateUserType').textbox('getValue');
	
	$.post
	(
		contextPath + "/updateUser.action",
		{
			"userId": userId,
			"userCode": userCode,
			"userName": userName,
			"password":password,
			"userType": userType
			
		},
		function(data)
		{
			alert("User is updated");
			
			$('#dlgUpdateUser').dialog('close');
			
			findUserList();
		}
	);
}


function updateSelf()
{
	
	var userId=$('#userId').val();
	var userName=$('#updateSelfName').val();
	var password=$('#updateSelfPassword').val();
	if (password==""||password==null) {
		alert("Password can not be blank");
		}
	else {
	
	$.post
	(
		contextPath + "/updatePassword.action",
		{
			"userId": userId,
			"UserName":userName,
			"password":password
			
		},
		function(data)
		{
			alert("User is updated");
			
			$('#dlgUpdateUser').dialog('close');
			
			findUserList();
		}
	);
	}
}


