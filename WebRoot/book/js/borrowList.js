
$(function()
{
	findBorrowList();
});

function findBorrowList()
{
	var params = 
	{
		bookCode: $("#searchBorrowBookCode").textbox("getText"), 
		bookName: $("#searchBorrowBookName").textbox("getText"),
		userCode: $("#searchBorrowUserCode").textbox("getText"),
		startDate: $("#searchStartDate").textbox("getText"),
		endDate: $("#searchEndDate").textbox("getText"),
		status: $("#searchBorrowStatus").textbox("getText")
	};
	
    $('#borrowList').datagrid(
    {  
    	iconCls:'icon-list',
        nowrap: false,
        striped: true,  
        fitColumns: true,
        loadMsg: 'Loading...',
        queryParams: params,
        url: contextPath + '/findBorrowList.action', 
        columns:
        [
         	[  
				{
					field: 'bookCode',
					title: 'Book ID',
					align: 'left',
					width: 100
				}, 
				{
					field: 'bookName',
					title: 'Book Name',
					align: 'left',
					width: 100
				}, 
				{
					field: 'userCode',
					title: 'Borrower Name',
					align: 'left',
					width: 100
				}, 
				{
					field: 'startDate',
					title: 'Borrow Date',
					align: 'left',
					width: 100
				}, 
				{
					field: 'endDate',
					title: 'Return Date',
					align: 'left',
					width: 100
				},
				{
					field: 'status',
					title: 'Expired',
					align: 'left',
					width: 100,
					formatter:function(value, rec)
		            {  
						if(rec.status == '1')
						{
							return 'Expired';
						}
						else if(rec.status == '0')
						{
							return 'Not Expired';
						}
		            }
				},
				{
					field: 'borrow',
					title: 'Returned',
					align: 'left',
					width: 100,
					formatter:function(value, rec)
		            {  
						if(rec.borrow == '0')
						{
							return 'Returned';
						}
						else if(rec.borrow == '1')
						{
							return 'Not Returned';
						}
		            }
				},
				{
					field: 'penaltyPerDay',
					title: 'Penalty/Day',
					align: 'left',
					width: 100
				},
				{
					field: 'totalPenalty',
					title: 'Total Penalty',
					align: 'left',
					width: 100
				},
		        {
					field:'opt',
					width: 120,
		            formatter:function(value, rec)
		            {  
		                var updateBtn = "<a class='updateBorrowCls' href='javascript:void(0)' onclick=\"setAsReturn(" 
		                	+ "\'" + rec.id + "\', " 
		                	+ "\'" + rec.borrow + "\')\">Set as return</a>";  
		                
		                var deleteBtn = "<a class='deleteBorrowCls' href='javascript:void(0)' onclick=\"deleteBorrow(" 
		                	+ "\'" + rec.id+ "\', " 
		                	+ "\'" + rec.bookId + "\')\">Delete</a>";  
		                
		                return "<div>" + updateBtn + deleteBtn + "</div>";  
		            }  
		        } 
	        ]
        ],
        onLoadSuccess:function(data)
        {  
        	var userType = $('#userType').val();
        	
            $('.updateBorrowCls').linkbutton({text:'Set as Returned',plain:true,iconCls:'icon-edit'});  
            $('.deleteBorrowCls').linkbutton({text:'Delete',plain:true,iconCls:'icon-cut'});  
            
            if(userType != '0')
            {
            	$('#borrowList').datagrid('hideColumn', 'opt');
            }
        }  
   });  
}

function setAsReturn(id, borrow)
{
	if(borrow == '0')
	{
		alert("It's already returned");
		return;
	}
	else
	{
		$.post
		(
			contextPath + "/setAsReturn.action",
			{
				"id": id
			},
			function(data)
			{
				alert("The book is set to return by force");

				findBorrowList();
				findBookList();
			}
		);
	}
}

function deleteBorrow(id)
{
	$.post
	(
		contextPath + "/deleteBorrow.action",
		{
			"id": id
		},
		function(data)
		{
			alert("Record Deleted");

			findBorrowList();
			findBookList();
		}
	);
}
