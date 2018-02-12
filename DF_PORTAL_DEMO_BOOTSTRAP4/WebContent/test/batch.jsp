<%@ page language="java" import="java.util.*,com.depthfirst.framework.webservice.*,org.springframework.web.context.support.WebApplicationContextUtils,org.springframework.context.ApplicationContext" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%
ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
Map processMap = applicationContext.getBeansOfType(IProcessService.class);
String pnames[] = (String[])processMap.keySet().toArray(new String[]{});

int nparam = 0;
try{ nparam = Integer.parseInt(request.getParameter("nparam")); }catch(Exception e){}
if(request.getParameter("addParam") != null) nparam++;
if(request.getParameter("clearParam") != null) nparam = 0;

ServiceResult result = null;
if(request.getParameter("doTest") != null) {
	HashMap paramMap = new HashMap();
	for(int p=0; p<nparam; p++) {
		String name = request.getParameter("param."+p+".name");
		String value = request.getParameter("param."+p+".value");
		if(name!=null && !name.trim().equals("") && value!=null && !value.trim().equals("")) paramMap.put(name, value);
	}
	result = ((IProcessService)processMap.get(request.getParameter("processName"))).process(paramMap);
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title> Test Batch Process Service </title>
<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/css/css0.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#ffffff">
<form method="post">
<table border="0" width="40%">
<tr><th colspan="2">Batch Process Service</th></tr>
<tr class="trform"><td colspan="2">Service <select name="processName" onchange="this.form.submit()">
	<% for(int p=0; p<pnames.length; p++) {
	%><option value="<%= pnames[p] %>"<%= pnames[p].equals(request.getParameter("processName"))?" selected":"" %>><%= pnames[p] %></option><% } %>
</select>
</td></tr>
<tr><th>Parameter Name</th><th>Parameter Value</th></tr>
<input type="hidden" name="nparam" value="<%= nparam %>">
<% for(int i=0; i<nparam; i++) { 
	String name = request.getParameter("param."+i+".name");
	String value = request.getParameter("param."+i+".value");
%><tr class="trform">
	<td><input name="param.<%= i %>.name" value="<%= name!=null?name:"" %>" /></td>
	<td><input name="param.<%= i %>.value" value="<%= value!=null?value:"" %>" /></td>
</tr><% } %>
<% if(result != null) { %><tr><th colspan="2">Test Result</th></tr><tr class="trform"><td colspan="2"><pre><%= result %></pre></td></tr><% } %>
<tr><td colspan="2">
<input type="submit" name="doTest" value=" Test " />
<input type="submit" name="addParam" value=" Add Parameter " />
<input type="submit" name="clearParam" value=" Clear Parameter " />
</td></tr>
</table>
</form>
</body>
</html>
