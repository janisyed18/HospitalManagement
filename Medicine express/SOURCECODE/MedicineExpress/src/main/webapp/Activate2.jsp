<%@page import="medicine.express.dao.MedicineDao"%>
<% 
	String MedicineId=request.getParameter("MedicineId");
	String Status =request.getParameter("Status");
	
	MedicineDao medicineDao=new MedicineDao();
	medicineDao.Disable(MedicineId, Status, response);
%>