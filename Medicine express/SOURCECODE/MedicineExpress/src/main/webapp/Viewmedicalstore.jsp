
<%@page import="medicine.express.models.MedicalModel"%>
<%@page import="medicine.express.dao.MedicalDao"%>
<%@ include file="ahead.jsp"%>
<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.models.DoctorModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.DoctorDao"%>
<%
	MedicalDao medicalDao=new MedicalDao();
	List< MedicalModel> medicalList=medicalDao.Viewmedicalstore();
	
	Iterator<MedicalModel> medicalIterator=medicalList.iterator();%>
	<div class="container">
	<div class="text-center h4 mt-3 text-primary">View Medical Store Activated or Deactivated</div>
	<div class="row">
	<% while(medicalIterator.hasNext()){
		MedicalModel medicalModel=medicalIterator.next();%>
		<div class="col-md-6">
			<div class="card m-3">
			  <div class="card-header text-center h4 text-dark"><%=medicalModel.getName() %></div>
			  <div class="card-body">
			  
			  	<div class="row">
			  		<div  class="col-md-6 mt-2">RegistrationNumber</div>
			  		<div  class="col-md-6 mt-2"> <%=medicalModel.getRegistrationNumber() %></div>
			  		<div  class="col-md-6 mt-2">Owner Name</div>
			  		<div  class="col-md-6 mt-2"> <%=medicalModel.getOwnername() %></div>
			  		<div  class="col-md-6 mt-2">Phone</div>
			  		<div  class="col-md-6 mt-2"> <%=medicalModel.getPhone() %></div>
			  		<div  class="col-md-6 mt-2">Password</div>
					<div  class="col-md-6 mt-2"> <%=medicalModel.getPassword() %></div>
					<div  class="col-md-6 mt-2">Email</div>
					<div  class="col-md-6 mt-2"> <%=medicalModel.getEmail() %></div>
					<div  class="col-md-6 mt-2">Open Time</div>
					<div  class="col-md-6 mt-2"> <%=medicalModel.getOpentime() %></div>
					<div  class="col-md-6 mt-2">Close Time</div>
					<div  class="col-md-6 mt-2"> <%=medicalModel.getClosetime() %></div>
					<div  class="col-md-6 mt-2">Status</div>
					<div  class="col-md-6 mt-2"> <%=medicalModel.getStatus() %> 
					 <%
					 	if(medicalModel.getStatus().equalsIgnoreCase("activated")){%>
					 		
					 	<a href="Activate.jsp?MedicalId=<%=medicalModel.getMedicalId()%>&Status=<%=medicalModel.getStatus()%>" class="btn btn-Danger">Deactivated</a>	
					 		
					 <%	}else{%>
					 	<a href="Activate.jsp?MedicalId=<%=medicalModel.getMedicalId()%>&Status=<%=medicalModel.getStatus()%>" class="btn btn-Primary">Activated</a>
					 		
					 <%}%>
					</div>
			  	</div>
			  </div>
			  <div class="card-footer">
			  <div>Address</div>
			  <div><%=medicalModel.getAddress() %></div>
			  <div>
			  	<a href="MedicalStore.jsp<%=medicalModel.getDocuments()%>" class="btn btn-primary">View Document</a>
			  </div>
				</div>
			</div>
		
		</div>
		
	<% }%>
	</div>
	</div>
	
	