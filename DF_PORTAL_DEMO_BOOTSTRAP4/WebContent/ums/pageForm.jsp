<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/page">
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />

<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title"><nested:write property="formModeStr" />ข้อมูลหน้าจอ</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">รหัสหน้าจอ</label></div>
					<div class="col-md-3 col-sm-6 col-12">
						<nested:text property="formData.code" styleClass="form-control" maxlength="6" lang="property['รหัสหน้าจอ',required,6,6]" disabled="<%= !editable.booleanValue() %>" />
					</div>
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">ชื่อหน้าจอ</label></div>
					<div class="col-md-3 col-sm-6 col-12">
						<nested:text property="formData.name" styleClass="form-control" maxlength="200" lang="property['ชื่อหน้าจอ',required,,200]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">ระบบงาน</label></div>
					<div class="col-md-3 col-sm-6 col-12">
						<nested:select property="moduleId" disabled="<%= !editable.booleanValue() %>" styleClass="form-control select2">
							<option value=""></option>
							<nested:optionsCollection property="moduleList" label="name" value="id"/>
						</nested:select>
					</div>
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">ประเภทหน้าจอ</label></div>
					<div class="col-md-3 col-sm-6 col-12">
						<nested:select property="pageTypeId" disabled="<%= !editable.booleanValue() %>" styleClass="form-control select2">
							<option value=""></option>
							<nested:optionsCollection property="pageTypeList" label="name" value="id"/>
						</nested:select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">หน้าจอ</label></div>
					<div class="col-md-3 col-sm-6 col-12">
						<nested:text property="formData.path" styleClass="form-control" maxlength="200" lang="property['หน้าจอ',required,,200]" disabled="<%= !editable.booleanValue() %>" />
					</div>
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">ลำดับเมนู</label></div>
					<div class="col-md-3 col-sm-6 col-12">
						<div class="row">
							<div class="col"><nested:text property="formData.order" styleClass="form-control" maxlength="3" lang="property['ลำดับเมนู',,,3,isInt]" disabled="<%= !editable.booleanValue() %>" /></div>
							<div class="col p-2"><nested:checkbox property="formData.isMenu" value="Y" disabled="<%= !editable.booleanValue() %>" /> แสดงเมนู</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">รายละเอียด</label></div>
					<div class="col-md-8 col-sm-9 col-12">
						<nested:text property="formData.description" styleClass="form-control" maxlength="200" lang="property['รายละเอียด',,,200]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">สถานะ</label></div>
					<div class="col-md-3 col-sm-6 col-12">
						<nested:select property="formData.isActive" disabled="<%= !editable.booleanValue() %>" styleClass="form-control">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<nested:equal property="editable" value="true">
					<input type="button" class="btn btn-success mt-1" value=" บันทึก " onclick="doCmd('doSave')" />
				</nested:equal>
				<input type="button" class="btn btn-default mt-1" value=" กลับไป " onclick="doCmd('list')" />
			</div>
		</div>
	</div>
</div>
			
</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
