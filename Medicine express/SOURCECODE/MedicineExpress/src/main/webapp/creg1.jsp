<%@page import="medicine.express.dao.MedicalDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="medicine.express.models.MedicalModel"%>

<%
	String path=application.getRealPath("MedicalStore");
	MultipartRequest Multi=new MultipartRequest(request,path);

    String Name=Multi.getParameter("Name");
	String RegistrationNumber=Multi.getParameter("RegistrationNumber");
	String Ownername=Multi.getParameter("Ownername");
	String Phone=Multi.getParameter("Phone");
	String Password=Multi.getParameter("Password");
	String Email=Multi.getParameter("Email");
	String Opentime=Multi.getParameter("Opentime");
	String Closetime=Multi.getParameter("Closetime");
	String Documents=Multi.getFilesystemName("Documents");
	String Address=Multi.getParameter("Address");
	
	MedicalModel medicalModel=new MedicalModel();
	
	medicalModel.setName(Name);
	medicalModel.setRegistrationNumber(RegistrationNumber);
	medicalModel.setOwnername(Ownername);
	medicalModel.setPhone(Phone);
	medicalModel.setPassword(Password);
	medicalModel.setEmail(Email);
	medicalModel.setOpentime(Opentime);
	medicalModel.setClosetime(Closetime);
	medicalModel.setDocuments(Documents);
	medicalModel.setAddress(Address);
	
	MedicalDao medicalDao=new MedicalDao();
	String Status= medicalDao.creg(medicalModel);
	
	if(Status.equalsIgnoreCase("Medical Store Registred Successfully")){
		
		response.sendRedirect("MmessageSuccess.jsp?Msg="+Status);
		
	}else{
		response.sendRedirect("MmessageFailed.jsp?Msg="+Status);
	}
%>
