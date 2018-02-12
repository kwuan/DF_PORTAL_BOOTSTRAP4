<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>
<script language="JavaScript">
<!--
function hasRole() {
	var form=getForm(), n=0;
	for(var i=0; form.elements['userRoleList['+i+'].isSelect']!=null; i++)
		if(form.elements['userRoleList['+i+'].isSelect'].checked) n++;
	if(n == 0) return '��س����͡����������ҹ���ҧ���� 1 �����';
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
	if(form.elements['personCheck'] == null) return '��سҡ�͡�Ţ��Шӵ�ǻ�ЪҪ����١��ͧ';
	return null;
}
function checkToDateStatus(val) {
	var form = getForm();
	var d = toDate(form.elements['formData.toDateStr'].value);
	if(d == null) return null;
	var ddiff = dateDiff(d, new Date());
	if(val=='Y' && ddiff>0) return 'ʶҹ����١��ͧ����ѹ�������ش';
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
				<h3 class="box-title">�����ż����ҹ</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">���ʼ����</label></div>
					<div class="col-md-2 col-sm-4 col-12">
						<%-- <nested:text property="formData.login" size="15" styleClass="form-control" maxlength="13" lang="property['���ʼ����',required,,13]" readonly="true" disabled="<%= !createMode.booleanValue() %>" /> --%>
						<nested:text property="formData.login" size="15" styleClass="form-control" maxlength="13" lang="property['���ʼ����',required,,13]" />
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
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">���� - ���ʡ��</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:write property="formData.personName" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">���˹�</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:write property="formData.personPosition" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">Ἱ�</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:write property="formData.personNodeName" />
					</div>
				</div>
				</nested:present>
				<nested:equal property="canChangePassword" value="true">
					<nested:equal property="createMode" value="true">
						<div class="row">
							<div class="col-md-3 col-sm-4 col-12"><label class="label-form">���ʼ�ҹ</label></div>
							<div class="col-md-2 col-sm-4">
								<nested:password styleClass="form-control" property="password1" size="20" maxlength="20" lang="property['���ʼ�ҹ',required,6,15,isPasswordChars]" />
							</div>
							<div class="col-md-2 col-sm-4 col-12">
								<nested:password styleClass="form-control" property="password2" size="20" maxlength="20" lang="property['�׹�ѹ���ʼ�ҹ',required,6,15,isPasswordChars]" />
							</div>
							<div class="col-1 p-0">
								<input type="button" class="btn btn-default" value="�������ʼ�ҹ" onclick="setRandomPassword(this.form)" />
							</div>
						</div>
					</nested:equal>
				</nested:equal>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">�ѹ�����ҹ</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<div class="row">
							<div class="col"><nested:text styleClass="form-control datepicker" property="formData.fromDateStr" disabled="<%= !editable.booleanValue() %>" /></div>
						    <div class="col-1">	�֧  </div>
						    <div class="col"><nested:text styleClass="form-control datepicker datetimepicker-input" property="formData.toDateStr" lang="property['�ѹ�������ش',,,,isToDate,formData.fromDateStr]" disabled="<%= !editable.booleanValue() %>" /></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">ʶҹ�</label></div>
					<div class="col-md-2 col-sm-4 col-12">
						<nested:select styleClass="form-control" property="formData.isActive" lang="property['',,,,checkToDateStatus]" disabled="<%= !editable.booleanValue() %>">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">�����˵�</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:textarea property="formData.remark" disabled="<%= !editable.booleanValue() %>"  styleClass="form-control" rows="3" cols="100" tabindex="7"/>
					</div>
				</div>
				<nested:equal property="editable" value="false">
				<div class="box-header with-border">
					<h3 class="box-title">����������к�</h3>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">����¹���ʼ�ҹ��������ش</label></div>
					<div class="col-md-2 col-sm-4 col-12"><nested:write property="formData.lastChangePasswordStr" /></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">�������к�����稤�������ش</label></div>
					<div class="col-md-2 col-sm-4 col-12"><nested:write property="formData.lastLoginSuccessStr" /></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">�������к��������稤�������ش</label></div>
					<div class="col-md-2 col-sm-4 col-12"><nested:write property="formData.lastLoginFailedStr" /></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4 col-12"><label class="label-form">�ӹǹ���駷���������к���������</label></div>
					<div class="col-md-2 col-sm-4 col-12"><nested:write property="formData.loginFailedCount" format="0" /></div>
				</div>
				</nested:equal>
				<nested:present property="userRoleList">
					<div class="box-header with-border">
						<h3 class="box-title">����������ҹ</h3>
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
								<input type="button" name="saveBtn" class="btn btn-success" value=" �ѹ�֡ " onclick="doCmd('doSave')" />
								<nested:equal property="canChangePassword" value="true"><nested:equal property="createMode" value="false">
									<input type="button" value=" ��˹����ʼ�ҹ " class="btn btn-warnning" onclick="doCmd('goPassword')" /></nested:equal>
								</nested:equal>
							</nested:equal>
							<input type="button" class="btn btn-default" value=" ��Ѻ� " onclick="doCmd('list')" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:form>
<%@ include file="/include/_footermenu.jsp" %>
