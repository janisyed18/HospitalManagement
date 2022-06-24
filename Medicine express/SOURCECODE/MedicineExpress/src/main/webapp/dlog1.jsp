<%@page import="medicine.express.dao.DoctorDao"%>
<%
	String phone=request.getParameter("phone");
	String password=request.getParameter("password");
	
	
	DoctorDao doctordao=new DoctorDao();
	doctordao.doctorlogin(phone, password, response, session);
%>