<%@page import="medicine.express.dao.DoctorDao"%>
<% 
	String DoctorId=request.getParameter("DoctorId");
	String Status =request.getParameter("Status");
	
	DoctorDao doctorDao=new DoctorDao();
	doctorDao.Activate(DoctorId, Status, response);
%>