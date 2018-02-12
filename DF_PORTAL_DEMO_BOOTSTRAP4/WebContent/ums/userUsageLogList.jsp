<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/userUsageLog">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">���һ���ѵԡ����ҹ</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-2 col-12"><label class="label-form">�ѹ���</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<div class="row">
							<div class="col"><nested:text styleClass="form-control datepicker" property="searchCondition.startDate"/></div>
						    <div class="col-1 pl-1">�֧ </div>
						    <div class="col"><nested:text styleClass="form-control datepicker" property="searchCondition.endDate" lang="property['�ѹ�������ش',,,,isToDate,searchCondition.startDate]" /></div>
						</div>
					</div>
					<div class="col-sm-2 col-12"><label class="label-form">IP Address</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:text property="searchCondition.ipAddress" styleClass="form-control" maxlength="20" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2 col-12"><label class="label-form">���ʼ����</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:text property="searchCondition.login" styleClass="form-control" maxlength="20" />
					</div>
					<div class="col-sm-2 col-12"><label class="label-form">����˹�Ҩ�</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:text property="searchCondition.pageCode" styleClass="form-control" maxlength="10" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2 col-12"><label class="label-form">�к��ҹ</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:select property="searchCondition.moduleId" styleClass="form-control select2">
							<option value="">������</option>
							<nested:optionsCollection property="moduleList" label="name" value="id"/>
						</nested:select>
					</div>
					<div class="col-sm-2 col-12"><label class="label-form">������˹�Ҩ�</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:select property="searchCondition.pageTypeId" styleClass="form-control select2">
							<option value="">������</option>
							<nested:optionsCollection property="pageTypeList" label="name" value="id"/>
						</nested:select>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<input type="button" class="btn btn-primary mt-1" value=" ���� " onclick="if(validateForm(this.form)) doGoto(0)" />
				<input type="button" class="btn btn-primary mt-1" value=" �ʴ������� " onclick="doCmd('listAll')" /> 
				<input type="button" class="btn btn-primary mt-1" value=" ������������� " onclick="doCmd('resetSearch')" />
				<input type="button" class="btn btn-primary mt-1" value=" ���͡��� Excel " onclick="doCmd('exportExcel')" />
			</div>
		</div>
		<div class="box box-danger">
			<nested:notEmpty property="searchResult.data">
				<div class="box-body">
					<div class="row">
						<div class="col">
							<div class="box-responsive">
								<nested:notEmpty property="searchResult.data">
								<table class="table table-responsive table-bordered table-hover">
									<thead>
    									<tr class="dark">
											<th width="2%">#</th>
											<% String thOrderBy[][] = {{"�ѹ���/����", "o.lastUpdDate"}, {"IP Address", "o.ipAddress"}, {"���ʼ����", "o.login"}, {"����˹�Ҩ�", "o.pageCode"}, {"��ô��Թ���", "o.cmd"}, {"��������´", "o.key"}};%>
											<%@ include file="/include/_thorderby.jsp" %>
    									</tr>
   									</thead>
									<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
									<nested:iterate property="searchResult.data" id="result" indexId="ind">
   									<tbody>
   										<tr class="tr<%= ind.intValue()%2 %>">
											<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
											<td><nested:write name="result" property="lastUpdDateStr" /></td>
											<td><nested:write name="result" property="ipAddress" /></td>
											<td><nested:write name="result" property="login" /></td>
											<td><nested:write name="result" property="pageCode" /></td>
											<td><nested:write name="result" property="cmd" /></td>
											<td><nested:write name="result" property="key" /></td>
										</tr>
   									</tbody>
   									</nested:iterate>
								</table>
								<%@ include file="/include/_cursor.jsp" %>
								</nested:notEmpty>
							</div>
						</div>
					</div>
				</div>
			</nested:notEmpty>
			<nested:empty property="searchResult.data">
				<div class="box-body">
					<div class="row">
						<div class="col align-self-center">
							<nested:equal property="searchResult.processed" value="true">
								<div class="error text-center">��辺�����ŵ�����͹�</div>
							</nested:equal>
						</div>
					</div>
				</div>
			</nested:empty>
		</div>
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>