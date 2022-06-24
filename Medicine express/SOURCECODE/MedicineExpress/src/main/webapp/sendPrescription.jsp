<%@page import="medicine.express.dao.PrescriptionDao"%>
<% 
	String PrescriptionId=request.getParameter("PrescriptionId");

	PrescriptionDao prescriptionDao=new PrescriptionDao();
	prescriptionDao.sendPrescription(response, PrescriptionId);
%>