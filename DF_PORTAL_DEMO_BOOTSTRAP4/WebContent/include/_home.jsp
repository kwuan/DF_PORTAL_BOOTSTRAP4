<%
try {
	com.depthfirst.framework.ums.web.UserSession _userSession = (com.depthfirst.framework.ums.web.UserSession)
			session.getAttribute(com.depthfirst.framework.ums.web.UserSession.SESSION_KEY);
	if(_userSession == null) {
		response.sendRedirect(request.getContextPath()+"/");
		return;
	}else _userSession.setCurrentPage(new com.depthfirst.framework.ums.web.PageInfo(homeName));
}catch(Exception _e){ _e.printStackTrace(); }
%>