function userSessionErrorHandler(errorString, exception) {
	alert(errorString);

	if(exception!=null && exception.cause!=null &&
		exception.javaClassName=='java.lang.RuntimeException') exception = exception.cause;

	if(exception!=null &&
		(exception.javaClassName=='com.depthfirst.framework.ums.exception.UserSessionExpiredException'
		 || exception.javaClassName=='com.depthfirst.framework.ums.exception.InsufficientPrivilegeException') ) {
		document.location.href = (ctxPath!=null?ctxPath:'')+'/';
	}
}

var _dwr_debug = false;
function changeDwrList(form, clearNames, valName, dwrFunc, lstNames, blankLabel) {
	if(_dwr_debug) alert("dwr0[form="+form+", clearNames="+clearNames+", valName="+valName+
				", dwrFunc="+dwrFunc+", lstNames="+lstNames+", blankLabel="+blankLabel+"]");
	for(var i=0; clearNames!=null && i<clearNames.length; i++) {
		doClearOptions(form, clearNames[i]);
		if(blankLabel != null) doAddOption(form, clearNames[i], '', blankLabel);
	}
	if(!isArray(lstNames)) lstNames = new Array(lstNames);
	var val = form.elements[valName].value
	if(val==null || val=='') return;
	var func = eval(dwrFunc);
	if(_dwr_debug) alert("dwr2[val="+val+", func="+func+"]");
	if(func != null) {
		func(val, {
			callback: function(list) {
				if(_dwr_debug) alert("dwr3["+list+"]");
				if(list == null) return;
				for(var i=0; i<list.length; i++)
					for(var n=0; n<lstNames.length; n++)
						doAddOption(form, lstNames[n], list[i].id, list[i].label);
				if(_dwr_debug) alert("dwr4");
			},
			async: false,
			errorHandler: userSessionErrorHandler
		});
	}
}

function changeDwrList2(form, clearNames, valName1, valName2, dwrFunc, lstNames, blankLabel) {
	for(var i=0; clearNames!=null && i<clearNames.length; i++) {
		doClearOptions(form, clearNames[i]);
		if(blankLabel != null) doAddOption(form, clearNames[i], '', blankLabel);
	}
	if(!isArray(lstNames)) lstNames = new Array(lstNames);
	var val1 = form.elements[valName1].value;
	var val2 = form.elements[valName2].value;
	if(val1==null || val1=='' || val2==null || val2=='') return;
	var func = eval(dwrFunc);
	if(func != null) {
		func(val1, val2, {
			callback: function(list) {
				if(list == null) return;
				for(var i=0; i<list.length; i++)
					for(var n=0; n<lstNames.length; n++)
						doAddOption(form, lstNames[n], list[i].id, list[i].label);
			},
			async: false,
			errorHandler: userSessionErrorHandler
		});
	}
}
