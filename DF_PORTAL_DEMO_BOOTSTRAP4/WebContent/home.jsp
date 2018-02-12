<%@ page language="java" contentType="text/html; charset=TIS620" import="com.depthfirst.framework.ums.web.*" pageEncoding="TIS620"%><%
try {
	UserSession userSession = (UserSession)session.getAttribute(UserSession.SESSION_KEY);
	if(userSession == null) {
		response.sendRedirect(request.getContextPath()+"/");
		return;
	}else userSession.setCurrentPage(new PageInfo("หน้าแรก"));
}catch(Exception e){ e.printStackTrace(); }
%><%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>
<%@ include file="/include/_headermenu.jsp" %>
<br/><br/>
<%@ include file="/include/_footermenu.jsp" %>
