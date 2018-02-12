<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ include file="/include/_headermenu.jsp" %>

<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>
<nested:form action="<%= (String)request.getAttribute(com.depthfirst.framework.struts.BaseAction.ACTION_PATH) %>">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="lookupName" property="lookupName" type="String" />
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />

<table border="0" width="60%" align="center">
<tr><th colspan="2"><nested:write property="formModeStr" /><%= lookupName %></th></tr>

<tr class="trform">
	<td>รหัส<%= lookupName %> : </td>
	<td><nested:text property="formData.value" size="5" maxlength="5" lang="property['รหัส',required,,5]" disabled="<%= !editable.booleanValue() %>" /></td>
</tr>

<tr class="trform">
	<td>ชื่อ<%= lookupName %> : </td>
	<td><nested:text property="formData.label" size="50" maxlength="200" lang="property['ชื่อ',required,,200]" disabled="<%= !editable.booleanValue() %>" /></td>
</tr>

<tr class="trform">
	<td>สถานะ : </td>
	<td><nested:select property="formData.isActive" lang="property['สถานะ',required,]" disabled="<%= !editable.booleanValue() %>">
		<nested:optionsCollection property="isActiveList" />
	</nested:select></td>
</tr>
<tr class="trform">
	<td>ลำดับ : </td>
	<td><nested:text property="formData.order" size="5" maxlength="5" lang="property['ลำดับ',required,,5,isInt]" disabled="<%= !editable.booleanValue() %>" /></td>
</tr>

<tr><td colspan="2">
	<nested:equal property="editable" value="true"><input type="button" value=" บันทึก " onclick="doCmd('doSave')" /></nested:equal>
	<input type="button" value=" กลับไป " onclick="doCmd('list')" />
</td></tr>
</table>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
