
<%@page import="medicine.express.dao.PatientDao"%>
<%@page import="medicine.express.models.PatientModel"%>
<%@ include file="Dhead.jsp"%>
<% 
	String PatientId=request.getParameter("PatientId");

	PatientDao patientDao=new PatientDao();
	
	PatientModel patientModel=patientDao.searchPatient(PatientId);
	
%>
	<div class="container">
	<div class="text-center h4 m-5">Patient Details</div>
	<table class="table table-primary table-bordered">
		<thead>
			<tr>
				<th>UHID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Age</th>
				<th>Gender</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=patientModel.getPatientId()%></td>
				<td><%=patientModel.getName()%></td>
				<td><%=patientModel.getEmail()%></td>
				<td><%=patientModel.getPhone()%></td>
				<td><%=patientModel.getAge()%></td>
				<td><%=patientModel.getGender()%></td>
			</tr>
			<tr>
			<td colspan="2"><a href="StoreMedicine.jsp?PatientId=<%=patientModel.getPatientId()%>" class="btn btn-primary btn-block mt-3 ">Write Prescription</a></td>
			<td colspan="2"><a href="AddReports.jsp?PatientId=<%=patientModel.getPatientId()%>" class="btn btn-primary btn-block mt-3 ">Add Reports</a></td>
			<td colspan="2"><a href="ViewReports.jsp?PatientId=<%=patientModel.getPatientId()%>" class="btn btn-primary btn-block mt-3 ">View Reports</a></td>
			</tr>
		</tbody>
	</table>
</div>