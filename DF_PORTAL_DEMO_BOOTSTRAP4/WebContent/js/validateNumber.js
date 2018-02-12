//	val		-	value
//	args	-	useDecimal minval maxval
function isNumber(val, args) {
	val = currencyToNumber(val);

	var emsg = "";
	if(val != null) {
		//var useDecimal = args[0]=='decimal';
		var useDecimal = args[0]=='true';
		if((!useDecimal) && (val.toString().indexOf(".")>0)) emsg = "กรุณาป้อนจำนวนเต็มเท่านั้น";

		var minval = new Number(args[1]);
		if(!isNaN(minval) && val<minval) emsg += (emsg!=""?", ":"")+"จำนวนต้องไม่น้อยกว่า "+numberToCurrency(minval, useDecimal);
		var maxval = new Number(args[2]);
		if(!isNaN(maxval) && val>maxval) emsg += (emsg!=""?", ":"")+"จำนวนต้องไม่เกิน "+numberToCurrency(maxval, useDecimal);
	} else {
		emsg = "กรุณาป้อนตัวเลขเท่านั้น";
	}

	return emsg!=""?emsg:null;
}

//	val		-	value
//	args	-	minval maxval
function isInt(val, args) {
	return isNumber(val, new Array(false, args[0], args[1]));
}

function formatNumber(element, useDecimal, decimalDigit) {
	if(element.readOnly) return;
	var val = currencyToNumber(element.value);
	element.value = numberToCurrency(val, useDecimal, decimalDigit);
}
function parseNumber(element, useDecimal) {
	if(element.readOnly) return;
	var val = currencyToNumber(element.value);
	element.value = val!=null?val:"";
}

function numberToCurrency( num, useDecimal, decimalDigit ) {
	if(num == null) return "";
	if(decimalDigit == null) decimalDigit = 2;
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num)) num = "0";
	var sign = (num == (num = Math.abs(num)));

	var cents = '';
	var exp = decimalDigit>0?10:1;
	for(var i=1; i<decimalDigit; i++) exp = exp*10;
	num = Math.floor(num*exp+0.50000000001);
	cents = ''+(num%exp);
	num = Math.floor(num/exp).toString();
	while(cents.length < decimalDigit) cents = "0" + cents;

	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	num = num.substring(0,num.length-(4*i+3))+','+
	num.substring(num.length-(4*i+3));

	return ( (sign?'':'-') + '' + num + (useDecimal?'.'+cents:'') );
}


function currencyToNumber(num) {	
	if(num == undefined) return "";
	var result = "";
	
	for(i = 0; i < num.length; i++) {
		var x = num.substr(i, 1);
		if(parseInt(x,10) >= 0 || parseInt(x,10) <= 9 || x == "." || x == "-") {
			result = result + x
		}else if(x != ",") return null;
	}
	if(result != "") return (new Number(result))+0;

	return null;
}


function keyNumber(e, val) {
	var keynum;
	if(window.event) {// IE
		keynum = e.keyCode;
	}else if(e.which) {// Netscape/Firefox/Opera
		keynum = e.which
		if(keynum == 8) return true; //backspace
	}
	var keychar = String.fromCharCode(keynum);
	if(val != null) {
		if(keychar=='.' && val.indexOf('.')<0) return true;
		if(keychar=='-' && val=='') return true;
	}
	var numcheck = /\d/;
	return numcheck.test(keychar);
}

	//input number only 
   function isNumberKey(evt) {
      var charCode = (evt.which) ? evt.which : event.keyCode
      if (charCode > 31 && (charCode < 48 || charCode > 57))
         return false;

      return true;
   }
