<nested:define id="_condition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition"/>
<nested:define id="_result" property="searchResult" type="com.depthfirst.framework.search.SearchResult"/>
<nested:hidden property="searchCondition.position" /><%!
int _perpages[] = {10, 25, 50, 100};
%><%
int _pos = _condition.getPosition();
int _psize = _condition.getPageSize();
int _size = _result.getSize();
boolean _prev = _pos-_psize >= 0;
boolean _next = _pos+_psize < _size;
%>

<div class="row" style="font-size: 0.85rem;">
	<div class="col-md-4 col-sm-12 justify-content-start">
		<div class="row">
			<div class="col-6 justify-content-center align-items-center mt-1">
				<% if(_psize < Integer.MAX_VALUE) { %>
		  			<select name="searchCondition.pageSize" onchange="doGoto(0)" class="form-control" style="font-size: 0.85rem;">
		  			<% for(int _p=0; _p<_perpages.length; _p++) { %>
		  				<option value="<%= _perpages[_p] %>"<%= _psize==_perpages[_p]?" selected":"" %>>หน้าละ <%= _perpages[_p] %> รายการ</option>
					<% } %>
					</select>
				<% } %>
			</div>
			<div class="col-auto justify-content-center align-items-center p-2 mt-1">
				<% if(_prev || _next) { %>หน้าที่ <%} %>
			</div>
			<div class="col justify-content-center align-items-center mt-1">
				<% if(_prev || _next) { %>
				    <select onchange="doGoto(this.selectedIndex*<%= _psize %>)" class="form-control" style="font-size: 0.85rem;">
				      <% for(int _p=0, _np=_size/_psize+(_size%_psize>0?1:0); _p<_np; _p++) { int _val=_p*_psize;%>
				      	<option value="<%= _val %>"<%= _pos==_val?" selected":"" %>><%= _p+1 %> จาก <%= _np %></option>
				      <% } %>
				    </select>
				  <% } %>
			</div>
		</div>
	</div>
	<div class="col-md-4 col-6 text-center p-2 mt-1">
		<%= _pos+1 %> ถึง <%= (_pos+_psize)>_size?_size:(_pos+_psize) %> จาก <%= _size %>
	</div>
	<div class="col-md-4 col-6 p-2 ml-6 mt-1">
		<ul class="pagination rounded-0 float-right">
		<% if(_prev || _next) { %>
		    <% if(_prev) { %>
				    <li class="page-item rounded-0"><a href="javascript:doGoto(0)" class="page-link"><i class="fa fa-step-backward text-dark"></i></a></li>
				    <li class="page-item rounded-0"><a href="javascript:doGoto(<%= _pos-_psize %>)" class="page-link"><i class="fa fa-caret-left text-dark"></i></a></li>
		    <% }else { %>
		    	<li class="page-item rounded-0"><a class="text-disabled page-link"><i class="fa fa-step-backward text-muted"></i></a></li>
				<li class="page-item rounded-0"><a class="text-disabled page-link"><i class="fa fa-caret-left text-muted"></i></a></li>    
		    <% } %>
		    <% if(_next) { %>
		    	<li class="page-item rounded-0"><a href="javascript:doGoto(<%= _pos+_psize %>)" class="page-link"><i class="fa fa-caret-right text-dark"></i></a></li>
			    <li class="page-item rounded-0"><a href="javascript:doGoto(<%= _size%_psize>0?(_size-(_size%_psize)):(_size-_psize) %>)" class="page-link"><i class="fa fa-step-forward text-dark"></i></a></li>
		    <% }else { %>
		    	<li class="page-item rounded-0"><a class="text-disabled page-link"><i class="fa fa-caret-right glyphicon glyphicon-triangle-right text-muted"></i></a></li>
				<li class="page-item rounded-0"><a class="text-disabled page-link"><i class="fa fa-step-forward text-muted"></i></a></li>  
		    <% } %>
		  <% } %>
	  	</ul>
	</div>
</div>
