
$(function()
{
	findBookList();
	
	var userType = $('#userType').val();
	if(userType != '0')
	{
		$('#addBook').remove();
	}
});

function findBookList()
{
	var params = 
	{
		bookCode: $("#searchBookCode").textbox("getText"),
		bookName: $("#searchBookName").textbox("getText"),
		contentType: $("#searchContentType").textbox("getText"),
		status: $("#searchStatus").textbox("getText")
	};
	
    $('#bookList').datagrid(
    {  
    	iconCls:'icon-list',
        nowrap: false,
        striped: true,  
        fitColumns: false,
        fit: true,
        loadMsg: 'Loading...',
        queryParams: params,
        url: contextPath + '/findBookList.action', 
        columns:
        [
         	[  
				{
					field: 'bookCode',
					title: 'Book ID',
					align: 'left',
					width: 200
				}, 
				{
					field: 'bookName',
					title: 'Book Name',
					align: 'left',
					width: 200
				}, 
				{
					field: 'contentType',
					title: 'Book Category',
					align: 'left',
					width: 200
				},
				{
					field: 'status',
					title: 'Borrow Status',
					align: 'left',
					sortable: true,
					width: 200,
					formatter:function(value, rec)
		            {  
						if(rec.status == '1')
						{
							return 'Borrowed';
						}
						else if(rec.status == '0')
						{
							return 'Not Borrowed';
						}
		            }
				},
		        {
					field:'borrow',
					width: 170,
		            formatter:function(value, rec)
		            {  
		            	var borrowBtn = "<a class='addBorrowCls' href='javascript:void(0)' onclick=\"openAddBorrow(" 
		                	+ "\'" + rec.bookId + "\', " 
		                	+ "\'" + rec.bookCode + "\', " 
		                	+ "\'" + rec.bookName + "\', " 
		                	+ "\'" + rec.status + "\')\">Borrow</a>";  

		                return borrowBtn;
		            }  
		        },
		        {
					field:'opt',
					width: 180,
		            formatter:function(value, rec)
		            {  
		                var updateBtn = "<a class='updateBookCls' href='javascript:void(0)' onclick=\"openUpdateBook(" 
		                	+ "\'" + rec.bookId + "\', " 
		                	+ "\'" + rec.bookCode + "\', " 
		                	+ "\'" + rec.bookName + "\', " 
		                	+ "\'" + rec.contentType + "\',"  
		                	+ "\'" + rec.price + "\',"
		                	+ "\'" + rec.penaltyPerDay + "\', "
		                	+ "\'" + rec.status + "\')\">Edit</a>";  
		                
		                var deleteBtn = "<a class='deleteBookCls' href='javascript:void(0)' onclick=\"deleteBook(" 
		                	+ "\'" + rec.bookId + "\')\">Delete</a>";  
		                
		                return "<div>" + updateBtn + deleteBtn + "</div>";  
		            } 
		        } 
				
	        ]
       ],
       onLoadSuccess:function(data)
       {  
    	   var userType = $('#userType').val();
    	   
    	   $('.addBorrowCls').linkbutton({text:'Borrow',plain:true,iconCls:'icon-redo'});  
           $('.updateBookCls').linkbutton({text:'Edit',plain:true,iconCls:'icon-edit'});  
           $('.deleteBookCls').linkbutton({text:'Delete',plain:true,iconCls:'icon-cut'}); 
           
           if(userType == '0')
	       {
        	   //$('#bookList').datagrid('hideColumn', 'borrow');  
	       }
           else
           { 
        	   $('#bookList').datagrid('hideColumn', 'opt');
           }
       }  
   });  
}

function deleteBook(bookId)
{
	$.post
	(
		contextPath + "/deleteBook.action",
		{
			"bookId": bookId
		},
		function(data)
		{
			alert("Book Deleted");

			findBookList();
		}
	);
}

function openUpdateBook(bookId, bookCode, bookName, contentType, price, penaltyPerDay, status)
{
	$('#updateBookId').val(bookId);
	$('#updateBookCode').textbox('setValue', bookCode);
	$('#updateBookName').textbox('setValue', bookName);
	$('#updateContentType').textbox('setValue', contentType);
	$('#updatePrice').textbox('setValue', price);
	$('#updatePenaltyPerDay').textbox('setValue', penaltyPerDay);
	$('#updateStatus').combobox('setValue', status);
	
	$('#dlgUpdateBook').dialog('open');
}

function openAddBorrow(bookId, bookCode, bookName, status)
{
	var userType = $('#userType').val();
	 
	if(userType == '2')
	{
		alert("You are blacklisted, please contact the administrator.");
		return;
	}
	/* else if(userType == '0')
	{
		alert("你特么是管理员借个毛书啊");
		return;
	} */
	else if(status == '1')
	{
		alert("The book has been borrowed");
		return;
	}
	else
	{
		$('#borrowBookId').textbox('setValue', bookId);
		$('#borrowBookCode').textbox('setValue', bookCode);
		$('#borrowBookName').textbox('setValue', bookName);

		$('#dlgAddBorrow').dialog('open');
	}
}