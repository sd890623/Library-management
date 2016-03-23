
function updateBook()
{
	var bookId = $('#updateBookId').val();
	var bookCode = $('#updateBookCode').textbox('getValue');
	var bookName = $('#updateBookName').textbox('getValue');
	var contentType = $('#updateContentType').textbox('getValue');
	var price = $('#updatePrice').textbox('getValue');
	var penaltyPerDay = $('#updatePenaltyPerDay').textbox('getValue');
	var status = $('#updateStatus').textbox('getValue');
	
	$.post
	(
		contextPath + "/updateBook.action",
		{
			"bookId": bookId,
			"bookCode": bookCode,
			"bookName": bookName,
			"contentType": contentType,
			"price": price,
			"penaltyPerDay": penaltyPerDay,
			"status": status
		},
		function(data)
		{
			alert("Book Edited");
			
			$('#dlgUpdateBook').dialog('close');
			
			findBookList();
		}
	);
}