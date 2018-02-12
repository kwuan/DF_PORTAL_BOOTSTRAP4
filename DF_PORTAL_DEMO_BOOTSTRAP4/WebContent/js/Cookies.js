function setCookie(strName, strValue, intExpire, strPath, strDomain)
{
	var strSetCookieStatement;
	var dateToday = new Date;
	var dateExpires = new Date;

	if((strName != null)&&(typeof(strName) !=" undefined"))
	{
		strSetCookieStatement = escape(strName) + "=";

		if((strValue != null)&&(typeof(strValue) !=" undefined"))
			strSetCookieStatement = strSetCookieStatement + escape(strValue);

		if((intExpire != null)&&(typeof(intExpire) != "undefined")) {
			dateExpires.setTime(dateToday.getTime() + (60 * 60 * 24 * 1000 * intExpire));
			strSetCookieStatement = strSetCookieStatement + "; expires=" + dateExpires.toGMTString();
		}

		if((strPath != null)&&(typeof(strPath) != "undefined")) {
			strSetCookieStatement = strSetCookieStatement + "; path=" + escape(strPath);
		}

		if((strDomain != null)&&(typeof(strDomain) != "undefined")) {
			strSetCookieStatement = strSetCookieStatement + "; domain=" + escape(strDomain);
		}

		strSetCookieStatement = strSetCookieStatement + ";";

		document.cookie = strSetCookieStatement;
	}
}

function setCookieParameter(strName, intExpire, strPath, strDomain)
{
	var strSetCookieStatement;
	var dateToday = new Date;
	var dateExpires = new Date;

	var intOffset, intEnd;
	var strSearch = strName + "=";
	var strValue;

	if((strName != null)&&(typeof(strName) !=" undefined"))
	{
		strSetCookieStatement = escape(strName) + "=";

		if (document.cookie.length > 0) {
			intOffset = document.cookie.indexOf(strSearch);
		 	if (intOffset != -1) {
	 			intOffset += strSearch.length;
	 			intEnd = document.cookie.indexOf(";", intOffset);
		 		if (intEnd == -1)
		 			intEnd = document.cookie.length;
	 			strValue = document.cookie.substring(intOffset, intEnd);
		 	}
		 }

		if((strValue != null)&&(typeof(strValue) !=" undefined"))
			strSetCookieStatement = strSetCookieStatement + strValue;

		if((intExpire != null)&&(typeof(intExpire) != "undefined")) {
			dateExpires.setTime(dateToday.getTime() + intExpire);
			strSetCookieStatement = strSetCookieStatement + "; expires=" + dateExpires.toGMTString();
		}

		if((strPath != null)&&(typeof(strPath) != "undefined")) {
			strSetCookieStatement = strSetCookieStatement + "; path=" + escape(strPath);
		}

		if((strDomain != null)&&(typeof(strDomain) != "undefined")) {
			strSetCookieStatement = strSetCookieStatement + "; domain=" + escape(strDomain);
		}

		strSetCookieStatement = strSetCookieStatement + ";";

		document.cookie = strSetCookieStatement;
	}
}

function getCookie(strName)
{
	var intOffset, intEnd;
	var strSearch = strName + "=";

	 if (document.cookie.length > 0) {
		intOffset = document.cookie.indexOf(strSearch);
	 	if (intOffset != -1) {
	 		intOffset += strSearch.length;
	 		intEnd = document.cookie.indexOf(";", intOffset);
	 		if (intEnd == -1)
	 			intEnd = document.cookie.length;
	 		return unescape(document.cookie.substring(intOffset, intEnd));
	 	}
	 }
}

function getCookieWithKeys(strName, strKey)
{
	var strValue = getCookie(strName);
	var intOffset, intEnd;
	var strSearch = strKey + "=";

	if ((typeof(strValue) != "undefined")&&(strValue != null)&&(strValue.length > 0)) {
		intOffset = strValue.indexOf(strSearch);
	 	if (intOffset != -1) {
	 		intOffset += strSearch.length;
	 		intEnd = strValue.indexOf("&", intOffset);
	 		if (intEnd == -1)
	 			intEnd = strValue.length;
	 		return unescape(strValue.substring(intOffset, intEnd));
	 	}
	 }	
}