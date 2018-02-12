<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headerpopup.jsp" %>

<script language="JavaScript">
<!--
function doSelect(form) {
	var val = getCheckboxValues(form.elements['page_code']);
	if(val == "") { alert('กรุณาเลือกหน้าจอ'); return; }
	if(window.opener!=null && window.opener.doAddPage!=null) window.opener.doAddPage(val);
	else alert(val);
	window.close();
}
// -->
</script>

<nested:form action="/ums/role">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="listModulePage" />

<table border="0" width="80%" align="center">
<tr class="trform">
	<td>ระบบงาน</td>
	<td><nested:select property="moduleId" onchange="this.form.submit()">
		<option value=""></option>
		<nested:optionsCollection property="moduleList" label="name" value="id"/>
	</nested:select></td>
</tr>
</table>

<br/>

<nested:notEmpty property="modulePageList">
<table border="0" width="95%" align="center">
<tr>
<th width="2%"><input type="checkbox" name="all_page" onclick="doCheckAll(this.form, 'all_page', 'page_code')" /></th>
<th width="2%">&nbsp;</th>
<th>ประเภทหน้าจอ</th>
<th>รหัสหน้าจอ</th>
<th>ชื่อหน้าจอ</th>
</tr>
<nested:iterate property="modulePageList" id="result" indexId="ind">
<tr class="tr<%= ind.intValue()%2 %>">
	<td align="center"><input type="checkbox" name="page_code" onclick="doCheckId(this.form, 'all_page', 'page_code')" value="<nested:write name="result" property="code" />" /></td>
	<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+1 %>&nbsp;</td>
	<td><nested:write name="result" property="pageType.name" /></td>
	<td><nested:write name="result" property="code" /></td>
	<td><nested:write name="result" property="name" /></td>
</tr>
</nested:iterate>
<tr><td colspan="10">
	<input type="button" value="เลือกหน้าจอ" onclick="doSelect(this.form)" />
	<input type="button" value="ยกเลิก" onclick="window.close()" />
</td></tr>
</table>
</nested:notEmpty>

</nested:form>

<%@ include file="/include/_footerpopup.jsp" %>
