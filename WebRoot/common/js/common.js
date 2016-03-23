var pathName = document.location.pathname;
var index = pathName.substr(1).indexOf("/");
var contextPath = pathName.substr(0,index+1);

var userId = $('#userId').val();
var userCode = $('#userCode').val();
var userName = $('#userName').val();
var userType = $('#userType').val();
var password = $('#password').val();