<%@ page import="java.util.*,org.springframework.context.*,org.springframework.web.context.support.*,com.depthfirst.framework.dao.*,com.depthfirst.framework.ums.service.*,com.depthfirst.framework.ums.domain.*,com.depthfirst.framework.ums.web.*" language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%
ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
IUserManagementService ums = (IUserManagementService)applicationContext.getBean("UserManagementService");
IBaseDomainDAO dao = (IBaseDomainDAO)applicationContext.getBean("baseDomainDAO");

UserSession user = (UserSession)session.getAttribute(UserSession.SESSION_KEY);
if(request.getParameter("doModuleRolePrivilege") != null) {
	int right = 0;
	for(int i=0; i<UserSession.RIGHTS.length; i++) right = right|UserSession.RIGHTS[i];
	UmsModule modules[] = (UmsModule[])ums.listBaseDomain(UmsModule.class).toArray(new UmsModule[]{});
	UmsRole roles[] = (UmsRole[])ums.listBaseDomain(UmsRole.class).toArray(new UmsRole[]{});
	for(int r=0; r<roles.length; r++) {
		UmsPage pages[] = null;
		if("ALL".equals(roles[r].getCode())) {
			pages = (UmsPage[])ums.listBaseDomain(UmsPage.class).toArray(new UmsPage[]{});
		}else {
			for(int m=0; m<modules.length; m++) if(modules[m].getCode().equals(roles[r].getCode())) {
				pages = (UmsPage[])ums.listPageByModuleId(modules[m].getId()).toArray(new UmsPage[]{});
				break;
			}
		}
		if(pages != null) {
			for(int p=0; p<pages.length; p++) if(!roles[r].hashPagePrivilege(pages[p].getCode())) {
				UmsRolePrivilege priv = new UmsRolePrivilege();
				priv.setPage(pages[p]);
				priv.setRight(new Integer(right));
				roles[r].getPrivilegeList().add(priv);
			}
			ums.saveBaseDomain(roles[r]);
		}
	}
}

UmsPage rpages[] = (UmsPage[])dao.find("select o from UmsPage as o"+
		" where o.id not in (select i.page.id from UmsRolePrivilege as i)",
		new Object[]{}).toArray(new UmsPage[]{});

Map actionMapping = UmsActionServletContextListener.getActionMapping(getServletContext());
UmsPage pages[] = (UmsPage[])ums.listBaseDomain(UmsPage.class).toArray(new UmsPage[]{});
List pcodeLst=new ArrayList(), plst1=new ArrayList(), plst2=new ArrayList();
for(int p=0; p<pages.length; p++) {
	pcodeLst.add(pages[p].getCode());
	if(!actionMapping.keySet().contains(pages[p].getCode()))
		plst1.add(new String[]{pages[p].getCode(), pages[p].getPath()});
}
String pcodes[] = (String[])actionMapping.keySet().toArray(new String[]{});
for(int p=0; p<pcodes.length; p++) if(!pcodeLst.contains(pcodes[p]))
	plst2.add(new String[]{pcodes[p], (String)actionMapping.get(pcodes[p])});
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.depthfirst.framework.web.UmsActionServletContextListener"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title>Test UMS</title>
<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/css/css0.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%= request.getContextPath() %>/js/struts.js"></script>
</head>

<body bgcolor="#FFFFFF">
<form method="post">

<table border="0" width="40%">
<tr class="trform"><td colspan="2"><b>UmsPage not in UmsRolePrivilege</b></td></tr>
<tr><th>Code</th><th>Name</th></tr>
<% for(int p=0; p<rpages.length; p++) { %><tr class="tr<%= p%2 %>">
<td><%= rpages[p].getCode() %></td><td><%= rpages[p].getName() %></td></tr><% } %>
</table>
<% if(user != null) { %><input type="submit" name="doModuleRolePrivilege" value=" ModuleRolePrivilege " /><% } %>

<table border="0" width="40%">
<tr class="trform"><td colspan="2"><b>UmsPage not in ActionMapping</b></td></tr>
<tr><th>Code</th><th>Path</th></tr>
<% for(int p=0, ps=plst1.size(); p<ps; p++) {
String vals[] = (String[])plst1.get(p); %><tr class="tr<%= p%2 %>"><td><%= vals[0] %></td><td><%= vals[1] %></td></tr><% } %>
</table>
<table border="0" width="40%">
<tr class="trform"><td colspan="2"><b>ActionMapping not in UmsPage</b></td></tr>
<tr><th>Code</th><th>Path</th></tr>
<% for(int p=0, ps=plst2.size(); p<ps; p++) {
String vals[] = (String[])plst2.get(p); %><tr class="tr<%= p%2 %>"><td><%= vals[0] %></td><td><%= vals[1] %></td></tr><% } %>
</table>

</form>
</body>
</html>
