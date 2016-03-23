function addBorrow()
{
	var bookId = $('#borrowBookId').textbox('getValue');
	var startDate = $('#borrowStartDate').textbox('getValue');
	var endDate = $('#borrowEndDate').textbox('getValue');
	
	$.post
	(
		contextPath + "/addBorrow.action",
		{
			"bookId": bookId,
			"startDate": startDate,
			"endDate": endDate
		},
		function(data)
		{
			alert("A Successful Borrow");
			
			$('#dlgAddBorrow').dialog('close');
			
			findBorrowList();
			findBookList();
		}
	);
}