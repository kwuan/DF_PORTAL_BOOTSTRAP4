<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title> Test Calendar </title>
<script type="text/javascript" src="<%= request.getContextPath() %>/script/jquery-1.7.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/script/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/script/fullcalendar.js"></script>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/stylesheet/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/stylesheet/fullcalendar.print.css" media="print" />
</head>

<body>

<style>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}
		
	#loading {
		position: absolute;
		top: 5px;
		right: 5px;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>

<div id='calendar'></div>

<script>
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			height: 480,
			width: 640,
			defaultView: 'agendaWeek',
			//agenda: 'H:mm{-H:mm}',
			//timeFormat: 'H:mm',
			minTime: '09:00',
			maxTime: '19:00',

			editable: false,
			
			events: "<%= request.getContextPath() %>/json/calendarAll",
			
		});
</script>

</body>
</html>
<!--
http://localhost:6080/DF_PORTAL/json/calendarAll?start=1388509200&end=1393606800
-->
