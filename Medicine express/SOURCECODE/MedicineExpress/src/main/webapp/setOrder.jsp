<%@page import="medicine.express.dao.MedicineorderDao"%>
<% 
	String Medicineorderid = request.getParameter("Medicineorderid");
	String Status = request.getParameter("Status");
	String MedicalId = (String)session.getAttribute("MedicalId");
	MedicineorderDao medicineorderDao = new MedicineorderDao();
	medicineorderDao.setOrder(Medicineorderid, Status, response);
%>