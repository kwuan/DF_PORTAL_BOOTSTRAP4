<%@ page language="java" contentType="text/html; charset=TIS620" pageEncoding="TIS620"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="<%= (String)request.getAttribute(com.depthfirst.framework.struts.BaseAction.ACTION_PATH) %>">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />

<div class="row">
	<div class="col">
		<div class="box box-danger">
			<div class="row">
				<div class="col px-4 py-2">
					จำนวนผู้ใช้งานขณะนี้ : <b><nested:size id="sessionCount" property="userSessionList" /><nested:write name="sessionCount" /></b>
				</div>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col">
						<div class="box-responsive">
							<table class="table table-responsive table-bordered table-hover">
								<thead>
   									<tr class="dark">
										<th width="2%">#</th>
										<th>รหัสผู้ใช้</th>
										<th>หน้าจอล่าสุด</th>
										<th>IP Address</th>
										<th>เวลาเข้าสู่ระบบ</th>
										<th>เวลาใช้งานล่าสุด</th>
   									</tr>
								</thead>
  								<nested:iterate property="userSessionList" id="result" indexId="ind">
								<tbody>
									<tr class="tr<%= ind.intValue()%2 %>">
										<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+1 %>&nbsp;</td>
										<td><nested:write name="result" property="login" /><!-- <nested:write property="sessionId" />[<%= result %>] -->
											<nested:equal property="sessionId" value="<%= session.getId() %>"><font color="red">*</font></nested:equal></td>
										<td><nested:present name="result" property="currentPage">
											<nested:write name="result" property="currentPage.pageName" /></nested:present></td>
										<td><nested:write name="result" property="ipAddress" /></td>
										<td><nested:write name="result" property="loginTimeStr" /></td>
										<td><nested:write name="result" property="lastAccessTimeStr" /></td>
									</tr>
								</tbody>
								</nested:iterate>
							</table>
							<%@ include file="/include/_cursor.jsp" %>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer text-center">
				<div class="row">
					<div class="col align-self-center">
						<nested:equal property="pageCmd" value="listUserSession">
							<input type="button" class="btn btn-primary mt-1" value="ดูข้อมูลใหม่" onclick="doCmd('listUserSession')" />
							<input type="button" class="btn btn-default mt-1" value="กลับไป" onclick="doCmd('list')" />
						</nested:equal>
						<nested:notEqual property="pageCmd" value="listUserSession">
							<input type="button" class="btn btn-primary mt-1" value="ดูข้อมูลใหม่" onclick="doCmd('list')" />
						</nested:notEqual>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
