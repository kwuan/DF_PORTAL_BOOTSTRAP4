function getForm() {
	return document.forms[0];
}
function doCmd(cmd, index) {
	if(cmd=='doSave' && !validateForm(getForm())) return;
	/*if(cmd=='doDelete' && !confirm('ยืนยันการลบข้อมูล')) return;*/
	if(cmd=='doDelete'){
		swal({
			title: 'Delete ?',
			text: "ยืนยันการลบข้อมูล",
		  	type: 'warning',	
		  	showCancelButton: true,
		  	confirmButtonText: 'Yes',
		  	cancelButtonText: 'No'
		}).then((result) => {
			  if (result.value) {
				  swal(
				      'Deleted!',
				      'success'
				    )
			  }
		});
	}
	
	var form = getForm();
	form.elements['cmd'].value = cmd;
	if(index != null) form.elements['data_index'].value = index;
	form.submit();
}
function doCmdA(cmd, aname, index) {
	var form = getForm();
	form.elements['cmd'].value = cmd;
	if(aname == null) aname = cmd;
	form.action += "#"+aname;
	if(index != null) form.elements['data_index'].value = index;
	form.submit();
}
function popupCmd(cmd, width, height, fixsize, noscrolls) {
	var form = getForm();
	form.elements['cmd'].value = cmd;
	submitPopup(form, form.action, width, height, fixsize, noscrolls);
}
function doGoto(pos) {
	var form = getForm();
	if(form.elements['searchCondition.position'] != null)
		form.elements['searchCondition.position'].value = pos;
	form.elements['cmd'].value = 'list';
	form.submit();
}
function doSort(orderBy, orderDesc) {
	var form = getForm();
	form.elements['searchCondition.orderBy'].value = orderBy;
	form.elements['searchCondition.orderDesc'].value = orderDesc;
	form.elements['searchCondition.position'].value = 0;
	form.elements['cmd'].value = 'list';
	form.submit();
}

function getNameIndex(name) {
	if(name == null) return null;
	var ret = new Array();
	while(name.indexOf('[') > 0) {
		ret[ret.length] = parseInt( name.substring(name.indexOf('[')+1, name.indexOf(']')) );
		name = name.substring(name.indexOf(']')+1);
	}
	return ret.length==0?null:ret;
}
