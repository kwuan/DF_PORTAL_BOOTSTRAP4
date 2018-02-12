<%@ page language="java" import="java.io.*,java.util.*" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%
Properties props = new Properties(System.getProperties());

InputStream in = null;
try {
	in = getClass().getResourceAsStream("/log4j.properties");
	props.load(in);
}catch(Exception e){
	e.printStackTrace();
}finally {
	try{ in.close(); }catch(Exception e){}
}

ArrayList plst = new ArrayList();
if(props.getProperty("log.dir") != null)
	plst.add((new File(props.getProperty("log.dir"))).getAbsolutePath());
if(props.getProperty("catalina.home") != null)
	plst.add((new File(props.getProperty("catalina.home")+"/logs")).getAbsolutePath());
String paths[] = (String[])plst.toArray(new String[]{});

String path = request.getParameter("path");
if(path==null && paths.length>0) path = paths[0]; 

String file = request.getParameter("file");
if(path!=null && file!=null && !file.trim().equals("")) {
	OutputStream os = null;
	try {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename="+file);

		os = response.getOutputStream();
		in = new FileInputStream(new File(new File(path), file));
		byte buf[] = new byte[1000];
		for(int len=-1; (len=in.read(buf))!=-1; ) os.write(buf, 0, len);
	}finally {
		try{ in.close(); }catch(Exception e){}
		try{ os.close(); }catch(Exception e){}
	}
	return;
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title> Server Logs </title>
<script language="JavaScript">
<!--
function doDownload(file) {
	document.forms[0].elements['file'].value = file;
	document.forms[0].submit();
}
// -->
</script>
</head>

<body bgcolor="#ffffff">
<form method="post">
<input type="hidden" name="file" value="">
<table border="0">
<tr><td colspan="2"><select name="path" onchange="this.form.submit()">
	<% for(int p=0; p<paths.length; p++) {
	%><option value="<%= paths[p] %>"<%= paths[p].equals(path)?" selected":"" %>><%= paths[p] %></option><% } %>
</select></td></tr>
<% if(path != null) {
	File dir = new File(path);
	File files[] = dir.listFiles();
%><tr bgcolor="#aaaaff"><td>File</td><td>Size</td></tr>
<% for(int f=0; f<files.length; f++) {
	if(!files[f].isFile()) continue;
%><tr bgcolor="#ccccff"><td><a href="javascript:doDownload('<%= files[f].getName() %>')"><%= files[f].getName() %></a></td>
	<td><%= com.depthfirst.framework.fileupload.FileInfo.toFileSizeStr(files[f].length()) %></td></tr><% } %>
<% } %>
</table>
</form>
</body>
</html>
