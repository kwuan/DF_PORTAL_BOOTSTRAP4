<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/module">
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />

<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title"><nested:write property="formModeStr" />�������к��ҹ</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">�ͤ͹</label></div>
					<div class="col-md-2 col-sm-4 col-12">
						<nested:text property="formData.code" styleClass="form-control" maxlength="3" lang="property['�����к��ҹ',required,3,3]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">�����к��ҹ</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:text property="formData.name" styleClass="form-control" maxlength="50" lang="property['�����к��ҹ',required,,50]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">��������´</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:text property="formData.description" styleClass="form-control" maxlength="200" lang="property['��������´',,,200]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">�ӴѺ����</label></div>
					<div class="col-md-1 col-sm-2 col-6">
						<nested:text property="formData.order" styleClass="form-control" maxlength="3" lang="property['�ӴѺ����',,,3,isInt]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
			</div>
			<div class="box-footer">
				<nested:equal property="editable" value="true">
					<input type="button" class="btn btn-success mt-1" value=" �ѹ�֡ " onclick="doCmd('doSave')" />
				</nested:equal>
				<input type="button" value=" ��Ѻ� " class="btn btn-default mt-1" onclick="doCmd('list')" />
			</div>
		</div>
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
