<%@ page language="java" import="java.util.*,com.depthfirst.framework.dao.IBaseDomainDAO,org.springframework.web.context.support.WebApplicationContextUtils" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%!
int rows[] = {1, 10, 25, 50, 100};
IBaseDomainDAO getBaseDomainDAO() {
	return (IBaseDomainDAO)WebApplicationContextUtils.getWebApplicationContext(getServletContext()).getBean("baseDomainDAO");
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title> Test HQL </title>
</head>

<body bgcolor="#ffffff">
<form method="post">
<table border="0"><tr><th bgcolor="#aaaaff">HQL</th></tr><%
String hql = request.getParameter("hql");
boolean showDetail = "Y".equals(request.getParameter("showDetail"));
int nrows = request.getParameter("returnRows")!=null?Integer.parseInt(request.getParameter("returnRows")):0;
%><tr valign="top" bgcolor="#ccccff"><td><textarea name="hql" rows="5" cols="100"><%= hql!=null?hql:"" %></textarea></td></tr>
<tr bgcolor="#ccccff"><td><select name="returnRows"><option value=0>all rows
	<% for(int i=0; i<rows.length; i++) { %><option value="<%= rows[i] %>"<%= rows[i]==nrows?" selected":"" %>><%= rows[i] %> rows<% } %></select>
	<input type="checkbox" name="showDetail" value="Y" <%= showDetail?"checked":"" %> /> Show Details</td></tr>
<tr><td><input type="submit" name="doExec" value=" Execute " />
	<input type="submit" name="doClear" value=" Clear " /></td></tr>
</table>

<% if(request.getParameter("doExec")!=null && hql!=null) {
	long startTime = (new Date()).getTime();
	List lst = getBaseDomainDAO().find(hql, new Object[]{});
%><br/><b>[<%= hql %>] <%= nrows>0?nrows+" of ":"" %><%= lst.size() %> rows [<%= (new Date()).getTime()-startTime %> ms]</b>
<br/><table border="0">
<% for(int l=0, ls=nrows>0?nrows:lst.size(); l<ls; l++) {
	Object val = lst.get(l);
	Object vals[] = val instanceof Object[]?(Object[])val:new Object[]{val};
%><% if(showDetail) {
	Map map = new HashMap();
	if(vals.length > 1) for(int i=0; i<vals.length; i++) {
		Map tmp = org.apache.commons.beanutils.BeanUtils.describe(vals[i]);
		String keys[] = (String[])tmp.keySet().toArray(new String[]{});
		for(int k=0; k<keys.length; k++) map.put(i+"."+keys[k], tmp.get(keys[k]));
	}else map.putAll( org.apache.commons.beanutils.BeanUtils.describe(vals[0]) );
	String keys[] = (String[])map.keySet().toArray(new String[]{});
	Arrays.sort(keys);
%><% if(l == 0) { %><tr bgcolor="#aaaaff">
	<% for(int i=0; i<keys.length; i++) { %><th><%= keys[i] %></th><% } %>
</tr><% } %><tr bgcolor="#ccccff">
	<% for(int i=0; i<keys.length; i++) { %><td><%= map.get(keys[i]) %></td><% } %>
</tr><% }else { %><tr bgcolor="#ccccff">
	<% for(int i=0; i<vals.length; i++) { %><td><%= vals[i] %></td><% } %>
</tr><% } %>
<% } %>
</table><% } %>
</form>
</body>
</html>
