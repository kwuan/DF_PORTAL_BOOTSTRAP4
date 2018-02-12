<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/user">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">���Ҽ����ҹ</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">���ʼ����</label></div>
					<div class="col-md-2 col-sm-4 col-12">
						<nested:text styleClass="form-control" property="searchCondition.login" maxlength="20" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">���� - ���ʡ��</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<div class="row">
							<div class="col"><nested:text styleClass="form-control" property="searchCondition.psnFirstName" /></div>
						    <div class="col"><nested:text property="searchCondition.psnLastName" styleClass="form-control" /></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">����������ҹ</label></div>
					<div class="col-md-4 col-sm-8 col-12">
						<nested:select property="searchCondition.roleId" styleClass="form-control select2">
							<option value=""></option>
							<nested:optionsCollection property="roleList" label="name" value="id" />
						</nested:select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-3 col-12"><label class="label-form">ʶҹ�</label></div>
					<div class="col-md-2 col-sm-4 col-12">
						<nested:select property="searchCondition.isActive" styleClass="form-control">
							<option value="">������</option>
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
				<div class="box-footer">
					<div class="col">
						<input type="button" value=" ���� " onclick="doGoto(0)" class="btn btn-primary mt-1" />
						<input type="button" value=" �ʴ������� " onclick="doCmd('listAll')" class="btn btn-primary mt-1" /> 
						<input type="button" value=" ������������� " onclick="doCmd('resetSearch')" class="btn btn-primary mt-1" />
						<input type="button" value=" ���͡��� Excel " onclick="doCmd('exportExcel')" class="btn btn-primary mt-1" />
					</div>
				</div>
			</div>
		</div>
		<div class="box box-danger">
			<nested:notEmpty property="searchResult.data">
				<div class="box-header with-border">
					<div class="row">
						<div class="col">
							<nested:equal property="canUpdate" value="true">
								<input class="btn btn-success mt-1" type="button" value=" �Դ�����ҹ " onclick="if(confirm('�׹�ѹ����Դ�����ҹ')) doCmd('doEnableUsers')" />
								<input class="btn btn-danger mt-1" type="button" value=" �Դ�����ҹ " onclick="if(confirm('�׹�ѹ��ûԴ�����ҹ')) doCmd('doDisableUsers')" />
							</nested:equal>
						</div>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col">
							<div class="box-responsive">
								<table class="table table-responsive table-bordered table-hover">
									<thead>
    									<tr class="dark">
    										<nested:equal property="canUpdate" value="true">
	    										<th width="2%">
													<input type="checkbox" name="status_all" onclick="doCheckAll(this.form, 'status_all', 'status_ind')" />
												</th>
											</nested:equal>
											<th width="2%">&nbsp;</th>
											<% String thOrderBy[][] = {{"���ʼ����", "o.login"}, {"���ͼ����ҹ", "o.person.firstName,o.person.lastName"}, {"�ѧ�Ѵ", "o.person.node.fullName"}, {"ʶҹ�", "o.isActive"}};%>
											<%@ include file="/include/_thorderby.jsp" %>
											<th width="8%">&nbsp;</th>
    									</tr>
   									</thead>
   									<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
									<nested:iterate property="searchResult.data" id="result" indexId="ind">
   									<tbody>
   										<tr class="tr<%= ind.intValue()%2 %>">
											<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">
												<td align="center" valign="top"><input type="checkbox" name="status_ind" value="<%= ind.intValue() %>" onclick="doCheckId(this.form, 'status_all', 'status_ind')" /></td>
											</nested:equal>
											<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
											<td><nested:write name="result" property="login" /></td>
											<td><nested:write name="result" property="personName" /></td>
											<td><nested:write name="result" property="personNodeName" /></td>
											<td><nested:write name="result" property="isActiveLabel" /></td>
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
							<center class="error">��辺�����ŵ�����͹�</center></nested:equal>
						</div>
					</div>
				</div>
			</nested:empty>
			
			<div class="box-footer text-center">
				<div class="row">
					<div class="col align-self-center">
						<nested:equal property="canCreate" value="true"><input class="btn btn-success" type="button" value=" ���������� " onclick="doCmd('goCreate')" /></nested:equal>
						<input class="btn btn-info" type="button" value=" �����ҹ��й�� " onclick="doCmd('listUserSession')" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:form>					
<%@ include file="/include/_footermenu.jsp" %>
