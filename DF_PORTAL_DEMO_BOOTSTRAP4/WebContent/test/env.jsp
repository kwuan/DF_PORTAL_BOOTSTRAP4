<%@ include file="_authorized.jsp" %><HTML>
<HEAD>
<TITLE> Environment </TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<FORM METHOD=POST>
<INPUT TYPE="submit" value=" Post ">
</FORM>

<H1><%= new java.util.Date() %></H1>
<H2>request.getRequestURL() : [<%= request.getRequestURL() %>]</H2>
<H2>request.getRequestURI() : [<%= request.getRequestURI() %>]</H2>
<H2>request.getPathInfo() : [<%= request.getPathInfo() %>]</H2>
<H2>request.getProtocol() : [<%= request.getProtocol() %>]</H2>
<H2>request.getMethod() : [<%= request.getMethod() %>]</H2>
<H2>request.getScheme() : [<%= request.getScheme() %>]</H2>
<H2>request.getQueryString() : [<%= request.getQueryString() %>]</H2>
<H2>request.getContextPath() : [<%= request.getContextPath() %>]</H2>
<H2>request.getServletPath() : [<%= request.getServletPath() %>]</H2>
<H2>getServletContext().getRealPath("/") : [<%= getServletContext().getRealPath("/") %>]</H2>
<H2>getServletContext().getServerInfo() : [<%= getServletContext().getServerInfo() %>]</H2>
<H2>getServletContext().getServletContextName() : [<%= getServletContext().getServletContextName() %>]</H2>
<H2>getServletContext().getMajorVersion() : [<%= getServletContext().getMajorVersion() %>]</H2>
<H2>getServletContext().getMinorVersion() : [<%= getServletContext().getMinorVersion() %>]</H2>
<H2>request.getCharacterEncoding() : [<%= request.getCharacterEncoding() %>]</H2>
<H2>response.getCharacterEncoding() : [<%= response.getCharacterEncoding() %>]</H2>
<H2>request.getRemoteUser() : [<%= request.getRemoteUser() %>]</H2>
<H2>request.getRemoteHost() : [<%= request.getRemoteHost() %>]</H2>
<TABLE border=0>
<TR bgcolor=#aaaaff>
	<TD colspan=2><B>ServletContext InitParameters</B></TD>
</TR>
<%
	java.util.Enumeration ipnames = getServletContext().getInitParameterNames();
	while(ipnames.hasMoreElements()) {
		String ipname = (String)ipnames.nextElement();
%>
<TR bgcolor=#ccccff>
	<TD><%= ipname %></TD>
	<TD><%= getServletContext().getInitParameter(ipname) %></TD>
</TR>
<%	} %>
<TR bgcolor=#aaaaff>
	<TD colspan=2><B>System Properties</B></TD>
</TR>
<%
	java.util.Enumeration keys = System.getProperties().keys();
	while(keys.hasMoreElements()) {
		String key = (String)keys.nextElement();
%>
<TR bgcolor=#ccccff>
	<TD><%= key %></TD>
	<TD><%= System.getProperty(key) %></TD>
</TR>
<%	} %>
<TR bgcolor=#aaaaff>
	<TD colspan=2><B>Request Header</B></TD>
</TR>
<%
	java.util.Enumeration hnames = request.getHeaderNames();
	while(hnames.hasMoreElements()) {
		String hname = (String)hnames.nextElement();
%>
<TR bgcolor=#ccccff>
	<TD><%= hname %></TD>
	<TD><%= request.getHeader(hname) %></TD>
</TR>
<%	} %>
<TR bgcolor=#aaaaff>
	<TD colspan=2><B>Request Parameter</B></TD>
</TR>
<%
	java.util.Enumeration pnames = request.getParameterNames();
	while(pnames.hasMoreElements()) {
		String pname = (String)pnames.nextElement();
%>
<TR bgcolor=#ccccff>
	<TD><%= pname %></TD>
	<TD><%= request.getParameter(pname) %></TD>
</TR>
<%	} %>
<TR bgcolor=#aaaaff>
	<TD colspan=2><B>Request Attribute</B></TD>
</TR>
<%
	java.util.Enumeration ranames = request.getAttributeNames();
	while(ranames.hasMoreElements()) {
		String aname = (String)ranames.nextElement();
%>
<TR bgcolor=#ccccff>
	<TD><%= aname %></TD>
	<TD><%= request.getAttribute(aname) %></TD>
</TR>
<%	} %>
<TR bgcolor=#aaaaff>
	<TD colspan=2><B>Session Attribute</B></TD>
</TR>
<%
	java.util.Enumeration anames = session.getAttributeNames();
	while(anames.hasMoreElements()) {
		String aname = (String)anames.nextElement();
%>
<TR bgcolor=#ccccff>
	<TD><%= aname %></TD>
	<TD><%= session.getAttribute(aname) %></TD>
</TR>
<%	} %>
<TR bgcolor=#aaaaff>
	<TD colspan=2><B>ServletContext Attribute</B></TD>
</TR>
<%
	java.util.Enumeration sanames = getServletContext().getAttributeNames();
	while(sanames.hasMoreElements()) {
		String saname = (String)sanames.nextElement();
%>
<TR bgcolor=#ccccff>
	<TD><%= saname %></TD>
	<TD><%= getServletContext().getAttribute(saname) %></TD>
</TR>
<%	} %>
</TABLE>
</BODY>
</HTML>
