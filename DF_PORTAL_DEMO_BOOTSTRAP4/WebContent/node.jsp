<%@ page language="java" contentType="text/html; charset=TIS620" import="com.depthfirst.framework.ums.web.*" pageEncoding="TIS620"%><%
try {
	UserSession userSession = (UserSession)session.getAttribute(UserSession.SESSION_KEY);
	if(userSession != null) userSession.setCurrentPage(new PageInfo("เลือกสังกัดในการใช้ระบบ"));
}catch(Exception e){ e.printStackTrace(); }
%><%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%><%@ include file="/include/_headermenu.jsp" %>

<form action="<%= request.getContextPath() %>/login.do" method="post">
<input type="hidden" name="cmd" value="" />
<table border="0" align="center">
<tr class="trform">
  <td>สังกัดในการใช้ระบบ</td>
  <td><nested:select name="<%= UserSession.SESSION_KEY %>" property="orgId">
  	<nested:optionsCollection name="<%= UserSession.SESSION_KEY %>" property="nodeLabelValueBeans" />
  </nested:select> <input type="button" value=" ตกลง " onclick="doCmd('doSetNode')" /></td></tr>
</table>
</form>

<%@ include file="/include/_footermenu.jsp" %>
