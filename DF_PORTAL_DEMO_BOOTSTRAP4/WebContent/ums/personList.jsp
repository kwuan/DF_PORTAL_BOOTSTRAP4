<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<script language="JavaScript">
<!--
function doSelect(psnId) {
	if(window.opener!=null && window.opener.setPerson!=null) {
		window.opener.setPerson(psnId);
		window.close();
	}else alert(psnId);
}
// -->
</script>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headerpopup.jsp" %>
<nested:form action="/ums/person">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />

<br/>

<nested:notEmpty property="searchResult.data">
<table border="0" width="95%" align="center">
<tr>
<th width="2%">&nbsp;</th>
<th width="10%">รหัสประจำตัว</th>
<th width="40%">ชื่อ-นามสกุล</th>
<th width="25%">ตำแหน่ง</th>
<th width="25%">ประเภท</th>
</tr>
<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
<nested:iterate property="searchResult.data" id="result" indexId="ind">
<tr class="tr<%= ind.intValue()%2 %>">
	<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
	<td><a href="javascript:doSelect('<nested:write name="result" property="psnId" />')">
		<nested:write name="result" property="psnId" /></a></td>
	<td><nested:write name="result" property="firstName" />
		<nested:write name="result" property="lastName" /></td>
	<td><nested:write name="result" property="position" /></td>
	<td><nested:write name="result" property="psnType" /></td>
</tr>
</nested:iterate>
</table>
<%@ include file="/include/_cursor.jsp" %>
</nested:notEmpty>

</nested:form>

<%@ include file="/include/_footerpopup.jsp" %>
