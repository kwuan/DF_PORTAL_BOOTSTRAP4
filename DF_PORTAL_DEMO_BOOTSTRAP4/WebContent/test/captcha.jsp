<%@ page language="java" import="com.depthfirst.product.km.web.JCaptchaImageServlet" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%!
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title> Test Captcha </title>
</head>

<body bgcolor="#ffffff">
<form method="post">
<table border="0"><tr><th bgcolor="#aaaaff" colspan="2">Test Captcha</th></tr>
<tr><td colspan="2" align="center"><img src="<%= request.getContextPath() %>/captcha" onclick="this.src='<%= request.getContextPath() %>/captcha?ts='+(new Date()).getTime();" /></td></tr><%
String val = request.getParameter("val");
%><tr><td>Test : </td><td><input type="text" name="val" size="50" /></td></tr>
<tr><td colspan="2"><input type="submit" name="doExec" value=" Test " /></td></tr>
</table>

<% if(request.getParameter("doExec")!=null && val!=null) {
%><br/><b>Result: </b><%= JCaptchaImageServlet.validateCaptcha(session, val) %><% } %>
</form>
</body>
</html>
