var newWindow = null;
var closeNewWindow = true;
function popupWindow(url, width, height, fixsize, noscrolls) {
	if(newWindow!=null && !newWindow.closed) {
		if(!confirm('Old window exists!!\n Click "OK" to close old window and open new window.\n Click "Cancel" to activate old window.')) {
			newWindow.focus();
			return;
		}else newWindow.close();
	}
	if(screen) {
		var left = (screen.availWidth-width)/2;
		var top = (screen.availHeight-height)/2;
		newWindow = window.open(url, '_popup','location=no, resizable='+(fixsize?'no':'yes')+', menubar=no, toolbar=no, personalbar=no, status=no, scrollbars='+(noscrolls?'no':'yes')+', width='+width+', height='+height+', left='+left+', top='+top);
	}else newWindow = window.open(url, '_popup','location=no, resizable='+(fixsize?'no':'yes')+', menubar=no, toolbar=no, personalbar=no, status=no, scrollbars='+(noscrolls?'no':'yes')+', width='+width+', height='+height);
}
function closeWindow() {
	if(newWindow!=null && closeNewWindow && !newWindow.closed) newWindow.close();
}
function reloadNoClose() {
	closeNewWindow = false;
	document.location.reload(true);
	closeNewWindow = true;
}
function submitPopup(form, url, width, height, fixsize, noscrolls) {
	if(newWindow!=null && !newWindow.closed) {
		if(!confirm('Old window exists!!\n Click "OK" to close old window and open new window.\n Click "Cancel" to activate old window.')) {
			newWindow.focus();
			return;
		}else newWindow.close();
	}

  var a = form.action;
  var t = form.target;
  popupWindow('', width, height, fixsize, noscrolls);
  form.action = url;
  form.target = '_popup';
  form.submit();
  form.action = a;
  form.target = t;
}
