<%@page import="medicine.express.dao.PatientDao"%>
<%@page import="medicine.express.models.PatientModel"%>
<%
	String Name=request.getParameter("Name");
	String Email=request.getParameter("Email");
	String Phone=request.getParameter("Phone");
	String Password=request.getParameter("Password");
	String Age=request.getParameter("Age");
	String Gender=request.getParameter("Gender");
	
	 PatientModel patientModel=new PatientModel();
	 
	 patientModel.setName(Name);
	 patientModel.setEmail(Email);
	 patientModel.setPhone(Phone);
	 patientModel.setPassword(Password);
	 patientModel.setAge(Age);
	 patientModel.setGender(Gender);
	 
	 PatientDao patientDao=new PatientDao();
	 String Status =patientDao.preg(patientModel );
	 
	 if(Status.equalsIgnoreCase("Patient Registred Successfully")){
			response.sendRedirect("MmessageSuccess.jsp?Msg="+Status);
			
		}else{
			response.sendRedirect("MmessageFailed.jsp?Msg="+Status);
		}
	 
%>