<% String msg = (String)request.getAttribute(com.depthfirst.framework.message.ResponseMessageManager.MESSAGE_ATTRIBUTE_KEY);
String color = "dark_green";
if(msg != null) { %><script language="JavaScript">
	<%-- alert("<%= msg %>"); --%>
	<%-- $.jAlert({
	'title': 'Notification',
	'clickAnywhere': true,
	'content': '<%= msg %>',
	'theme': '<%= color %>',
	'size': 'sm',
	'showAnimation': 'fadeInUp',
	'hideAnimation': 'fadeOutDown'
	}); --%>
	
	swal({
	  title: '<%= msg %>'
	});

</script><% } %>