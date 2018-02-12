<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%!
String homeName = "Notification";
%><%@ include file="/include/_home.jsp" %><%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp"%>
<nested:form action="<%= (String)request.getAttribute(com.depthfirst.framework.struts.BaseAction.ACTION_PATH) %>">
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<nested:notEmpty property="searchResult.data">
<table border="0" width="95%" align="center">
<tr><% String thOrderBy[][] = { { "วันที่/เวลา", "o.lastUpdDate" }, { "หัวข้อ", "o.topic" }, { "รายละเอียด", "o.message" }
}; %><%@ include file="/include/_thorderby.jsp"%>
	<th width="8%">&nbsp;</th>
</tr>
<nested:iterate property="searchResult.data" id="result" indexId="ind"><tr class="tr<%= ind.intValue()%2 %>">
	<td><nested:write name="result" property="lastUpdDateStr" /></td>
	<td><nested:write name="result" property="topic" /></td>
	<td><nested:write name="result" property="message" /></td>
	<td align="center" nowrap="nowrap">&nbsp;<a href="<%= ctxPath %><nested:write name="result" property="actionUrl" />">
		<img src="<%= request.getContextPath() %>/images/icon_view.png" border="0" title="ดูข้อมูล" /></a>&nbsp; 
	</td>
</tr></nested:iterate>
</table>
<%@ include file="/include/_cursor.jsp"%>
</nested:notEmpty>

<nested:empty property="searchResult.data"><nested:equal property="searchResult.processed" value="true">
	<center class="error">ไม่พบข้อมูลแจ้งเตือน</center></nested:equal></nested:empty>

<nested:equal property="canCreate" value="true"><br/><center>
	<input type="button" value=" เพิ่มข้อมูล " onclick="doCmd('goCreate')" /></center></nested:equal>


</nested:form>

<%@ include file="/include/_footermenu.jsp"%>
