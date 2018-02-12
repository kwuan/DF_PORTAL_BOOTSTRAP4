<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%
String ctxPath = request.getContextPath();
long random = (new java.util.Date()).getTime();
if(com.depthfirst.framework.ums.struts.CookiesLoginAction.hasLoginCookies(request)) {
	response.sendRedirect(ctxPath+"/login.do?ms="+random);
	return;
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title> DF Portal (trial): Depth First Co., Ltd. </title>
<script language="JavaScript">
<!--
var ctxPath = "<%= ctxPath %>";
// -->
setTimeout(function() { document.getElementById('loginField').focus(); }, 10);
</script>
<script language="JavaScript" src="<%= ctxPath %>/js/win.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/util.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/struts.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/popupCalendar.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/validateForm.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/validateDate.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/validateNumber.js"></script>
<!--style for login page only-->
<style>
body {
	background:url(<%= ctxPath %>/portal_back/images/bg_login.jpg) no-repeat top center;
	margin:0;
	padding:0;
	color:#333333;
	font: 13px/1.3em Arial, Tahoma, Verdana;
}
.form-login {
	background:url(<%= ctxPath %>/portal_back/images/form_login.png) no-repeat;
	height:310px;
	width:938px;
	margin:160px auto 0px;
	position:relative;
}
.form-table {
	margin-top:116px;
	position:absolute;
	right:0;
	width:280px;
}
.form-table td {
	padding: 2px 0 5px;
}
.form-table input[type="text"],  .form-table input[type="password"] {
	border:none;
	background:url(<%= ctxPath %>/portal_back/images/bg_field.png) no-repeat;
	height:33px;
	width:200px;
	line-height:33px;
	padding: 0 4px;
}
.form-table input:focus {
	outline:none;
}
.form-table input[type="submit"] {
	background:url(<%= ctxPath %>/portal_back/images/btn_login.png) no-repeat; height:30px; width:86px;
	border:none;
	cursor:pointer;
}
.form-table input[type="submit"]:hover {
	background-position:0px -30px;
}
.form-table input[type="button"] {
	background:url(<%= ctxPath %>/portal_back/images/btn_index.png) no-repeat; height:30px; width:114px;
	border:none;
	cursor:pointer;
}
.form-table input[type="button"]:hover {
	background-position:0px -30px;
}

.form-table a:link, .form-table a:active, .form-table a:visited { color:#FFF;}
.form-table a:hover{
	color:#bb0000;
}

ul{ text-align:center; list-style:none; font-size:12px;}
li{ display:block;}
</style>
</head>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<!-- deployDate[] -->
<nested:form action="/login">
<input type="hidden" name="cmd" value="doLogin" />
<nested:hidden property="urlToken" />

<div class="form-login">
	<div class="form-table">
		<table width="100%" >
			<tr>
				<td colspan="2"><input type="text" name="login" id="loginField"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="password" name="password"/></td>
			</tr>
			<tr><td colspan="2" style="font-size: 10pt; font-weight: bold; color: #EEEEEE;">
				<input type="checkbox" name="rememberLogin" value="Y" /> Remember
				<input type="submit" value="" />
			</td></tr>
		</table>
	</div> <!--end form-table-->
</div>
<!--form-login-->
	<ul><li>Depth First Co., Ltd. Copyright&copy;2557 All rights reserved.  </li></ul>
</nested:form>
<!-- Session Count[<%= com.depthfirst.framework.ums.web.UserSession.getSessionCount() %>] -->
<%@ include file="/include/_responseMessage.jsp" %><%@ include file="/include/_footer.jsp" %>
