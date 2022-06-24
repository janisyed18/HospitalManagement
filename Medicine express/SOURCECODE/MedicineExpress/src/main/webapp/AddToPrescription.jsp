<%@page import="medicine.express.dao.PrescriptionDao"%>
<%@page import="medicine.express.models.PrescriptionModel"%>
<% 
	String MedicineId=request.getParameter("MedicineId");
	String PatientId=(String)session.getAttribute("currentPatientId");
	String Quantity=request.getParameter("Quantity");
	String DoctorId=(String)session.getAttribute("DoctorId");
	PrescriptionDao prescriptionDao=new PrescriptionDao();
	prescriptionDao.getMedicine(MedicineId, PatientId, Quantity, DoctorId);
	response.sendRedirect("ViewPrescription.jsp");
%>