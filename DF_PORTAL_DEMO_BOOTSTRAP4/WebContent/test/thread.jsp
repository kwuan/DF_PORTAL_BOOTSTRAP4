<%@ page language="java" import="java.io.*,java.util.*,com.depthfirst.framework.fileupload.FileInfo" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%><%@ include file="_authorized.jsp" %><%!
public static boolean isService(StackTraceElement sts[]) {
	for(int i=0; i<sts.length; i++)
		if("service".equals(sts[i].getMethodName())) return true;
	return false;
}
public static void printThreadGroupTable(ThreadGroup group, PrintWriter out,
		boolean runnableOnly, boolean serviceOnly, boolean showDetail, int count[]) {
    // Get threads in 'group'
    int numThreads = group.activeCount();
    Thread[] threads = new Thread[numThreads*2];
    numThreads = group.enumerate(threads, false);

    out.println("<table border='0' width='100%'>");
    out.println("<tr bgcolor=#aaaaff><td colspan='2'>"+group+"</td></tr>");

    // Enumerate each thread in 'group'
    for (int i=0; i<numThreads; i++) {
        // Get thread
        Thread thread = threads[i];
        StackTraceElement sts[] = thread.getStackTrace();
        count[0]++;
        count[1] += Thread.State.RUNNABLE.equals(thread.getState())?1:0;
        count[2] += isService(sts)?1:0;
        if(runnableOnly && !Thread.State.RUNNABLE.equals(thread.getState())) continue;
        if(serviceOnly && !isService(sts)) continue;
        out.println("<tr bgcolor=#ccccff><td>&nbsp;</td><td>");
        if(sts!=null && sts.length>0) out.println("<a href=\"javascript:toggleTab('id_"+thread.hashCode()+"')\">");
        out.println(thread+"["+thread.getState()+"]");
        if(sts!=null && sts.length>0) out.println("</a>");
        out.println("</td></tr>");
        if(sts!=null && sts.length>0) {
            out.println("<tr id='id_"+thread.hashCode()+"'"+
            		(showDetail?"":" style='display:none'")+"><td>&nbsp;</td><td><table border='0' width='100%'>");
            for(int s=0; s<sts.length; s++) {
            	boolean mark = sts[s].getMethodName().equals("_jspService") ||
            			sts[s].getClassName().startsWith("com.depthfirst.");
            	out.println("<tr><td"+(mark?" bgcolor=\"#FFFF00\"":"")+">"+sts[s]+"</td></tr>");
            }
            out.println("</table></td></tr>");
        }
    }

    // Get thread subgroups of 'group'
    int numGroups = group.activeGroupCount();
    ThreadGroup[] groups = new ThreadGroup[numGroups*2];
    numGroups = group.enumerate(groups, false);

    // Recursively visit each subgroup
    for (int i=0; i<numGroups; i++) {
    	out.println("<tr><td>&nbsp;</td><td>");
    	printThreadGroupTable(groups[i], out, runnableOnly, serviceOnly, showDetail, count);
    	out.println("</td></tr>");
    }

    out.println("</table>");
}
%><%
ThreadGroup root = Thread.currentThread().getThreadGroup().getParent();
while(root.getParent() != null) root = root.getParent();
boolean runnableOnly = "Y".equals(request.getParameter("run_only"));
boolean serviceOnly = "Y".equals(request.getParameter("svc_only"));
boolean showDetail = "Y".equals(request.getParameter("show_detail"));
int count[] = new int[3];
Runtime runtime = Runtime.getRuntime();
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title> Server Thread </title>
<script language="JavaScript">
<!--
function toggleTab(tabId) {
	var tab = document.getElementById(tabId);
	if(tab != null) tab.style.display = tab.style.display=='none'?'block':'none';
}
// -->
</script>
</head>

<body bgcolor="#ffffff">
<form method="post">
<table border="0" width="100%">
<tr><td><input type="button" value=" Refresh " onclick="this.form.submit()">
	<input type="checkbox" name="run_only" value="Y" <%= runnableOnly?" checked":"" %>>RUNNABLE Only
	<input type="checkbox" name="svc_only" value="Y" <%= serviceOnly?" checked":"" %>>Service Only
	<input type="checkbox" name="show_detail" value="Y" <%= showDetail?" checked":"" %>>Show Detail</td></tr>
<tr><td><% printThreadGroupTable(root, new PrintWriter(out), runnableOnly, serviceOnly, showDetail, count); %></td></tr>
<tr><td>Total=<%= count[0] %>, RUNNABLE=<%= count[1] %>, Service=<%= count[2] %></td></tr>
<tr><td><%= runtime.availableProcessors() %> CPU,
		 Memory [max=<%= FileInfo.toFileSizeStr(runtime.maxMemory()) %>
		, total=<%= FileInfo.toFileSizeStr(runtime.totalMemory()) %>
		, free=<%= FileInfo.toFileSizeStr(runtime.freeMemory()) %>]</td></tr>
</table>
</form>
</body>
</html>
