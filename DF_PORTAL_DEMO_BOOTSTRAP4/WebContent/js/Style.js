var _TotalStyle = 3;
var _cssPrefix = (ctxPath!=null?ctxPath:'')+"/css/css";
var _cssSuffix = ".css";
function InitStyle() {
	var strCss = getCookie("css");
	if(typeof(strCss) == "undefined") strCss = "0";
	for(var i=0; i<_TotalStyle; i++)
		document.write('<link rel="stylesheet" title="css'+i+'" href="'+_cssPrefix+i+_cssSuffix+'" type="text/css"'
			+(strCss==i?'':' disabled')+'>');
}

function SetStyle(ind) {
	for(var i=0; i<document.styleSheets.length; i++) {
		if(document.styleSheets[i].title.substring(0, 3) != 'css') continue;
		if(document.styleSheets[i].title == 'css'+ind) document.styleSheets[i].disabled = false;
		else document.styleSheets[i].disabled = true;
	}

	setCookie("css", ind, 30, "/", null);
}

function UpdateStyle() {
	var strName;

	strName = getCookie("css")

	if((typeof(strName) != "undefined")&&(strName != null))
		setCookie("css", strName, 30, "/", null);
}
