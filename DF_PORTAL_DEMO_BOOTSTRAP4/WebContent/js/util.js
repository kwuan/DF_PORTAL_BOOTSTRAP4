function isArray(obj) {
	return obj instanceof Array;
}

function doMoveList(form, from, to) {
  if(form==null || form.elements[from]==null || form.elements[to]==null) return;
  var sfrom = form.elements[from];
  var sto = form.elements[to];
  for(var i=0; i<sfrom.options.length; i++)
   if(sfrom.options[i].selected) {
    var moveOption = sfrom.options[i];
    sfrom.remove(i--);
    sto.add(moveOption, sto.length);
  }
}
function doClearOptions(form, lst) {
  if(form==null || form.elements[lst]==null) return;
  var s=form.elements[lst];
  while(s.options.length > 0) s.remove(0);
}
function doDeleteSelected(form, lst) {
  if(form==null || form.elements[lst]==null) return -1;
  var n=0, s=form.elements[lst];
  for(var i=0; i<s.options.length; i++)
    if(s.options[i].selected) { n++; s.remove(i--); }
  return n;
}
function doAddOption(form, lst, val, txt) {
  if(form==null || form.elements[lst]==null) return;
  var s = form.elements[lst];
  var o = document.createElement('OPTION');
  o.text = txt;
  o.value = val;
  if(document.all != null) s.add(o);
  else s.add(o, null);
}
function doCopyOptions(form, src, des) {
  doClearOptions(form, des);
  var opts = form.elements[src].options;
  for(var i=0; i<opts.length; i++)
  	doAddOption(form, des, opts[i].value, opts[i].text);
}
function getListValues(form, lst, separator) {
  if(form==null || form.elements[lst]==null) return '';
  var s = form.elements[lst];
  if(separator == null) separator = '\n';
  var ret = '';
  for(var l=0; l<s.options.length; l++) {
    ret += (l>0?separator:'')+(s.options[l].value!=''?s.options[l].value:s.options[l].text);
  }
  return ret;
}

var _defaultCheckAllName = "check_all";
var _defaultCheckIdName = "check_id";
function doCheckAll(form, checkAllName, checkIdName) {
	if(form == null) return;
	var cbAll = form.elements[checkAllName==null?_defaultCheckAllName:checkAllName];
	var cbIds = form.elements[checkIdName==null?_defaultCheckIdName:checkIdName];
	if(cbAll==null || cbIds==null) return;
	if(cbIds.length == null) cbIds = new Array(cbIds);
	for(var i=0; i<cbIds.length; i++) cbIds[i].checked = cbAll.checked;
}
function doCheckId(form, checkAllName, checkIdName) {
	if(form == null) return;
	var cbAll = form.elements[checkAllName==null?_defaultCheckAllName:checkAllName];
	var cbIds = form.elements[checkIdName==null?_defaultCheckIdName:checkIdName];
	if(cbAll==null || cbIds==null) return;
	if(cbIds.length == null) cbIds = new Array(cbIds);
	cbAll.checked = true;
	for(var i=0; i<cbIds.length; i++) if(!cbIds[i].checked) cbAll.checked = false;
}

function tokenString(str, separator) {
	if(str == null) return null;
	var ret = new Array();
	while(str.indexOf(separator) > 0) {
		ret[ret.length] = str.substring( 0, str.indexOf(separator) );
		str = str.substring(str.indexOf(separator)+1);
	}
	if(str!=null && str.length!=0) ret[ret.length] = str;
	return ret.length==0?null:ret;
}

function getCheckboxValue(cbObj) {
	if(cbObj == null) return "";

	if(cbObj.length == undefined) cbObj = new Array(cbObj);
	var ret  = "";
	for(var i=0; i<cbObj.length; i++)
		if(cbObj[i].checked) ret += (ret!=""?",":"")+cbObj[i].value;
	return ret;
}
function getCheckedValue(radioObj) {
	if(radioObj == null) return "";

	if(radioObj.length == undefined) radioObj = new Array(radioObj);
	for(var i=0; i<radioObj.length; i++)
		if(radioObj[i].checked) return radioObj[i].value;
	return "";
}