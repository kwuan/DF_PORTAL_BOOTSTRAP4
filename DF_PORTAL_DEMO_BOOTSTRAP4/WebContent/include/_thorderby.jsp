<nested:define id="_orderBy" property="searchCondition.orderBy" type="String"/>
<nested:define id="_orderDesc" property="searchCondition.orderDesc" type="String"/><%
for(int _h=0; _h<thOrderBy.length; _h++) { %><th nowrap="nowrap">
  <% if(thOrderBy[_h][1]!=null) { boolean _ochk = thOrderBy[_h][1].equals(_orderBy); %>
    <a href="javascript:doSort('<%= thOrderBy[_h][1] %>', <%= _ochk?("1".equals(_orderDesc)?0:1):0 %>)" class="text-white" style="
    text-decoration: none;"><%= thOrderBy[_h][0] %></a>
    <% if(_ochk) {%><IMG src="<%= request.getContextPath() %>/images/cursor/<%= "1".equals(_orderDesc)?"desc2":"asc2" %>.gif" border=0><% } %>
  <% }else { %><%= thOrderBy[_h][0] %><% } %>
</th><% } %>
<nested:hidden property="searchCondition.orderBy" />
<nested:hidden property="searchCondition.orderDesc" />
