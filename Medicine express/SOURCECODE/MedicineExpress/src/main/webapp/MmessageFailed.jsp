<% 
	String role = (String)session.getAttribute("role");
	if(role!=null&& role.equalsIgnoreCase("admin")){%>
		<%@ include file="ahead.jsp"%>
	<% } else{%>
		<%@ include file="mhead.jsp"%>
	<% }%>
 <% 
  String Msg=request.getParameter("Msg");
 %>
<div class="text-center text-danger h4 mt-5">
	<%=Msg %>
</div>