<%@ page language="java" contentType="text/html" isErrorPage="true" %><%
org.apache.log4j.Logger logger = org.apache.log4j.LogManager.getLogger( "com.depthfirst.error" );
if(exception == null) exception = (Throwable)request.getAttribute("javax.servlet.error.exception");
String uri = (String)request.getAttribute("javax.servlet.error.request_uri");
String emsg = (String)request.getAttribute("javax.servlet.error.message");
logger.error(emsg+"["+uri+"]", exception);
%><html>
<head>
<title> Error - Depth First Co., Ltd. </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="<%= request.getContextPath() %>/css/style.css" type="text/css" rel="stylesheet">
<script language="JavaScript">
<!--
function toggleShowHide(id) {
	var el = document.getElementById(id);
	if(el != null) el.style.display = el.style.display=='none'?'block':'none';
}
// -->
</script>
</head>

<body bgcolor="#ffffff">
<table border="0" width="100%">
<tr><td class="perror">Error</td></tr>
<tr><td>&nbsp;</td></tr>
<% if(uri != null) { %><tr><td>URI : <%= uri %></td></tr><% } %>
<% if(emsg != null) { %><tr><td>Message : <%= emsg %>
	<% if(exception != null) { %>[<a href="javascript:toggleShowHide('etab')"><%= exception %></a>]<% } %></td></tr><% } %>
<% if(exception != null) { %><tbody id="etab" style="display:none">
<tr><td>&nbsp;</td></tr>
<tr><td><pre><% exception.printStackTrace(new java.io.PrintWriter(out)); %></pre></td></tr>
</tbody><% } %>
<tr><td>&nbsp;</td></tr>
<tr><td align="center">
	<input type="button" value=" Reload " onClick="document.location.reload(document.location.href)">
</td></tr>
</table>
</body>
</html>