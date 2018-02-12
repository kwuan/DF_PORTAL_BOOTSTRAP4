<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<%@page import="com.depthfirst.framework.ums.web.UserSession"%>
<script language="JavaScript">
<!--
function doAddPage(val) {
	var form = getForm();
	form.elements['add_page_code'].value = val;
	doCmdA('doAddPage', 'a_page');
}
function hasPriv() {
	return getForm().elements['delete_ind']==null?'กรุณาเพิ่มสิทธิของกลุ่มผู้ใช้งานอย่างน้อย 1 สิทธิ':null;
}

function doCheckRightAll(form, ind) {
	if(form == null) return;
	var cbAll = form.elements['right_all['+ind+']'];
	if(cbAll == null) return;
	for(var i=0; form.elements['formPrivilegeList['+i+'].rightVals['+ind+'].value']!=null; i++)
		form.elements['formPrivilegeList['+i+'].rightVals['+ind+'].value'].checked = cbAll.checked;
}
function doCheckRightId(form, name) {
	if(form == null) return;
	var ind = getNameIndex(name)[1];
	var cbAll = form.elements['right_all['+ind+']'];
	if(cbAll == null) return;
	cbAll.checked = true;
	for(var i=0; form.elements['formPrivilegeList['+i+'].rightVals['+ind+'].value']!=null; i++)
		if(!form.elements['formPrivilegeList['+i+'].rightVals['+ind+'].value'].checked) cbAll.checked = false;
}
function initCheckRightAll() {
	var form = getForm();
	for(var r=0; form.elements['right_all['+r+']']!=null; r++) {
		form.elements['right_all['+r+']'].checked = true;
		for(var i=0; form.elements['formPrivilegeList['+i+'].rightVals['+r+'].value']!=null; i++)
			if(!form.elements['formPrivilegeList['+i+'].rightVals['+r+'].value'].checked)
				form.elements['right_all['+r+']'].checked = false;
	}
}
// -->
</script>

<nested:form action="/ums/role">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="add_page_code" value="" />
<nested:hidden property="formData.id" />

<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title"><nested:write property="formModeStr" />ข้อมูลกลุ่มผู้ใช้งาน</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-2 col-sm-2 col-12"><label class="label-form">รหัสหน้าจอ</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:text property="formData.code" styleClass="form-control" maxlength="10" lang="property['รหัสกลุ่มผู้ใช้งาน',required,,10]" disabled="<%= !editable.booleanValue() %>" />
					</div>
					<div class="col-md-2 col-sm-2 col-12"><label class="label-form">ชื่อกลุ่มผู้ใช้งาน</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:text property="formData.name" styleClass="form-control" maxlength="50" lang="property['ชื่อกลุ่มผู้ใช้งาน',required,,50]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-2 col-12"><label class="label-form">สิทธิอัตโนมัติ</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:select property="formData.isAuto" disabled="<%= !editable.booleanValue() %>" styleClass="form-control">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
					<div class="col-md-2 col-sm-2 col-12"><label class="label-form">สถานะ</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:select property="formData.isActive" disabled="<%= !editable.booleanValue() %>" styleClass="form-control">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-2 col-12"><label class="label-form">รายละเอียด</label></div>
					<div class="col-sm-10 col-12">
						<nested:text property="formData.description" styleClass="form-control" maxlength="200" lang="property['รายละเอียด',,,200]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
			</div>
			<div class="box-footer">
				<nested:equal property="editable" value="true">
					<a name="a_page" ></a>
					<input type="button" class="btn btn-primary mt-1" name="addPrivBtn" lang="property[hasPriv]" value="เพิ่มสิทธิของกลุ่มผู้ใช้งาน" onclick="popupCmd('listModulePage', 800, 600)" />
					<input type="button" class="btn btn-danger mt-1" value="ลบสิทธิของกลุ่มผู้ใช้งาน" onclick="doCmdA('doDeletePage', 'a_page')" />
				</nested:equal>
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col">
						<div class="box-responsive">
							<table class="table table-responsive table-bordered table-hover">
								<thead>
   									<tr class="dark">
										<nested:equal property="editable" value="true">
											<th width="2%"><input type="checkbox" name="delete_all" onclick="doCheckAll(this.form, 'delete_all', 'delete_ind')" /></th>
										</nested:equal>
										<th>ระบบงาน
											<nested:equal name="<%= pageCode %>" property="createMode" value="false"><br/>
												<nested:select property="formModuleId" onchange="doCmd('changeFormModule')" styleClass="form-control select2 col-5">
													<option value="">ทั้งหมด</option>
													<nested:optionsCollection property="formModuleList" value="id" label="name" />
												</nested:select>
											</nested:equal>
										</th>
										<th>ประเภทหน้าจอ</th>
										<th>รหัสหน้าจอ</th>
										<th>ชื่อหน้าจอ</th>
										<% for(int i=0; i<UserSession.RIGHT_LABELS.length; i++) { %>
											<th class="text-center"><%= UserSession.RIGHT_LABELS[i] %>
												<nested:equal name="<%= pageCode %>" property="editable" value="true"><br/>
													<input type="checkbox" name="right_all[<%= i %>]" onclick="doCheckRightAll(this.form, <%= i %>)" />
												</nested:equal>
											</th>
										<% } %>
   									</tr>
								</thead>
								<nested:iterate id="priv" indexId="ind" property="formPrivilegeList">
								<tbody>
									<tr class="tr<%= ind.intValue()%2 %>">
										<nested:equal name="<%= pageCode %>" property="editable" value="true">
											<td><input type="checkbox" name="delete_ind" value="<%= ind %>" onclick="doCheckId(this.form, 'delete_all', 'delete_ind')" /></td>
										</nested:equal>
										<td width="25%"><nested:write property="page.module.name" /></td>
										<td width="12%"><nested:write property="page.pageType.name" /></td>
										<td><nested:write property="page.code" /></td>
										<td><nested:write property="page.name" /></td>
										<nested:iterate id="rightVal" property="rightVals">
											<td align="center"><nested:checkbox property="value" value="Y" disabled="<%= !editable.booleanValue() %>"  onclick="doCheckRightId(this.form, this.name)" /></td>
										</nested:iterate>
									</tr>
								</tbody>
								</nested:iterate>
							</table>
							<%@ include file="/include/_cursor.jsp" %>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<nested:equal property="editable" value="true">
					<input type="button" class="btn btn-success" value=" บันทึก " onclick="doCmd('doSave')" />
				</nested:equal>
				<input type="button" class="btn btn-default" value=" กลับไป " onclick="doCmd('list')" />
			</div>
		</div>
	</div>
</div>

</nested:form>
<script language="JavaScript">
<!--
initCheckRightAll();
// -->
</script>

<%@ include file="/include/_footermenu.jsp" %>
