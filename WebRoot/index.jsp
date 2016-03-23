<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="<%=request.getContextPath() %>/js/index.js" type="text/javascript"></script>

	<jsp:include page="/common/top.jsp" flush="true" />
</head>
	<body>
		<div style="margin:100px 0;"></div>
		<div>
		    <div class="easyui-panel" title="Login" style="background:#fafafa;width:310px;height:280px;padding:10px;" data-options="iconCls:'icon-login',style:{position:'absolute',left:530,top:250}">
		    	<form id="login" method="post" action='<%=request.getContextPath()%>/login.action'>
			        <div style="margin-top:5px; margin-bottom:10px">
			            <input class="easyui-textbox" id="loginUserCode" name="userCode" style="width:100%;height:30px;padding:12px" data-options="prompt:'username',iconCls:'icon-man',iconWidth:38">
			        </div>
			        <div style="margin-bottom:20px">
			            <input class="easyui-textbox" id="loginPassword" type="password" name="password" style="width:100%;height:30px;padding:12px" data-options="prompt:'password',iconCls:'icon-lock',iconWidth:38">
			        </div>
			        <div>
			            <a href="javascript:;" onclick="$('#login').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
			                <span style="font-size:14px;">Login</span>
			            </a>
			        </div>
			    </form>
			    <%
		        	String loginFail = (String) session.getAttribute("loginFail");
		        	
		        	if(loginFail!=null && !"".equals(loginFail))
		        	{
		        		if(loginFail.equals("failure"))
		        		{
		        %>
		         			<div>
		         				<p style="color: red">Wrong Account/Password</p>
		         			</div>
		        <%
		         		}
		         	}
		        %>
		        		    <p>Test account </p>
		    <p>User: test</p>
		    <p>Pass: test</p>
		    </div>

		</div>
	</body>
</html>