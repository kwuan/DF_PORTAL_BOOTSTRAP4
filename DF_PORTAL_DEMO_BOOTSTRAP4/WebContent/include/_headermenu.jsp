<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="_nested"%>
<%
org.apache.log4j.Logger logger = org.apache.log4j.LogManager.getLogger( "com.depthfirst.jsp" );
String ctxPath = request.getContextPath();
long random = (new java.util.Date()).getTime();
com.depthfirst.framework.ums.web.UserSession userSession = 
(com.depthfirst.framework.ums.web.UserSession)session.getAttribute(com.depthfirst.framework.ums.web.UserSession.SESSION_KEY);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title> DF Portal (trial): Depth First Co., Ltd. [<%= java.net.Inet4Address.getLocalHost().getHostName() %>] </title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/portal_back/css/style.css" media="all" />
<!-- FOR LEFT MENU  -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/bootstrap-4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/bootstrap-daterangepicker/daterangepicker.js">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/jAlert/jAlert.css" rel="stylesheet" />
<link rel="stylesheet"href="<%= request.getContextPath() %>/css/custom.css">

<script language="JavaScript">
<!--
var ctxPath = "<%= ctxPath %>";
// -->
</script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/win.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/util.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/struts.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateForm.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateDate.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateNumber.js"></script>

<script type="text/javascript" src="<%= request.getContextPath() %>/portal_back/js/Chart.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/popper.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/lib/bootstrap-4.0.0/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/portal_back/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/portal_back/js/jquery.slashc.two-tier-menu.min.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/bootstrap-datepicker.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/bootstrap-datepicker-thai.js"  charset="UTF-8"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/locales/bootstrap-datepicker.th.js"  charset="UTF-8"></script>
<script src="<%= request.getContextPath() %>/lib/jquery-knob/dist/jquery.knob.min.js"></script>
<script src="<%= request.getContextPath() %>/lib/dist/js/adminlte.min.js"></script>
<script src="<%= ctxPath %>/js/Chart.min.js"></script>
<script src="<%= request.getContextPath() %>/lib/jAlert/jAlert.js"></script>
<script src="<%= request.getContextPath() %>/lib/select2/dist/js/select2.full.min.js"></script>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBpzziFh3XpWAxnwo0CrDvdBFr5MX-4zTM&libraries=geometry,places&sensor=false"></script>
<script src="<%= request.getContextPath() %>/lib/location_picker/js/locationpicker.jquery.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/sweetalert2/sweetalert2.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/sweetalert2/sweetalert2.js"></script>
<!-- sweet alert2 support IE-->
<script type="text/javascript" src="<%= request.getContextPath() %>/js/sweetalert2/core.js"></script>

<script language="JavaScript">
<!--
function doLogout() {
	<%-- if(confirm("ยืนยันการออกจากระบบ")) {
		document.location.href = '<%= request.getContextPath() %>/login.do?cmd=doLogout&ts='+(new Date()).getTime();
	} --%>
	<%-- $.jAlert({
		  'title': 'Log out',
		  'content': 'ยืนยันการออกจากระบบ',
		  'theme': 'blue',
		  'size': 'sm',
		  'showAnimation': 'fadeInUp',
		  'hideAnimation': 'fadeOutDown',
		  'confirmBtnText':true,
		  'btns': [ {'text': 'Yes', 'onClick': function(){ document.location.href = '<%= request.getContextPath() %>/login.do?cmd=doLogout&ts='+(new Date()).getTime();}}, {'text': 'No'} ]
	});  --%>
	
	swal({
		title: 'Log out?',
		text: "ยืนยันการออกจากระบบ",
	  	type: 'warning',	
	  	showCancelButton: true,
	  	confirmButtonColor: '#3085d6',
	  	cancelButtonColor: '#d33',
	  	confirmButtonText: 'Yes'
	}).then((result) => {
	  if (result.value) {
		  document.location.href = '<%= request.getContextPath() %>/login.do?cmd=doLogout&ts='+(new Date()).getTime();
	  }
	});
}
$(document).ready(function(){
	$(".trigger").click(function(){
		$(".panel").toggle();
		$(this).toggleClass("active");
		return false;
	});
<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>"><_nested:present property="currentPage.moduleCode">
/*	$(".panel").toggle("fast");
	$(".trigger").toggleClass("active");*/
</_nested:present></_nested:root>
});
// -->
</script>
</head>

<body class="hold-transition skin-red sidebar-mini">
	<div class="wrapper">
		<header class="main-header fix-top bg-danger">
			<!-- Logo -->
			<a href="#" class="logo bg-danger"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini font-weight-bold">DF</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b class="font-weight-bold">DF </b>PORTAL</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-expand-lg navbar-light bg-danger p-0">
			<!-- 
			  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button> -->
			  <a href="#" class="menu sidebar-toggle p-1" data-toggle="push-menu" role="button"></a>
			  <div class="collapse navbar-collapse" id="row navbarNavAltMarkup">
			    <div class="col navbar-nav p-1">
			      <a class="nav-item nav-link text-white active"  href="<%= request.getContextPath() %>/kmNews.do" >ข่าวสารและกิจกรรม<span class="sr-only">(current)</span></a>
				  <a class="nav-item nav-link text-white" href="<%= request.getContextPath() %>/home.do?cmd=kmCalendar" >ปฏิทิน</a>
				  <a class="nav-item nav-link text-white" href="<%= request.getContextPath() %>/kmblog.do" >Blog</a>
			    </div>
			    <div class="navbar-custom-menu user-login align-self-end">
					<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">				
						<span class="dropdown user user-menu">
							<a href="#" class="" data-toggle="dropdown"> 
								<i class="fa fa-user-circle" aria-hidden="true"></i>
								<span class="hidden-xs text-white">
									ยินดีต้อนรับ : <_nested:write property="login" />&nbsp;  
				                  	<a class="change-pass text-white" href="<%= ctxPath %>/password.jsp"> <i class="fa fa-key" aria-hidden="true"></i> เปลี่ยนรหัสผ่าน  </a>
									<a class="logout text-white" id="logout" href="javascript:doLogout();"> <i class="fa fa-sign-out" aria-hidden="true"></i> ออกจากระบบ</a>
								</span>
							</a>
						</span>
					</_nested:root>
				</div>
			  </div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar bd-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar scrollbar">
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">MAIN MENU</li>
					<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
					<_nested:notEmpty property="menuItems">
						<_nested:iterate id="mainItem" indexId="mainInd" property="menuItems">
							<_nested:define name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>" id="currentPage" property="currentPage" type="com.depthfirst.framework.ums.web.PageInfo" />
							<_nested:define property="code" id="moduleCode" type="String" />
							<li class="treeview <%= currentPage!=null&&moduleCode.equals(currentPage.getModuleCode())?" active menu-open":"" %>">
								<a href="#">
									<%-- <i class="fa fa-<_nested:write property="code" />" aria-hidden="true"></i> --%>
									<span class="d-inline-block text-truncate" data-toggle="tooltip" title="<_nested:write property="name"/>"  style="max-width: 150px;"><_nested:write property="name" /></span> 
									<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i></span>
								</a>
								
								<ul class="treeview-menu" <%= currentPage!=null&&moduleCode.equals(currentPage.getModuleCode())?" style='overflow: hidden; display: block;'":"" %>>
									<_nested:iterate id="subItem" name="mainItem" indexId="subInd" property="subItemList">
										<_nested:define property="name" id="moduleCode2" type="String" />
					              		<_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList">
										</_nested:iterate>
							            <li class="treeview <%= currentPage!=null&&moduleCode2.equals(currentPage.getPageType())?" menu-open":"" %>">
					              			<a href="#">
					              				<_nested:write property="name" />
							                	<span class="pull-right-container">
							                  		<i class="fa fa-angle-left pull-right"></i>
							                	</span>
						              		</a>
											<ul class="treeview-menu" <%= currentPage!=null&&moduleCode2.equals(currentPage.getPageType())?" style='overflow: hidden; display: block;'":"" %>>
						              		<_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList">
												<_nested:define property="code" id="moduleCode3" type="String" />
												<li<%= currentPage!=null&&moduleCode3.equals(currentPage.getPageCode())?" class='active'":"" %>><a href="<%= request.getContextPath() %><_nested:write property="path" />?random=<%= random %>"><span class="d-inline-block text-truncate" style="max-width: 150px;" data-toggle="tooltip" title="<_nested:write property="name" />"><_nested:write property="name" /></span></a></li>
											</_nested:iterate>
											</ul>
							            </li>
									</_nested:iterate>
								</ul>
							</li>
						</_nested:iterate>
					</_nested:notEmpty>
					</_nested:root>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-title">
			<!-- Content Header (Page header) -->
			<div class="content-header content-hg">
				<div class="row">
					<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
				    	<div class="moduleName col-sm-10 col-12">
							<span style="font-size: 1.1rem;">
								<_nested:present property="currentPage.moduleName"><_nested:write property="currentPage.moduleName" />&nbsp;>>&nbsp;</_nested:present>
								<_nested:write property="currentPage.pageName" />
							</span>
					    </div>
						<div class="pageCode text-right col-sm-2 col-12" style="font-size: 1rem;">
				        	<_nested:write property="currentPage.pageCode" />
				   	 	</div>
			   	 	</_nested:root>
			    </div>
			</div>			
		</div>
		
		<!-- Main content -->
		<div class="content-wrapper">
			<section class="content">
<%try { %>