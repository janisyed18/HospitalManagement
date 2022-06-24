<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.models.DoctorModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.DoctorDao"%>
<% 
	String Speciality=request.getParameter("Speciality");
	String Name=request.getParameter("Name");
	
	DoctorDao doctorDao=new DoctorDao();
	List<DoctorModel> doctorList=doctorDao.getDoctors(Speciality, Name);
	Iterator<DoctorModel> doctorIterator=doctorList.iterator();
%>
	<div class="container">
	<div class="text-center h4 mt-3 text-primary">Available Doctors</div>
	<div class="row mt-3">
	<% while(doctorIterator.hasNext()){
		DoctorModel doctorModel=doctorIterator.next();%>
		<div class="col-md-4">
			<div class="card m-3">
			  <div class="card-header text-center h4 text-dark"><%=doctorModel.getName()%></div>
			  <div class="card-body">
				<img src="DoctorDetails/<%=doctorModel.getPhoto()%>" style="width:100%;">
			  	<div class="row">
			  		<div  class="col-md-6 mt-2">Email</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getEmail()%></div>
					<div  class="col-md-6 mt-2">Phone</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getPhone()%></div>
			  		<div  class="col-md-6 mt-2">Education</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getEducation()%></div>
			  		<div  class="col-md-6 mt-2">Languages</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getLanguages()%></div>
			  		<div  class="col-md-6 mt-2">Experience</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getExperience() %></div>
			  		<div  class="col-md-6 mt-2">About Him</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getAbouthim()%></div>
			  		<div  class="col-md-6 mt-2">Start Time</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getStarttime()%></div>
			  		<div  class="col-md-6 mt-2">End Time</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getEndtime() %></div>
			  		<div  class="col-md-6 mt-2">Lunch Time</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getLunchtime()%></div>
			  		<div  class="col-md-6 mt-2">Speciality</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getSpeciality()%></div>
			  		<div  class="col-md-6 mt-2">Status</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=doctorModel.getStatus() %></div>
			  	</div>
			  </div>
			  <div class="card-footer">
			  <div>Address</div>
			  <div><%=doctorModel.getAddress()%></div>
				</div>
			</div>
		</div>
	<% }%>
	</div>
	</div>