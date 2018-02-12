<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%
String serviceName = request.getParameter("serviceName");
String mailTo = request.getParameter("mailTo");
String mailSubject = request.getParameter("mailSubject");
String mailMsg = request.getParameter("mailMsg");
if(request.getParameter("doTest") != null) {
	IMailService service = (IMailService)WebApplicationContextUtils.getWebApplicationContext(getServletContext()).getBean(serviceName);
	try {
		service.sendMessage(null, mailTo, null, null, mailSubject, mailMsg, null);
	}catch(Exception e) {
		e.printStackTrace();
	}
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils,com.depthfirst.framework.service.IMailService"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title> Test E-Mail </title>
</head>

<body bgcolor="#ffffff">
<form method="post">
<table border="0"><tr><th bgcolor="#aaaaff" colspan="2">Test E-Mail</th></tr>
<tr><td>serviceName : </td><td><input type="text" name="serviceName" size="50" value="<%= serviceName!=null?serviceName:"MailService" %>" /></td></tr>
<tr><td>mailTo : </td><td><input type="text" name="mailTo" size="50" value="<%= mailTo!=null?mailTo:"" %>" /></td></tr>
<tr><td>mailSubject : </td><td><input type="text" name="mailSubject" size="50" value="<%= mailSubject!=null?mailSubject:"Test E-Mail" %>" /></td></tr>
<tr><td>mailMsg : </td><td><textarea name="mailMsg" rows="5" cols="50"><%= mailMsg!=null?mailMsg:"Hello World" %></textarea></td></tr>
<tr><td colspan="2"><input type="submit" name="doTest" value=" Test " /></td></tr>
</table>
</form>
</body>
</html>
