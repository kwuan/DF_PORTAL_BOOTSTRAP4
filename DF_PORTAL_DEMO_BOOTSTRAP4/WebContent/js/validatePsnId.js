function _isPersonalID(TSSN) {
	var xCheck = 0;
	var g = 0;
	var c = 0;
	var totalX = 0;
	var sumX = 0;

	var x = new Array();
	for(var i=0; i<13; i++) x[i] = 0;

	if ( TSSN.length != 13 ) return false;

	for (var q=0; q<TSSN.length; ++q) {
		var codee=TSSN.charCodeAt(q);
		if(codee>=48 && codee<=57) {
			if(codee == 48)
					{ x[q] = 0; }
				else if(codee ==49)
					{ x[q] = 1; }
				else if(codee == 50)
					{ x[q] = 2; }
				else if(codee == 51)
					{ x[q] = 3; }
				else if(codee == 52)
					{ x[q] = 4; }
				else if(codee == 53)
					{ x[q] = 5; }
				else if(codee == 54)
					{ x[q] = 6; }
				else if(codee == 55)
					{ x[q] = 7; }
				else if(codee == 56)
					{ x[q] = 8; }
				else if(codee == 57)
					{ x[q] = 9; }

				if (x[0] == 0) return false;
				if (x[0] == 9) return false;

				xCheck = x[q];

			if(q != 12){
				totalX = x[q]*(13-q);
				sumX = sumX + totalX;
			}
			continue;
		}else return false;

	}// end for

	c = sumX % 11;
	if (c==0) g=1;
	else if (c==1) g=0;
			else g = 11- c;

	if (xCheck != g) return false;

	return true;
}

function isPsnId(val) {
  return _isPersonalID(val)?null:"เลขประจำตัวประชาชนไม่ถูกต้อง";
}
