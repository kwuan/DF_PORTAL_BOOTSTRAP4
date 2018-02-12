<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%!
public String getClasspath(Class cls) {
	return getClasspath(cls.getName());
}
public String getClasspath(String className) {
	java.net.URL url = getClass().getResource("/"+className.replace('.', '/')+".class");
	String path = url.getPath();
	return path.indexOf('!')>0?path.substring(0, path.indexOf('!')):path;
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title> Test Classpath </title>
</head>

<body bgcolor="#ffffff">
<form method="post">
<table border="0"><tr><th bgcolor="#aaaaff" colspan="2">Test Classpath</th></tr><%
String cname = request.getParameter("className");
%><tr><td>Class Name : </td><td><input type="text" name="className" size="50" value="<%= cname!=null?cname:"" %>" /></td></tr>
<tr><td colspan="2"><input type="submit" name="doExec" value=" Test " /></td></tr>
</table>

<% if(request.getParameter("doExec")!=null && cname!=null) {
	String cpath = getClasspath(cname);
%><br/><b>Result: </b><%= cpath %><% } %>
</form>
</body>
</html>
