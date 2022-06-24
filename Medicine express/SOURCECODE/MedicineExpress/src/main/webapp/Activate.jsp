<%@page import="medicine.express.dao.MedicalDao"%>
<% 
	String MedicalId=request.getParameter("MedicalId");
	String Status =request.getParameter("Status");
	
	MedicalDao medicalDao=new MedicalDao();
	medicalDao.Activate(MedicalId, Status, response);
%>