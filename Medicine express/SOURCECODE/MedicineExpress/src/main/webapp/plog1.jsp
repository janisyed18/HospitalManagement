<%@page import="medicine.express.dao.PatientDao"%>
<%
	String phone=request.getParameter("phone");
	String password=request.getParameter("password");
	
	PatientDao patientdao=new PatientDao();
	patientdao.patientlogin(phone, password, response, session);
%>