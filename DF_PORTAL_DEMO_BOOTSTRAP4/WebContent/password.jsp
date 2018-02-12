<%@ page language="java" contentType="text/html; charset=TIS620" import="com.depthfirst.framework.ums.web.*" pageEncoding="TIS620"%><%
try {
	UserSession userSession = (UserSession)session.getAttribute(UserSession.SESSION_KEY);
	if(userSession == null) {
		response.sendRedirect(request.getContextPath()+"/");
		return;
	}else userSession.setCurrentPage(new PageInfo("เปลี่ยนรหัสผ่าน"));
}catch(Exception e){ e.printStackTrace(); }
%><%@ include file="/include/_headermenu.jsp" %>

<form action="<%= request.getContextPath() %>/login.do" method="post">
<input type="hidden" name="cmd" value="" />
<table border="0" align="center">
<tr class="trform">
  <td>รหัสผ่านเดิม</td>
  <td><input type="password" name="password0" size="20" maxlength="20" lang="property['รหัสผ่านเดิม',required,6,15,isPasswordChars]" />
    <font color="red">*</font></td>
</tr>
<tr class="trform">
  <td>รหัสผ่านใหม่</td>
  <td><input type="password" name="password1" size="20" maxlength="20" lang="property['รหัสผ่านใหม่',required,6,15,isPasswordChars]" />
    <font color="red">*</font> <input type="button" value="สุ่มรหัสผ่าน" onclick="setRandomPassword(this.form)" /></td>
</tr>
<tr class="trform">
  <td>ยืนยันรหัสผ่าน</td>
  <td><input type="password" name="password2" size="20" maxlength="20" lang="property['ยืนยันรหัสผ่าน',required,6,15,isConfirmPassword]" />
    <font color="red">*</font></td>
</tr>
<tr><td colspan="2"><input type="button" value=" บันทึก " onclick="if(validateForm(this.form)) doCmd('doSavePassword')" /></td></tr>
</table>
</form>

<%@ include file="/include/_footermenu.jsp" %>
