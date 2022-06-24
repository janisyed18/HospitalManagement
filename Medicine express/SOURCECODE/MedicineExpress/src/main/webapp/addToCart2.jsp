<%@page import="medicine.express.dao.MedicineorderDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.dao.MedicalDao"%>
<%@page import="medicine.express.models.MedicalModel"%>
<%@page import="java.util.List"%>
<%@ include file="Phead.jsp"%>
<% 
	String PatientMedicineId = request.getParameter("PatientMedicineId");
	String MedicineId = request.getParameter("MedicineId");
	String MedicineName = request.getParameter("MedicineName");
	String MedicalId = request.getParameter("MedicalId");
	String PatientId = (String)session.getAttribute("PatientId");
	MedicineorderDao medicineorderDao=new MedicineorderDao();
	medicineorderDao.addItemToCart(PatientMedicineId, MedicineId, MedicalId, PatientId, response);
	
%>