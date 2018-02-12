<%@ page language="java" contentType="text/html" session="true"%>
<html>
<head>
<title> Error 500 - Depth First Co., Ltd. </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="<%= request.getContextPath() %>/css/style.css" type="text/css" rel="stylesheet">
</head>
<body bgcolor="#ffffff">
<table border="0" width="500">
<tr><td class="perror">Internal Server Error ( 500 )</td></tr>
<tr><td>
<!--	The server has encountered an unexpected error which is preventing it from fullfilling your request.-->
ระบบไม่สามารถติดต่อฐานข้อมูลได้ กดปุ่ม Refresh หรือ F5
</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td align="center">
	<input type="button" value=" Back " onClick="window.history.back()">
</td></tr>
</table>
</body>
</html>