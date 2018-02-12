<%@ page import="com.depthfirst.framework.ums.web.*,org.springframework.context.*,org.springframework.web.context.support.*,com.depthfirst.framework.ums.service.*,com.depthfirst.framework.ums.domain.*" language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%
ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
IUserManagementService ums = (IUserManagementService)applicationContext.getBean("UserManagementService");

UserSession user = (UserSession)session.getAttribute(UserSession.SESSION_KEY);
if(request.getParameter("doClear") != null) session.setAttribute(UserSession.SESSION_KEY, user=null);
if(request.getParameter("doAdd")!=null || request.getParameter("doAll")!=null) {
	if(user == null) {
		user = new UserSession();
		user.setLogin("test");
		user.setRealName("ทดสอบระบบ");
		user.setPosition("เจ้าหน้าที่ทดสอบระบบ");
		user.setIpAddress(request.getRemoteAddr());
		session.setAttribute(UserSession.SESSION_KEY, user);
	}
	if(request.getParameter("doAdd") != null) {
		int right = 0;
		String rvals[] = request.getParameterValues("right");
		for(int i=0; rvals!=null && i<rvals.length; i++) right = right|Integer.parseInt(rvals[i]);
		user.addRight(request.getParameter("code"), right);
	}
	if(request.getParameter("doAll") != null) {
		int right = 0;
		for(int i=0; i<UserSession.RIGHTS.length; i++) right = right|UserSession.RIGHTS[i];
		UmsPage pages[] = (UmsPage[])ums.listBaseDomain(UmsPage.class).toArray(new UmsPage[]{});
		for(int p=0; p<pages.length; p++) user.addRight(pages[p].getCode(), right);
	}

	ums.loadMenuItems(user);
}

if(user!=null && request.getParameter("doSetPerType")!=null) {
	int ptRight = 0;
	String rvals[] = request.getParameterValues("ptRight");
	for(int i=0; rvals!=null && i<rvals.length; i++) ptRight = ptRight|Integer.parseInt(rvals[i]);
	user.setPersonTypeRight(ptRight);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.depthfirst.framework.web.UmsActionServletContextListener"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title>Test Right</title>
<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/css/css0.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%= request.getContextPath() %>/js/struts.js"></script>
</head>

<body>
<form method="post" action="<%= request.getContextPath() %>/test/right.jsp">
<table border="0" width="60%">
<tr><th colspan="2">Test Right</th></tr>
<tr class="trform">
	<td>UserSession</td>
	<td><% if(user != null) { %><textarea rows="10" cols="100" readonly="readonly"><%= user %></textarea><% } %></td>
</tr>
<tr class="trform">
	<td>Code</td>
	<td><input type="text" name="code" value="UMS001" size="5" /></td>
</tr>
<tr class="trform">
	<td>Right</td>
	<td><% for(int i=0; i<UserSession.RIGHTS.length; i++) {
		%><input type="checkbox" name="right" value="<%= UserSession.RIGHTS[i] %>" /><%= UserSession.RIGHT_LABELS[i] %><% } %></td>
</tr>
<tr><td colspan="2">
	<input type="submit" name="doAdd" value=" Add " />
	<input type="submit" name="doClear" value=" Clear " />
	<input type="submit" name="doAll" value=" All " />
	<a href="<%= request.getContextPath() %>/home.jsp?random=<%= new java.util.Date().getTime() %>">Home</a>
	<a href="<%= request.getContextPath() %>/index.jsp?random=<%= new java.util.Date().getTime() %>">Login</a>
</td></tr>
</table>
</form>
</body>
</html>
