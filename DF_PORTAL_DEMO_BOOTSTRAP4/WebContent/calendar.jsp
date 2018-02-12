<%@ page language="java" contentType="text/html; charset=TIS620" import="com.depthfirst.framework.ums.web.*" pageEncoding="TIS620"%><%!
String homeName = "ปฏิทิน";
%><%@ include file="/include/_home.jsp" %><%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>
<%@ include file="/include/_headermenu.jsp" %>

<script type="text/javascript" src="<%= ctxPath %>/script/jquery-1.7.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<%= ctxPath %>/script/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="<%= ctxPath %>/script/fullcalendar.js"></script>
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/stylesheet/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/stylesheet/fullcalendar.print.css" media="print" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/stylesheet/dropdown.vertical.css" media="screen" />
<script type="text/javascript"> // calendar
$(document).ready(function() {
	$('#calendar_x').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultView: 'agendaWeek',
   		timeFormat: 'HH:mm { - HH:mm}',
		minTime: '09:00',
		maxTime: '19:00',
		editable: false,
		eventSources:[
			{
				url: '<%= ctxPath %>/json/calendarHoliday',
	            error: function() {
    	            alert('Error fetching holidays!');
        	    }
			}, {
				url: '<%= ctxPath %>/json/calendarLeave',
	            error: function() {
    	            alert('Error fetching leaves!');
        	    }
			}, {
				url: '<%= ctxPath %>/json/calendarBirthday',
	            error: function() {
    	            alert('Error fetching birthdays!');
        	    }
			}
		]
		
	});
});

</script>
<table border="0" bgcolor="#ffffff" width="100%">
	<tr><td>
		<div id="calendar_x"></div>
	</td></tr></table>

<%@ include file="/include/_footermenu.jsp" %>