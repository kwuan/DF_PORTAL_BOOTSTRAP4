<%@ page language="java" contentType="text/html; charset=TIS620" import="com.depthfirst.framework.ums.web.*" pageEncoding="TIS620"%><%
UserSession userSession = (UserSession)session.getAttribute(UserSession.SESSION_KEY);
%><%@ include file="/include/_headerpopup.jsp" %>

<form action="<%= request.getContextPath() %>/login.do" method="post">
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="passwordForward" value="passwordExpired" />
<table border="0" align="center">
<tr class="trform">
  <td>���ʼ����</td>
  <td><%= userSession.getLogin() %></td>
</tr>
<tr class="trform">
  <td>���ʼ�ҹ���</td>
  <td><input type="password" name="password0" size="20" maxlength="20" lang="property['���ʼ�ҹ���',required,6,15,isPasswordChars]" /></td>
</tr>
<tr class="trform">
  <td>���ʼ�ҹ����</td>
  <td><input type="password" name="password1" size="20" maxlength="20" lang="property['���ʼ�ҹ����',required,6,15,isPasswordChars]" />
	<input type="button" value="�������ʼ�ҹ" onclick="setRandomPassword(this.form)" /></td>
</tr>
<tr class="trform">
  <td>�׹�ѹ���ʼ�ҹ</td>
  <td><input type="password" name="password2" size="20" maxlength="20" lang="property['�׹�ѹ���ʼ�ҹ',required,6,15,isConfirmPassword]" /></td>
</tr>
<tr><td colspan="2"><input type="button" value=" �ѹ�֡ " onclick="if(validateForm(this.form)) doCmd('doSavePassword')" />
	<input type="button" value=" ¡��ԡ " onclick="doCmd('doLogout')" /></td></tr>
</table>
</form>

<%@ include file="/include/_footerpopup.jsp" %>
