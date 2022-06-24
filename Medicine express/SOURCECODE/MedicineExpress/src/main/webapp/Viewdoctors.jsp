

<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.models.DoctorModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.DoctorDao"%>
<% 
	String role = (String)session.getAttribute("role");
if(role.equalsIgnoreCase("Patient")) {%>
	<%@ include file="Phead.jsp"%>
<% } else { %>
	<%@ include file="ahead.jsp"%>
<% }%>
<%
	DoctorDao doctordao=new DoctorDao();
	List< DoctorModel> doctorlist=doctordao.Viewdoctors();
	
	Iterator<DoctorModel> doctoriterator=doctorlist.iterator();%>
	<div class="container">
	<div class="text-center h4 mt-3 text-primary">Availability Doctors</div>
	<div class="row">
	<% while(doctoriterator.hasNext()){
		DoctorModel doctorModel=doctoriterator.next();%>
		<div class="col-md-6">
			<div class="card m-3">
			  <div class="card-header text-center h4 text-dark"><%=doctorModel.getName() %></div>
			  <div class="card-body">
			  <div>
			  	<img src="DoctorDetails/<%=doctorModel.getPhoto() %>" style="max-width:100%;height:300px;">
			  </div>
			  	<div class="row">
			  		<div  class="col-md-6 mt-2">Email</div>
			  		<div  class="col-md-6 mt-2"> <%=doctorModel.getEmail() %></div>
			  		<div  class="col-md-6 mt-2">Phone</div>
			  		<div  class="col-md-6 mt-2"> <%=doctorModel.getPhone() %></div>
			  		<div  class="col-md-6 mt-2">Education</div>
			  		<div  class="col-md-6 mt-2"> <%=doctorModel.getEducation() %></div>
			  		<div  class="col-md-6 mt-2">Registration Number</div>
					<div  class="col-md-6 mt-2"> <%=doctorModel.getRegistrationNumber() %></div>
					<div  class="col-md-6 mt-2">Languages</div>
					<div  class="col-md-6 mt-2"> <%=doctorModel.getLanguages() %></div>
					<div  class="col-md-6 mt-2">Experience</div>
					<div  class="col-md-6 mt-2"> <%=doctorModel.getExperience() %></div>
					<div  class="col-md-6 mt-2">Start Time</div>
					<div  class="col-md-6 mt-2"> <%=doctorModel.getStarttime() %></div>
					<div  class="col-md-6 mt-2">End Time</div>
					<div  class="col-md-6 mt-2"> <%=doctorModel.getEndtime()%></div>
					<div  class="col-md-6 mt-2">Lunch Time</div>
					<div  class="col-md-6 mt-2"> <%=doctorModel.getLunchtime() %></div>
					<div  class="col-md-6 mt-2">Speciality</div>
					<div  class="col-md-6 mt-2"> <%=doctorModel.getSpeciality() %></div>
					<div  class="col-md-6 mt-2">Status</div>
					<div  class="col-md-6 mt-2"> <%=doctorModel.getStatus()%>
					<% if(role.equalsIgnoreCase("admin")) {
					 	if(doctorModel.getStatus().equalsIgnoreCase("activated")){%>
					 		
					 	<a href="Activate1.jsp?DoctorId=<%=doctorModel.getDoctorId()%>&Status=<%=doctorModel.getStatus()%>" class="btn btn-Danger">Deactivated</a>	
					 		
					 <%	}else{%>
					 	<a href="Activate1.jsp?DoctorId=<%=doctorModel.getDoctorId()%>&Status=<%=doctorModel.getStatus()%>" class="btn btn-Primary">Activated</a>
					 		
					 <%}}%>
					
					</div>
			  	</div>
			  </div>
			  <div class="card-footer">
			  <div>About Him</div>
			  <div><%=doctorModel.getAbouthim() %></div>
			  <hr>
			  <div>Address</div>
			  <div><%=doctorModel.getAddress() %></div>
				</div>
			</div>
		
		</div>
		
	<% }%>
	</div>
	</div>
