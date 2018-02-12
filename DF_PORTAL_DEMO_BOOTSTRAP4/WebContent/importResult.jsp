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
<br/><center class="error">�����������١��ͧ</center><br/>
</nested:notPresent>
<nested:present property="importResultBean">

<nested:notEqual property="importResultBean.sumError" value="0">
<br/><center class="error">����ͼԴ��Ҵ㹡�ù���Ң����� "�����ŷ��������١�����"</center><br/>
<nested:iterate property="importResultBean.resultDataList" indexId="dataInd"><table border="0" width="80%" align="center">
<tr class="trlabel"><td colspan="2">������ <nested:write property="name" />
	 ����ͼԴ��Ҵ <nested:write property="error" /> ��¡��
	 �ҡ������ <nested:write property="total" /> ��¡��</td></tr>
<tr><th width="10%">��¡�÷��</th><th width="90%">��ͼԴ��Ҵ</th></tr>
<nested:iterate property="errorRecordList" indexId="recInd"><tr class="tr<%= recInd.intValue()%2 %>">
	<td><nested:write property="recordNo" /></td>
	<td><nested:write property="errorStr" /></td>
</tr></nested:iterate>
</table><br/></nested:iterate>
</nested:notEqual>

<nested:equal property="importResultBean.sumError" value="0">
<br/><center class="info">��ù���Ң�������������ó�</center><br/>
<table border="0" width="60%" align="center">
<tr><th width="70%">�����ŷ������</th><th width="30%">�ӹǹ��¡��</th></tr>
<nested:iterate property="importResultBean.resultDataList" indexId="dataInd"><tr class="tr<%= dataInd.intValue()%2 %>">
	<td><nested:write property="name" /></td>
	<td align="right"><nested:write property="total" /></td>
</tr></nested:iterate>
</table>
</nested:equal>

</nested:present>

<br/><center><input type="button" value=" �Դ˹�ҵ�ҧ " onclick="window.close()" /></center>

</nested:form>

<%@ include file="/include/_footerpopup.jsp" %>
