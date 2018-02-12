<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/role">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">���ҡ���������ҹ</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">���ʡ���������ҹ</label></div>
					<div class="col-md-3 col-sm-3 col-12">
						<nested:text property="searchCondition.code" styleClass="form-control" maxlength="10" />
					</div>
					<div class="col-sm-2 col-12"><label class="label-form">���͡���������ҹ</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:text property="searchCondition.name" styleClass="form-control" maxlength="50" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">�к��ҹ</label></div>
					<div class="col-sm-3 col-12">
						<nested:select property="searchCondition.moduleId" styleClass="form-control select2">
							<option value="">������</option>
							<nested:optionsCollection property="moduleList" label="name" value="id" />
						</nested:select>
					</div>
					<div class="col-sm-2 col-12"><label class="label-form">�Է���ѵ��ѵ�</label></div>
					<div class="col-md-3 col-sm-4 col-12">
						<nested:select property="searchCondition.isAuto" styleClass="form-control">
							<option value="">������</option>
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">ʶҹ�</label></div>
					<div class="col-sm-3 col-12">
						<nested:select property="searchCondition.isActive" styleClass="form-control">
							<option value="">������</option>
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<input type="button" class="btn btn-primary mt-1" value=" ���� " onclick="doGoto(0)" />
				<input type="button" class="btn btn-primary mt-1" value=" �ʴ������� " onclick="doCmd('listAll')" /> 
				<input type="button" class="btn btn-primary mt-1" value=" ������������� " onclick="doCmd('resetSearch')" />
				<input type="button" class="btn btn-primary mt-1" value=" ���͡��� Excel " onclick="doCmd('exportExcel')" />
			</div>
		</div>
		<div class="box box-danger">
			<nested:notEmpty property="searchResult.data">
				<div class="box-header with-border">
					<div class="row">
						<div class="col">
							<nested:equal property="canUpdate" value="true">
								<input class="btn btn-success" type="button" value=" �Դ�����ҹ " onclick="if(confirm('�׹�ѹ����Դ�����ҹ')) doCmd('doEnableUsers')" />
								<input class="btn btn-danger" type="button" value=" �Դ�����ҹ " onclick="if(confirm('�׹�ѹ��ûԴ�����ҹ')) doCmd('doDisableUsers')" />
							</nested:equal>
						</div>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col">
							<div class="box-responsive">
								<nested:notEmpty property="searchResult.data">
								<table class="table table-responsive table-bordered table-hover">
									<thead>
    									<tr class="dark">
											<th width="2%">#</th>
											<% String thOrderBy[][] = {{"���ʡ���������ҹ", "o.code"}, {"���͡���������ҹ", "o.name"}, {"�Է���ѵ��ѵ�", "o.isAuto"}, {"ʶҹ�", "o.isActive"}, {"��������´", "o.description"}};%>
											<%@ include file="/include/_thorderby.jsp" %>
											<th width="8%">&nbsp;</th>
    									</tr>
   									</thead>
   									<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
									<nested:iterate property="searchResult.data" id="result" indexId="ind">
   									<tbody>
   										<tr class="tr<%= ind.intValue()%2 %>">
											<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
											<td><nested:write name="result" property="code" /></td>
											<td><nested:write name="result" property="name" /></td>
											<td><nested:write name="result" property="isAutoLabel" /></td>
											<td><nested:write name="result" property="isActiveLabel" /></td>
											<td><nested:write name="result" property="description" /></td>
											<td align="center" nowrap="nowrap">&nbsp;
												<a href="javascript:doCmd('goView', <%= ind %>)" data-toggle="tooltip" title="�٢�����"><i class="fa fa-search-plus text-info"></i></a>&nbsp;
												<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">&nbsp;<a href="javascript:doCmd('goUpdate', <%= ind %>)" data-toggle="tooltip" title="��䢢�����"><i class="fa fa-pencil-square-o text-success"></i></a>&nbsp;</nested:equal>
												<nested:equal name="<%= pageCode %>" property="canDelete" value="true">&nbsp;<a href="javascript:doCmd('doDelete', <%= ind %>)" data-toggle="tooltip" title="ź������"><i class="fa fa-trash text-danger"></i></a>&nbsp;</nested:equal>
											</td>
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
			
			<div class="box-footer text-center">
				<div class="row">
					<div class="col align-self-center">
						<nested:equal property="canCreate" value="true"><input class="btn btn-success" type="button" value=" ���������� " onclick="doCmd('goCreate')" /></nested:equal>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
