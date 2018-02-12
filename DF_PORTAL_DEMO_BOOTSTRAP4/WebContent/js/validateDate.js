var isCorrectDate;

//	val		-	value
//	args	-	minDate maxDate
function isDate(val, args, elName) {
	if(formatDate(null, val)) {
		return null;
	} else {
		return "วันที่ไม่ถูกต้อง";
	}
}

function isToDate(val, args, elName) {
	if(formatDate(null, val)) {
		var d1 = toDate(getForm().elements[args[0]].value);
		var d2 = toDate(val);
		if(d1>d2) return "ช่วงวันที่ไม่ถูกต้อง";
		return null;
	} else {
		return "วันที่ไม่ถูกต้อง";
	}
}

function toDate(str) {
  if(str==null || str.length<10 || str.charAt(2)!='/' || str.charAt(5)!='/') return null;
  var dd = parseInt(str.substring(0, 2), 10);
  var MM = parseInt(str.substring(3, 5), 10);
  var yyyy = parseInt(str.substring(6, 10), 10)-543;
  if(isNaN(yyyy) || isNaN(MM) || isNaN(dd)) return null;
  return new Date(yyyy, MM-1, dd);
}
var DAY_MILLIS = 86400000;
function dateDiff(d1, d2) {
  return (d2-d1)/DAY_MILLIS;
}

function formatDate(element, val) {
	isCorrectDate=true;
	var date;
	if (element==null) {
		date = val;
	} else {
		date=element.value;
	}
	if(date == '') return;
	var length=date.length;
	var sep=0;
	date = date.replace(' ','/');
	date = date.replace('-','/');
	//element.value = date;
	for (var i=0;i<length;i++){
		if (date.substring(i,i+1)=="/")
			sep++;
	}//end for
	if (sep==2) {
		checkDMY(element,date,"/");
	} else if (length==6){// 010121
		var day=date.substring(0,2);
		var month=date.substring(2,4);
		var year="25"+date.substring(4,6);
		checkDate(element,day,month,year);
	} else if (length==8){// 01012521
		var day=date.substring(0,2);
		var month=date.substring(2,4);
		var year=date.substring(4,8);
		checkDate(element,day,month,year);
	} else { 
		isCorrectDate = false;
	}
	if (date==null||date=="") {
		isCorrectDate = false;
	}
	if (element!=null) {
		if (!isCorrectDate) { 		
			addError('วันที่ไม่ถูกต้อง', element);
		} else {
			setError(null, element);
		}
	}
	return isCorrectDate;
}

function checkDMY(element,date,sep){
	var firstIndex=0, lastIndex=0;
	var day,month,year;
	var length = date.length;
	firstIndex = date.indexOf(sep);
	lastIndex = date.lastIndexOf(sep);
	day = date.substring(0,firstIndex);
	month = date.substring(firstIndex+1,lastIndex);
	year = date.substring(lastIndex+1,length);

	var isDayNaN=isNaN(day);
	var isMonthNaN=isNaN(month);
	var isYearNaN=isNaN(year);
	//check day in month
	if (isDayNaN) {
		isCorrectDate = false;
	}
	if (day>0&&day<10&&day.length==1&&isDayNaN==false) {
		day="0"+day;
	}

	//check year
	if (isYearNaN) {
		isCorrectDate = false;
	}
	if (year.length==2) {
		year="25"+year;
	}

		//check month
	if (isMonthNaN) {
		isCorrectDate = false;
	}
	if (month>0&&month<9&&month.length==1&&isMonthNaN==false) {
		month="0"+month;
	}
	if (Number(month)>0 && Number(month)<=12) {
		checkDate(element,day,month,year);
	} else {
		isCorrectDate = false;
	}
}

function checkDate(element,day,month,year){
	if(isNaN(parseInt(day)) || isNaN(parseInt(month)) || isNaN(parseInt(year))) {
		isCorrectDate = false; return;
	}
	var theDate=day;
	var theMonth=month;
	var theYear=year-543;
	var maxDate=0;
	
	if(theMonth=='01'||theMonth=='03'||theMonth=='05'||theMonth=='07'||theMonth=='08'||theMonth=='10'||theMonth=='12') 	{
		maxDate=31;
	} else if(theMonth=='04'||theMonth=='06'||theMonth=='09'||theMonth=='11')  {
		maxDate=30; 
	} else if (theMonth=='02') {
			if (theYear%400==0) 
				maxDate=29;
			else if(theYear%100==0)  
				maxDate=28;
			else if(theYear%4==0) 
				maxDate=29;
			else maxDate=28;
	}
	
	if(!(theDate<=0||theDate>maxDate)){
		if (element!=null) {
			element.value=day+"/"+month+"/"+year;
		}			
	} else { 
		isCorrectDate = false;
	}
}

function checkDiffDate(fromDate, toDate) {
        d1 = new Date( fromDate.substr(6,4), (parseInt(fromDate.substr(3,2),10) - 1), fromDate.substr(0,2), 0,0,0,0);
        d2 = new Date( toDate.substr(6,4), (parseInt(toDate.substr(3,2),10) - 1), toDate.substr(0,2), 0,0,0,0);
        return d2 - d1
}

function checkDateFromDateTo(fromDate, toDate){
	var passDate = true;
	
	if (fromDate.trim != "" && toDate.trim != "") {
		if(checkDiffDate(fromDate, toDate) < 0){ 
			alert('มีข้อผิดลาด! วันที่เริ่มไม่ควรมากกว่าวันสิ้นสุด');
			passDate = false;
		}
	} else {
		passDate = false;
	}
	
	return passDate;
}