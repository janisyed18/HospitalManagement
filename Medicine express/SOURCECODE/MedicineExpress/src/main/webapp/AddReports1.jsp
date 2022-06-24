
<%@page import="java.lang.Thread.State"%>

<%@page import="java.io.ObjectInputFilter.Status"%>
<%@page import="medicine.express.models.PatientReportModel"%>
<%@page import="medicine.express.dao.PatientReportDao"%>
<% 
	String PatientId=request.getParameter("PatientId");
	String DoctorId=(String)session.getAttribute("DoctorId");
	String Reporttitle=request.getParameter("Reporttitle");
	String Reportvalue=request.getParameter("Reportvalue");
	
	PatientReportModel patientReportModel=new PatientReportModel();
	patientReportModel.setReporttitle(Reporttitle);
	patientReportModel.setReportvalue(Reportvalue);
	patientReportModel.setPatientId(PatientId);
	patientReportModel.setDoctorId(DoctorId);
	
	PatientReportDao patientReportDao=new PatientReportDao();
	patientReportDao.addReports(patientReportModel);
	
	response.sendRedirect("ViewPatient1.jsp?PatientId="+PatientId);
	
%>