<%@page import="medicine.express.dao.MedicalDao"%>
<%
	String phone=request.getParameter("phone");
	String password=request.getParameter("password");
	
	MedicalDao medicnedao=new MedicalDao();
	
	medicnedao.medicalLogin(phone, password, response, session);
%>>