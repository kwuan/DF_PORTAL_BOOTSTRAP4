<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp"%>
<nested:form action="<%= (String)request.getAttribute(com.depthfirst.framework.struts.BaseAction.ACTION_PATH) %>">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="lookupName" property="lookupName" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<table border="0" width="60%" align="center">
<tr>
	<th colspan="2">ค้นหาข้อมูล<%= lookupName %></th>
</tr>
<tr class="trform">
	<td width="30%">รหัส<%= lookupName %> : </td>
	<td width="70%"><nested:text property="searchCondition.value" /></td>
</tr>
<tr class="trform">
	<td>ชื่อ<%= lookupName %> : </td>
	<td><nested:text property="searchCondition.label" /></td>
</tr>
<tr class="trform">
	<td>สถานะ : </td>
	<td><nested:select property="searchCondition.isActive" lang="property['สถานะ',,]">
		<option value="">ทั้งหมด</option>
		<nested:optionsCollection property="isActiveList" />
	</nested:select></td>
</tr>
<tr>
	<td colspan="2"><input type="button" value=" ค้นหา "onclick="doGoto(0)" /> 
		<input type="button" value=" เริ่มค้นหาใหม่ " onclick="doCmd('listAll')" />  
	</td>
</tr>
</table>

<nested:notEmpty property="searchResult.data">
<table border="0" width="95%" align="center">
<tr><% String thOrderBy[][] = { { "รหัส"+lookupName, "o.value" }, { "ชื่อ"+lookupName, "o.label" },
	{ "สถานะ", "o.isActive" } }; %><%@ include file="/include/_thorderby.jsp"%>
	<th width="8%">&nbsp;</th>
</tr>
<nested:iterate property="searchResult.data" id="result" indexId="ind"><tr class="tr<%= ind.intValue()%2 %>">
	<td><nested:write name="result" property="value" /></td>
	<td><nested:write name="result" property="label" /></td>
	<td><nested:write name="result" property="isActiveLabel" /></td>
	<td align="center" nowrap="nowrap">&nbsp;<a href="javascript:doCmd('goView', <%= ind %>)">
		<img src="<%= request.getContextPath() %>/images/icon_view.png" border="0" title="ดูข้อมูล" /></a>&nbsp; 
		<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">&nbsp;
			<a href="javascript:doCmd('goUpdate', <%= ind %>)">
				<img src="<%= request.getContextPath() %>/images/icon_edit.png" border="0" title="แก้ไข" /></a>&nbsp;</nested:equal> 
	</td>
</tr></nested:iterate>
</table>
<%@ include file="/include/_cursor.jsp"%>
</nested:notEmpty>

<nested:empty property="searchResult.data"><nested:equal property="searchResult.processed" value="true">
	<center class="error">ไม่พบข้อมูลตามเงื่อนไข</center></nested:equal></nested:empty>

<nested:equal property="canCreate" value="true"><br/><center>
	<input type="button" value=" เพิ่มข้อมูล " onclick="doCmd('goCreate')" /></center></nested:equal>


</nested:form>
<%@ include file="/include/_footermenu.jsp"%>
