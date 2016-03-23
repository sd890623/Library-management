
$(function()
{
	findUserList();
});

function findUserList()
{
	var params = 
	{
		userCode: $("#searchUserCode").textbox("getText"),
		userName: $("#searchUserName").textbox("getText"),
		userType: $("#searchUserType").textbox("getText"),
	};
	
    $('#userList').datagrid(
    {  
    	iconCls:'icon-list',
        nowrap: false,
        striped: true,  
        fitColumns: true,
        loadMsg: 'Loading...',
        queryParams: params,
        url: contextPath + '/findUserList.action', 
        columns:
        [
         	[  
				{
					field: 'userCode',
					title: 'User ID',
					align: 'left',
					width: 200
				}, 
				{
					field: 'userName',
					title: 'User Name',
					align: 'left',
					width: 200
				}, 
				{
					field: 'userType',
					title: 'User Type',
					align: 'left',
					width: 200,
					formatter:function(value, rec)
		            {  
						if(rec.userType == '0')
						{
							return 'Admin';
						}
						else if(rec.userType == '1')
						{
							return 'User';
						}
						else if(rec.userType == '2')
						{
							return 'Blacklisted';
						}
		            }
				},
		        {
					field:'opt',
					width: 60,
		            formatter:function(value, rec)
		            {  
		                var updateBtn = "<a class='updateUserCls' href='javascript:void(0)' onclick=\"openUpdateUser(" 
		                	+ "\'" + rec.userId + "\', " 
		                	+ "\'" + rec.userCode + "\', " 
		                	+ "\'" + rec.userName + "\', " 
		                	+ "\'" + rec.password + "\', " 
		                	+ "\'" + rec.userType + "\')\">Edit</a>";  
		                
		                var deleteBtn = "<a class='deleteUserCls' href='javascript:void(0)' onclick=\"deleteUser(" 
		                	+ "\'" + rec.userId + "\')\">Delete</a>";  
		                
		                return "<div>" + updateBtn + deleteBtn + "</div>";  
		            }  
		        } 
	        ]
       ],
       onLoadSuccess:function(data)
       {  
           $('.updateUserCls').linkbutton({text:'Edit',plain:true,iconCls:'icon-edit'});  
           $('.deleteUserCls').linkbutton({text:'Delete',plain:true,iconCls:'icon-cut'});  
       }  
   });  
}

function deleteUser(userId)
{
	$.post
	(
		contextPath + "/deleteUser.action",
		{
			"userId": userId
		},
		function(data)
		{
			alert("User Deleted");

			findUserList();
		}
	);
}

function openUpdateUser(userId, userCode, userName, password, userType)
{
	
	$('#updateUserId').val(userId);
	$('#updateUserCode').textbox('setValue', userCode);
	$('#updateUserName').textbox('setValue', userName);
	$('#updatePassword').textbox('setValue', password);
	$('#updateUserType').combobox('setValue', userType);
	
	$('#dlgUpdateUser').dialog('open');
}
