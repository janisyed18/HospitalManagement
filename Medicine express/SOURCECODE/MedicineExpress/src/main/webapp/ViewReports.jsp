<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.models.PatientReportModel"%>
<%@page import="medicine.express.dao.PatientReportDao"%>

<% 
String role = (String)session.getAttribute("role");
if(role.equalsIgnoreCase("Patient")) {%>
<%@ include file="Phead.jsp"%>
<% } else { %>
<%@ include file="Medicalhead.jsp"%>
<% }%>

<% 
	String PatientId=request.getParameter("PatientId");
	String DoctorId=(String)session.getAttribute("DoctorId");

	PatientReportDao patientReportDao=new PatientReportDao();
	
	List<PatientReportModel> patientReportList=patientReportDao.viewReports(PatientId);
	Iterator<PatientReportModel>patientReportIterator=patientReportList.iterator();
%>
<div class="container">
<div class="text-center h3">Patient Details</div>
<table class="table table-primary table-bordered">
	<thead>
		<tr>
			<th>Report Title</th>
			<th>Report value</th>
			<th>UHID</th>
			<th>Doctor Name</th>
			<th>Date</th>
		</tr>
	</thead>
		<tbody>
		 <% 	while(patientReportIterator.hasNext()){
			      PatientReportModel patientReportModel=patientReportIterator.next();%>
			      <tr>			        
						<td><%=patientReportModel.getReporttitle()%></td>
						<td><%=patientReportModel.getReportvalue()%></td>
						<td><%=patientReportModel.getPatientId()%></td>
						<td><%=patientReportModel.getDoctorModel().getName()%></td>
						<td><%=patientReportModel.getDatee()%></td>
			      </tr>
		 <%}%>
		</tbody>
</table>
</div>

