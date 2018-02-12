<%@ page language="java"  contentType="text/html; charset=TIS620"  session="true"%>
<html>
<head>
<%String ctxPath= request.getContextPath(); %>
<script language="javascript">
	alert('ไม่ได้ใช้งานในเวลาที่กำหนด!!! \n กรุณา login ใหม่');
   	window.location.href="<%=ctxPath%>/index.jsp";
</script>
<title> Error 401 - Depth First Co., Ltd. </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="<%= request.getContextPath() %>/css/style.css" type="text/css" rel="stylesheet">
</head>
<body bgcolor="#ffffff">
<table border="0" width="500">
<tr><td class="perror">Unauthorized (401)</td></tr>
<tr><td>
	You have requested data that requires authorization to access. Either your authorization was rejected or you need to authenticate yourself before you proceed.
</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td align="center">
	<input type="button" value=" Back " onClick="window.history.back()">
</td></tr>
</table>
</body>
</html>