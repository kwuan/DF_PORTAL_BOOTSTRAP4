<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headerpopup.jsp" %>
<script language="JavaScript">
<!--
window.onunload = function init() {
	if(window.opener!=null && window.opener.doImportReload!=null) window.opener.doImportReload();
}
// -->
</script>

<nested:form action="<%= (String)request.getAttribute(com.depthfirst.framework.struts.BaseAction.ACTION_PATH) %>">
<input type="hidden" name="cmd" value="" />

<nested:notPresent property="importResultBean">
<br/><center class="error">ไฟล์ข้อมูลไม่ถูกต้อง</center><br/>
</nested:notPresent>
<nested:present property="importResultBean">

<nested:notEqual property="importResultBean.sumError" value="0">
<br/><center class="error">พบข้อผิดพลาดในการนำเข้าข้อมูล "ข้อมูลทั้งหมดไม่ถูกนำเข้า"</center><br/>
<nested:iterate property="importResultBean.resultDataList" indexId="dataInd"><table border="0" width="80%" align="center">
<tr class="trlabel"><td colspan="2">ข้อมูล <nested:write property="name" />
	 พบข้อผิดพลาด <nested:write property="error" /> รายการ
	 จากทั้งหมด <nested:write property="total" /> รายการ</td></tr>
<tr><th width="10%">รายการที่</th><th width="90%">ข้อผิดพลาด</th></tr>
<nested:iterate property="errorRecordList" indexId="recInd"><tr class="tr<%= recInd.intValue()%2 %>">
	<td><nested:write property="recordNo" /></td>
	<td><nested:write property="errorStr" /></td>
</tr></nested:iterate>
</table><br/></nested:iterate>
</nested:notEqual>

<nested:equal property="importResultBean.sumError" value="0">
<br/><center class="info">การนำเข้าข้อมูลเสร็จสมบูรณ์</center><br/>
<table border="0" width="60%" align="center">
<tr><th width="70%">ข้อมูลที่นำเข้า</th><th width="30%">จำนวนรายการ</th></tr>
<nested:iterate property="importResultBean.resultDataList" indexId="dataInd"><tr class="tr<%= dataInd.intValue()%2 %>">
	<td><nested:write property="name" /></td>
	<td align="right"><nested:write property="total" /></td>
</tr></nested:iterate>
</table>
</nested:equal>

</nested:present>

<br/><center><input type="button" value=" ปิดหน้าต่าง " onclick="window.close()" /></center>

</nested:form>

<%@ include file="/include/_footerpopup.jsp" %>
