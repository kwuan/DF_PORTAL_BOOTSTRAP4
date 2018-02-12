<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/user">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />

<table border="0" width="80%" align="center">
<tr><th colspan="4">��˹����ʼ�ҹ</th></tr>
<tr class="trform">
	<td width="30%">���ʼ����</td>
	<td width="70%"><nested:write property="formData.login" /></td>
</tr>
<tr class="trform">
	<td>���ʼ�ҹ</td>
	<td><nested:password property="password1" size="20" maxlength="20" lang="property['���ʼ�ҹ',required,6,15,isPasswordChars]" />
		<input type="button" value="�������ʼ�ҹ" onclick="setRandomPassword(this.form)" /></td>
</tr>
<tr class="trform">
	<td>�׹�ѹ���ʼ�ҹ</td>
	<td><nested:password property="password2" size="20" maxlength="20" lang="property['�׹�ѹ���ʼ�ҹ',required,6,15,isConfirmPassword]" /></td>
</tr>
<tr><td colspan="4">
	<input type="button" value=" �ѹ�֡ " onclick="if(validateForm(this.form)) doCmd('setPassword')" />
	<input type="button" value=" ¡��ԡ " onclick="doCmd('list')" />
</td></tr>
</table>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
