<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%@ include file="_authorized.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test DWR</title>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/interface/UserSessionService.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/util.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/engine.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/dwr.js"></script>
<script language="JavaScript">
<!--
var ctxPath= "<%= request.getContextPath() %>";
function testGetLogin() {
	UserSessionService.getLogin({
		callback: function(login) {
			alert(login);
		},
		errorHandler: userSessionErrorHandler
	});
}
function testGetLoginAsync() {
	var test = null;
	UserSessionService.getLogin({
		callback: function(login) {
			test = login;
		},
		async: false,
		errorHandler: userSessionErrorHandler
	});
	return test;
}
// -->
</script>
</head>

<body>
<input type="button" value=" getLogin " onclick="testGetLogin()"  />
<input type="button" value=" getLoginAsync " onclick="alert(testGetLoginAsync())"  />
</body>
</html>