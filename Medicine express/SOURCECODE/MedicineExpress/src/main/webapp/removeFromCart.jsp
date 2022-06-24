<%@page import="medicine.express.dao.PrescriptionDao"%>
<% 
	String PatientMedicineId=request.getParameter("PatientMedicineId");

	PrescriptionDao prescriptionDao=new PrescriptionDao();
	prescriptionDao.removeMedicines(response, PatientMedicineId);
%>