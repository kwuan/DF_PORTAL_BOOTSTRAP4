<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>
<script language="JavaScript">
<!--
function hasRole() {
	var form=getForm(), n=0;
	for(var i=0; form.elements['userRoleList['+i+'].isSelect']!=null; i++)
		if(form.elements['userRoleList['+i+'].isSelect'].checked) n++;
	if(n == 0) return 'กรุณาเลือกกลุ่มผู้ใช้งานอย่างน้อย 1 กลุ่ม';
	return null;
}
function setPersonLogin(personLogin) {
	setPerson(personLogin);
}
function setPerson(psnId) {
	var form = getForm();
	if(psnId != null) form.elements['psnId'].value = psnId;
	form.elements['formData.login'].value = form.elements['psnId'].value;
	doCmd('setPerson');
}
function hasPerson() {
	var form = getForm();
	if(form.elements['personCheck'] == null) return 'กรุณากรอกเลขประจำตัวประชาชนที่ถูกต้อง';
	return null;
}
function checkToDateStatus(val) {
	var form = getForm();
	var d = toDate(form.elements['formData.toDateStr'].value);
	if(d == null) return null;
	var ddiff = dateDiff(d, new Date());
	if(val=='Y' && ddiff>0) return 'สถานะไม่ถูกต้องตามวันที่สิ้นสุด';
	return null; 
}
// -->
</script>

<nested:form action="/ums/user">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="editable" property="editable" type="Boolean" />
<nested:define id="createMode" property="createMode" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />
<nested:hidden property="psnId" />


<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">ข้อมูลผู้ใช้งาน</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">รหัสผู้ใช้</label></div>
					<div class="col-md-2 col-sm-4 col-12">
						<%-- <nested:text property="formData.login" size="15" styleClass="form-control" maxlength="13" lang="property['รหัสผู้ใช้',required,,13]" readonly="true" disabled="<%= !createMode.booleanValue() %>" /> --%>
						<nested:text property="formData.login" size="15" styleClass="form-control" maxlength="13" lang="property['รหัสผู้ใช้',required,,13]" />
					</div>
					<%-- <div class="col-md-2 col-sm-4 col-2">
						<div class="row"> 
							<div class="col"><nested:equal property="createMode" value="true"><input type="button" class="btn btn-default" value=" ... " onclick="popupWindow('<%= request.getContextPath() %>/pis/personSearch.do?cmd=initial&selectMode=single', 900, 600)" /></nested:equal></div>
							<div class="col"><nested:equal property="createMode" value="true"><input type="button" class="btn btn-default" value=" ... " data-toggle="modal" data-target=".personSearch" /></nested:equal></div>
						</div>
					</div> --%>
				</div>
				<nested:present property="formData.person">
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">ชื่อ - นามสกุล</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:write property="formData.personName" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">ตำแหน่ง</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:write property="formData.personPosition" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">แผนก</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:write property="formData.personNodeName" />
					</div>
				</div>
				</nested:present>
				<nested:equal property="canChangePassword" value="true">
					<nested:equal property="createMode" value="true">
						<div class="row">
							<div class="col-md-3 col-sm-4 col-12"><label class="label-form">รหัสผ่าน</label></div>
							<div class="col-md-2 col-sm-4">
								<nested:password styleClass="form-control" property="password1" size="20" maxlength="20" lang="property['รหัสผ่าน',required,6,15,isPasswordChars]" />
							</div>
							<div class="col-md-2 col-sm-4 col-12">
								<nested:password styleClass="form-control" property="password2" size="20" maxlength="20" lang="property['ยืนยันรหัสผ่าน',required,6,15,isPasswordChars]" />
							</div>
							<div class="col-1 p-0">
								<input type="button" class="btn btn-default" value="สุ่มรหัสผ่าน" onclick="setRandomPassword(this.form)" />
							</div>
						</div>
					</nested:equal>
				</nested:equal>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">วันที่ใช้งาน</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<div class="row">
							<div class="col"><nested:text styleClass="form-control datepicker" property="formData.fromDateStr" disabled="<%= !editable.booleanValue() %>" /></div>
						    <div class="col-1">	ถึง  </div>
						    <div class="col"><nested:text styleClass="form-control datepicker datetimepicker-input" property="formData.toDateStr" lang="property['วันที่สิ้นสุด',,,,isToDate,formData.fromDateStr]" disabled="<%= !editable.booleanValue() %>" /></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">สถานะ</label></div>
					<div class="col-md-2 col-sm-4 col-12">
						<nested:select styleClass="form-control" property="formData.isActive" lang="property['',,,,checkToDateStatus]" disabled="<%= !editable.booleanValue() %>">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">หมายเหตุ</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:textarea property="formData.remark" disabled="<%= !editable.booleanValue() %>"  styleClass="form-control" rows="3" cols="100" tabindex="7"/>
					</div>
				</div>
				<nested:equal property="editable" value="false">
				<div class="box-header with-border">
					<h3 class="box-title">การเข้าสู่ระบบ</h3>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">เปลี่ยนรหัสผ่านครั้งล่าสุด</label></div>
					<div class="col-md-2 col-sm-4 col-12"><nested:write property="formData.lastChangePasswordStr" /></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">เข้าสู่ระบบสำเร็จครั้งล่าสุด</label></div>
					<div class="col-md-2 col-sm-4 col-12"><nested:write property="formData.lastLoginSuccessStr" /></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">เข้าสู่ระบบไม่สำเร็จครั้งล่าสุด</label></div>
					<div class="col-md-2 col-sm-4 col-12"><nested:write property="formData.lastLoginFailedStr" /></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">จำนวนครั้งที่เข้าสู่ระบบไม่สำเร็จ</label></div>
					<div class="col-md-2 col-sm-4 col-12"><nested:write property="formData.loginFailedCount" format="0" /></div>
				</div>
				</nested:equal>
				<nested:present property="userRoleList">
					<div class="box-header with-border">
						<h3 class="box-title">กลุ่มผู้ใช้งาน</h3>
					</div>
					<div class="row">
						<div class="col-md-6 col-12">
							<table class="table table-responsive table-bordered table-hover">
								<tbody>
									<nested:iterate id="userRole" indexId="ind" property="userRoleList">
										<tr class="tr<%= ind.intValue()%2 %>">
											<td width="10" align="center"><nested:checkbox property="isSelect" value="Y" disabled="<%= !editable.booleanValue() %>" /></td>
											<td width="30%"><nested:write property="role.code" /></td>
											<td width="70%"><nested:write property="role.name" /></td>
										</tr>
									</nested:iterate>
								</tbody>
							</table>
						</div>
					</div>
				</nested:present>
				<div class="box-footer text-center">
					<div class="row">
						<div class="col align-self-center">
							<nested:equal property="editable" value="true">
								<input type="button" name="saveBtn" class="btn btn-success" value=" บันทึก " onclick="doCmd('doSave')" />
								<nested:equal property="canChangePassword" value="true"><nested:equal property="createMode" value="false">
									<input type="button" value=" กำหนดรหัสผ่าน " class="btn btn-warnning" onclick="doCmd('goPassword')" /></nested:equal>
								</nested:equal>
							</nested:equal>
							<input type="button" class="btn btn-default" value=" กลับไป " onclick="doCmd('list')" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:form>
<%@ include file="/include/_footermenu.jsp" %>
