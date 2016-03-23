function addBook()
{
	var bookCode = $('#addBookCode').textbox('getValue');
	var bookName = $('#addBookName').textbox('getValue');
	var contentType = $('#addContentType').textbox('getValue');
	var price = $('#addPrice').textbox('getValue');
	var penaltyPerDay = $('#addPenaltyPerDay').textbox('getValue');
	
	$.post
	(
		contextPath + "/addBook.action",
		{
			"bookCode": bookCode,
			"bookName": bookName,
			"contentType": contentType,
			"price": price,
			"penaltyPerDay": penaltyPerDay
		},
		function(data)
		{
			alert("Book Added");
			
			$('#dlgAddBook').dialog('close');
			
			findBookList();
		}
	);
}
