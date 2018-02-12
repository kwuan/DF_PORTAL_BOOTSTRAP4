var validate_debug = false;
function createErrorPane(form) {
	if(form == null) return;
	var els = new Array();
	var enames = new Array();
	for(var e=0; e<form.elements.length; e++) {
		var ename = form.elements[e].name;
		if(ename == '') continue;
		if(els[ename] == null) {
			enames[enames.length] = ename;
			els[ename] = new Array(form.elements[e]);
		}else {
			if(els[ename][0].type != form.elements[e].type) {
				alert("elements with same name must same type["+ename+"]"); return;
			}
			els[ename][els[ename].length] = form.elements[e];
		}
	}

	for(var e=0; e<enames.length; e++) {
		var el = els[enames[e]];

		if(el[0].type=='text' || el[0].type=='textarea' || el[0].type=='password') {
			for(var i=0; i<el.length; i++) getErrorPane(el[i], i);
		} else if(el[0].type=='select-one' || el[0].type=='select-multiple') {
			for(var i=0; i<el.length; i++) getErrorPane(el[i], i);
		} else if(el[0].type=='radio') {
			getErrorPane(el[0]);
		} else if(el[0].type=='checkbox') {
			getErrorPane(el[0]);
		} else {
			getErrorPane(el[0]);
		}
	}
}
var __emsg_with_name = false;
function validateForm(form) {
	var result = true;
	var els = new Array();
	var enames = new Array();
	for(var e=0; e<form.elements.length; e++) {
		var ename = form.elements[e].name;
		if(ename == '') continue;
		if(els[ename] == null) {
			enames[enames.length] = ename;
			els[ename] = new Array(form.elements[e]);
		}else {
			if(els[ename][0].type != form.elements[e].type) {
				alert("elements with same name must same type["+ename+"]"); return;
			}
			els[ename][els[ename].length] = form.elements[e];
		}
	}

	for(var e=0; e<enames.length; e++) {
		var el = els[enames[e]];

		if(el[0].type=='text' || el[0].type=='textarea' || el[0].type=='password' || el[0].type=='file') {
			for(var i=0; i<el.length; i++) {
				var argsStr = toArgsStr(el[i]);
				if(argsStr == null) continue;	 // ignore unsupport input
				//alert(argsStr);

				var emsg = validateText(el[i].value, argsStr, enames[e]);
				if(emsg != null) result = false;
				setError(emsg, el[i], i);
			}
		} else if(el[0].type=='select-one' || el[0].type=='select-multiple') {
			for(var i=0; i<el.length; i++) {
				var argsStr = toArgsStr(el[i]);
				if(argsStr == null) continue;	 // ignore unsupport input
				//alert(argsStr);

				var emsg = validateSelect(el[i], argsStr);
				if(emsg != null) result = false;
				setError(emsg, el[i], i);
			}
		} else if(el[0].type=='radio') {
			var argsStr = toArgsStr(el[0]);
			if(argsStr == null) continue;	 // ignore unsupport input
			//alert(argsStr);

			var emsg = validateRadio(el, argsStr);
			if(emsg != null) result = false;
			setError(emsg, el[0]);
		} else if(el[0].type=='checkbox') {
			var argsStr = toArgsStr(el[0]);
			if(argsStr == null) continue;	 // ignore unsupport input
			var emsg = validateCheckBox(el, argsStr);
			if(emsg != null) result = false;
			setError(emsg, el[0]);
		} else {
			var argsStr = toArgsStr(el[0]);
			if(argsStr == null) continue;	 // ignore unsupport input
			var args = argsStr.split(",");
			var emsg = validateFunction(null, args, 0, enames[e]);
			if(emsg != null) result = false;
			setError(emsg, el[0]);
			//alert("not implemented["+el[0].type+"]");
		}
	}

	return result;
}
function setError(emsg, el, ind) {
	var epane = getErrorPane(el, ind);
	if(epane != null) {
		epane.innerHTML = emsg!=null?emsg:'';
		epane.style.display = emsg==null||emsg==''?'none':'block';
	}
}
function addError(emsg, el, ind) {
	var epane = getErrorPane(el, ind);
	if(epane != null) {
		epane.innerHTML += (epane.innerHTML!=""?", ":"")+emsg;
		epane.style.display = 'block';
	}
}
function getErrorPane(el, ind) {
	if(toArgsStr(el) == null) return;
	var id = el.name+'_id_'+(ind!=null?ind:0);
	var ret = document.getElementById(id);
	if(ret == null) try {
		el.parentNode.innerHTML += '<div id="'+id+'" class="error" style="display:none"></div>';
		ret = document.getElementById(id);
	}catch(error) { if(validate_debug) alert(error); }
	return ret;
}
function toArgsStr(el) {
	//var val = el.accessKey;
	if(el.disabled) return null; // ignore disabled
	try{ if(el.parentNode != el.offsetParent) return null; }catch(error){} // ignore hidden
	var val = el.lang;
	if(val==null && val=='') return null;
	return val.substring(0, 9)=='property[' && val.substring(val.length-1, val.length)==']'?val.substring(9, val.length-1):null;
}


// val		-	text's value
// argStr	-	label, required, minlen, maxlen, func, funcArgs
// elName	-	element's name
function validateText(val, argStr, elName) {
	var args = argStr.split(",");

	var emsg = "";
	if(val != '') {
		var minlen = parseInt(args[2], 10);
		if(!isNaN(minlen) && val.length<minlen) emsg += (emsg!=""?", ":"")+"ข้อมูลต้องยาวไม่น้อยกว่า "+minlen+" ตัวอักษร";

		var maxlen = parseInt(args[3], 10);
		if(!isNaN(maxlen) && val.length>maxlen) emsg += (emsg!=""?", ":"")+"ข้อมูลต้องยาวไม่เกิน "+maxlen+" ตัวอักษร";

		var femsg = validateFunction(val, args, 4, elName);
		if(femsg != null) emsg += (emsg!=""?", ":"")+femsg;
	}else {
		if(args[1] != 'required') {
			var minlen = parseInt(args[2], 10);
			if(!isNaN(minlen)) emsg += (emsg!=""?", ":"")+"ข้อมูลต้องยาวไม่น้อยกว่า "+minlen+" ตัวอักษร";
		}else emsg += "กรุณากรอกข้อมูล";
	}
	return emsg!=""?(__emsg_with_name?"\""+args[0]+"\" ":"")+emsg:null;
}

function validateFunction(val, args, funcInd, elName) {
	var func = eval(args[funcInd]);
	if(func != null) {
		var fargs = new Array();
		for(var i=funcInd+1; i<args.length; i++) fargs[fargs.length] = args[i];
		return func(val, fargs, elName);
	}
	return null;
}

// radios	-	radio elements
// argStr	-	label, required, func, funcArgs
function validateRadio(radios, argStr) {
	var args = argStr.split(",");

	var val = null;
	for(var i=0; i<radios.length; i++) if(radios[i].checked) val = radios[i].value;

	var emsg = "";
	if(val==null && args[1]=='required') emsg += "กรุณาเลือก";

	var femsg = validateFunction(val, args, 2, radios[0].name);
	if(femsg != null) emsg += (emsg!=""?", ":"")+femsg;

	return emsg!=""?(__emsg_with_name?"\""+args[0]+"\" ":"")+emsg:null;
}
function getRadioValue(form, name) {
	var radio = form.elements[name];
	if(radio.length == null) radio = new Array(radio);
	for(var i=0; i<radio.length; i++) if(radio[i].checked) return radio[i].value;
	return null;
}


// select	-	select element
// argStr	-	label, required, minsel, maxsel, func, funcArgs
var __default_separator = ",";
function validateSelect(select, argStr) {
	var args = argStr.split(",");

	var val = getSelectValues(select);

	var emsg = "";
	if(val != null) {
		var sel = val.split(__default_separator);
		var minsel = parseInt(args[2], 10);
		if(!isNaN(minsel) && sel<minsel) emsg += (emsg!=""?", ":"")+"ต้องเลือกข้อมูลไม่น้อยกว่า "+minsel;

		var maxsel = parseInt(args[3], 10);
		if(!isNaN(maxsel) && sel>maxsel) emsg += (emsg!=""?", ":"")+"เลือกข้อมูลได้ไม่เกิน "+maxsel;
	}else {
		if(args[1]!='required') {
			var minsel = parseInt(args[2], 10);
			if(!isNaN(minsel)) emsg += (emsg!=""?", ":"")+"ต้องเลือกข้อมูลไม่น้อยกว่า "+minsel;
		}else emsg += "กรุณาเลือก";
	}

	var femsg = validateFunction(val, args, 4, select.name);
	if(femsg != null) emsg += (emsg!=""?", ":"")+femsg;

	return emsg!=""?(__emsg_with_name?"\""+args[0]+"\" ":"")+emsg:null;
}
function getSelectValues(select, separator) {
	if(separator == null) separator = __default_separator;
	var val = "";
	for(var i=0; i<select.options.length; i++)
		if(select.options[i].selected) val += (val!=""?separator:"")+select.options[i].value;
	return val!=""?val:null;
}

// checkbox	-	checkbox elements
// argStr	-	label, required, func, funcArgs
function validateCheckBox(checkboxs, argStr) {
	var args = argStr.split(",");

	var val = null;
	for(var i=0; i<checkboxs.length; i++) {
		if(checkboxs[i].checked) val = (val==null?"":", ")+checkboxs[i].value;
	}

	var emsg = "";
	if(val==null && args[1]=='required') emsg += "กรุณาเลือก";

	var femsg = validateFunction(val, args, 2, checkboxs[0].name);
	if(femsg != null) emsg += (emsg!=""?", ":"")+femsg;

	return emsg!=""?(__emsg_with_name?"\""+args[0]+"\" ":"")+emsg:null;
}
function getCheckboxValues(o, separator) {
  if(o == null) return "";
  if(o.length == null) return o.checked?o.value:"";
  if(separator == null) separator = ",";
  var ret = "";
  for(var i=0; i<o.length; i++)
   if(o[i].checked) ret += (ret!=""?separator:"")+o[i].value;
  return ret;
}
//######################################################

function _randomInt(maxVal) {
  var ret = "";
  while(maxVal>1) {
    ret+=((new Date().getTime())%maxVal);
    maxVal=maxVal/10;
  }
  return ret;
}
function randomPassword(len, chr) {
  if(chr == null) chr = "23456789abcdefghijkmnpqrstuvwxyz";
  var ret = '';
  while(ret.length<len) {
    var r = _randomInt(100000);
    while(r > chr.length) {
      ret += chr.charAt(r%chr.length);
      r = Math.round(r/chr.length);
    }
  }
  return ret.substring(0, len);
}
function setRandomPassword(form) {
  var p = randomPassword(6);
  if(confirm(p)) {
    form.elements['password1'].value = p;
    form.elements['password2'].value = p;
  }
}

function isAllowedChars(val, chars) {
  for(var i=0; i<val.length; i++)
    if(chars.indexOf(val.charAt(i)) < 0) return false;
  return true;
}

var _passwordChars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+=-[]:;/<>.,?{} ";
function isPasswordChars(val) {
  return isAllowedChars(val, _passwordChars)?null:"รหัสผ่านไม่ถูกต้อง";
}
function isConfirmPassword(val) {
  var emsg = isPasswordChars(val);

  var form = getForm();
  var p1 = form.elements['password1'];
  if(p1!=null && val!=p1.value) emsg = (emsg!=null?emsg+", ":"")+"ยืนยันรหัสผ่านไม่ตรงกัน";
  var p0 = form.elements['password0'];
  if(p0!=null && val==p0.value) emsg = (emsg!=null?emsg+", ":"")+"รหัสผ่านใหม่ตรงกับรหัสผ่านเดิม";

  return emsg;
}

var _password2008 = new Array("0123456789", "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "!@#$%^&*()_+=-[]:;/<>.,?{} ");
function isPassword2008(val) {
  var emsg = isPasswordChars(val);

  var n = 0;
  for(var i=0; i<_password2008.length; i++) {
    for(var c=0; c<val.length; c++)
      if(_password2008[i].indexOf(val.charAt(c)) >= 0){ n++; break; }
  }
  if(n < 3) emsg = (emsg!=null?emsg+", ":"")+"รหัสผ่านไม่ปลอดภัย";

  return emsg;
}
function setRandomPassword2008(form) {
  var p = randomPassword(1, "@#$%&*_+=-<>?")+
  			randomPassword(2, "ACDEFGHJKMNQRTWY")+
  			randomPassword(5, "23456789acdefghijkmnpqrtuvwxy");
  if(confirm(p)) {
    form.elements['password1'].value = p;
    form.elements['password2'].value = p;
  }
}
var _loginChars = "0123456789abcdefghijklmnopqrstuvwxyz";
function isLogin(val) {
  return isAllowedChars(val, _loginChars)?null:"รหัสผู้ใช้ไม่ถูกต้อง";
}

function isEmail(s) {
  var regExp =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+$/;
  return regExp.test(s)?null:"อีเมล์ไม่ถูกต้อง";
}
function isEmail2(s) {
  var form = getForm();
  var emsg = isEmail(s);
  return emsg!=null?emsg:(form.elements['email1'].value==form.elements['email2'].value?"อีเมล์สำรองต้องไม่ตรงกับอีเมล์หลัก":null);
}
function isMobile(s) {
  var regExp1 =  /^08\d{8}/;
  var regExp2 =  /^09\d{8}/;
  return regExp1.exec(s)+''==s || regExp2.exec(s)+''==s?null:"หมายเลขโทรศัพท์ไม่ถูกต้อง";
}
