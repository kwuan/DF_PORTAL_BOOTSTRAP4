var _orgTable=new Array('orgTable'), _hiddenOrgID=new Array('org_id'), _idPrefix=new Array('_org_id_'), _orgTreeMode=new Array('A');
var _required=new Array(), _changeFunc=new Array(), _rootOrgID=new Array();
function _toSelectOrgHTML(level, orgs, selected, ind) {
	var html = '<select name="'+_idPrefix[ind]+level+'" onchange="_changeOrg(this, '+ind+')"'+
			(level==0&&_required[ind]?' lang="property[\'สังกัด\',required]"':'')+'>';
	html += '<option value=""></option>';
	for(var n=0; n<orgs.length; n++)
		html += '<option value="'+orgs[n].id+'"'+(selected!=null&&selected==orgs[n].id?' selected':'')+'>'+
				(orgs[n].isLegalOrg=='Y'?'':' * ')+orgs[n].name+'</option>'
	html += '</select>'+(level==0&&_required[ind]?'<font color="red">*</font>':'');
	return html;
}
function _changeOrg(orgObj, ind) {
	var name = orgObj.name;
	var orgID = orgObj.options[orgObj.selectedIndex].value;
	var level = parseInt(name.substring(_idPrefix[ind].length), 10);
	var orgTable = document.getElementById(_orgTable[ind]);

	//delete all childs cell
	while(level<orgTable.rows.length-1) orgTable.deleteRow(orgTable.rows.length-1);

	if(orgID != '') {
		var childs = _getChilds(orgID, ind);
		if(childs.length > 0) //insert new child cell
			orgTable.insertRow().insertCell().innerHTML = _toSelectOrgHTML(level+1, childs, null, ind);
	}
	var val = orgObj.form.elements[_hiddenOrgID[ind]].value = getSelectedOrgID(orgObj.form, ind);

	if(_changeFunc[ind]!=null) {
		var func = eval(_changeFunc[ind]);
		if(func != null) func(val);
	}
}
function getSelectedOrgID(form, ind) {
	var ret = "";
	for(var i=0; ; i++) {
		var orgObj = form.elements[_idPrefix[ind]+i];
		if(orgObj == null) break;
		var orgVal = orgObj.options[orgObj.selectedIndex].value;
		if(orgVal != '') ret = orgVal;
	}
	return ret;
}
function getSelectedOrgName(form, ind) {
	var ret = "";
	for(var i=0; ; i++) {
		var orgObj = form.elements[_idPrefix[ind]+i];
		if(orgObj == null) break;
		var orgVal = orgObj.options[orgObj.selectedIndex].text;
		if(orgVal != '') ret = orgVal;
	}
	return ret;
}
function initSelectOrg(hiddenOrgIDName, orgTreeMode, viewPath, orgTableId, idPrefix, ind, required, changeFunc, rootOrgID) {
	if(ind == null) ind = 0;
	if(orgTableId != null) _orgTable[ind] = orgTableId;
	if(hiddenOrgIDName != null) _hiddenOrgID[ind] = hiddenOrgIDName;
	if(idPrefix != null) _idPrefix[ind] = idPrefix;
	if(orgTreeMode != null) _orgTreeMode[ind] = orgTreeMode;
	if(changeFunc != null) _changeFunc[ind] = changeFunc;
	if(rootOrgID != null) _rootOrgID[ind] = rootOrgID;
	if(required) _required[ind] = true;

	if(getForm().elements[_hiddenOrgID[ind]] == null) return;
	var orgID = getForm().elements[_hiddenOrgID[ind]].value;
	var orgTable = document.getElementById(_orgTable[ind]);

	while(orgTable.rows.length > 0) orgTable.deleteRow(orgTable.rows.length-1);

	if(viewPath) {
		if(orgID!=null && orgID!='') {
			var parents = _getParents(orgID, ind);
			var path = "";
			for(var p=0; p<parents.length; p++) {
				var parentOrg = parents[parents.length-1-p];
				path += " / "+parentOrg.sname;
			}
			var org = loadOrg(orgID);
			if(org != null) path += " / "+org.sname;
			orgTable.insertRow().insertCell().innerHTML = path;
		}
		return;
	}

	if(rootOrgID != null) {
		var childs = rootOrgID!=''?_getChilds(rootOrgID, ind):new Array();
		if(childs.length > 0) //insert new child cell
			orgTable.insertRow().insertCell().innerHTML = _toSelectOrgHTML(0, childs, null, ind);
	}else if(orgID!=null && orgID!='') {
		var parents = _getParents(orgID, ind);
		for(var p=0; p<parents.length; p++) {
			var parentOrg = parents[parents.length-1-p];
			orgTable.insertRow().insertCell().innerHTML = _toSelectOrgHTML(p, _getNeighbours(parentOrg.id, ind), parentOrg.id, ind);
		}
		var childs = _getChilds(orgID, ind);
		orgTable.insertRow().insertCell().innerHTML = _toSelectOrgHTML(parents.length, _getNeighbours(orgID, ind), orgID, ind);
		if(childs.length > 0) //insert new child cell
			orgTable.insertRow().insertCell().innerHTML = _toSelectOrgHTML(parents.length+1, childs, null, ind);
	}else orgTable.insertRow().insertCell().innerHTML = _toSelectOrgHTML(0, _getRootOrg(ind), null, ind);
}

function _getRootOrg(ind) {
	return _listOrg('PpsService.listRootOrgs', null, ind);
}
function _getParents(orgId, ind) {
	return _listOrg('PpsService.listParentOrgs', orgId, ind);
}
function _getNeighbours(orgId, ind) {
	return _listOrg('PpsService.listNeighbourOrgs', orgId, ind);
}
function _getChilds(orgId, ind) {
	return _listOrg('PpsService.listChildOrgs', orgId, ind);
}
function _listOrg(dwrFunc, orgId, ind) {
	var func = eval(dwrFunc);
	var ret = null;
	if(func != null) {
		func(orgId, _orgTreeMode[ind], {
			callback: function(list) {
				ret = list;
			},
			async: false,
			errorHandler: userSessionErrorHandler
		});
	}
	return ret;
}
function loadOrg(orgId) {
	var ret = null;
	PpsService.loadOrg(orgId, {
		callback: function(org) {
			ret = org;
		},
		async: false,
		errorHandler: userSessionErrorHandler
	});
	return ret;
}
