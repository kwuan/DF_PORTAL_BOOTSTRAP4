<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/pageType">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="box-body">
				<div class="row">
					<div class="col">
						<div class="box-responsive">
							<nested:notEmpty property="searchResult.data">
								<table class="table table-responsive table-bordered table-hover">
									<thead>
										<tr class="dark">
											<th>#</th>
											<th>ลำดับเมนู</th>
											<th>ชื่อประเภทหน้าจอ</th>
											<th>&nbsp;</th>
										</tr>
									</thead>
									<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
									<nested:iterate property="searchResult.data" id="result" indexId="ind">
									<tbody>
										<tr class="tr<%= ind.intValue()%2 %>">
											<td align="right" width="3%" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
											<td align="right" width="10%">&nbsp;<nested:write name="result" property="order" />&nbsp;</td>
											<td><nested:write name="result" property="name" /></td>
											<td align="center" nowrap="nowrap">&nbsp;
												<a href="javascript:doCmd('goView', <%= ind %>)" data-toggle="tooltip" title="ดูข้อมูล"><i class="fa fa-search-plus text-info"></i></a>&nbsp;
												<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">&nbsp;<a href="javascript:doCmd('goUpdate', <%= ind %>)" data-toggle="tooltip" title="แก้ไขข้อมูล"><i class="fa fa-pencil-square-o text-success"></i></a>&nbsp;</nested:equal>
												<nested:equal name="<%= pageCode %>" property="canDelete" value="true">&nbsp;<a href="javascript:doCmd('doDelete', <%= ind %>)" data-toggle="tooltip" title="ลบข้อมูล"><i class="fa fa-trash text-danger"></i></a>&nbsp;</nested:equal>
											</td>
										</tr>
									</tbody>
									</nested:iterate>
								</table>
							</nested:notEmpty>
							<%@ include file="/include/_cursor.jsp" %>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<nested:equal property="canCreate" value="true">
					<div class="row">
						<div class="col text-center">
							<input type="button" value=" เพิ่มข้อมูลประเภทหน้าจอ " class="btn btn-primary" onclick="doCmd('goCreate')" />
						</div>
					</div>
				</nested:equal>
			</div>
		</div>
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
