<%@page import="medicine.express.models.DoctorModel"%>
<%@page import="medicine.express.dao.DoctorDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
	String path=application.getRealPath("DoctorDetails");
	MultipartRequest Multi=new MultipartRequest(request,path);
	
	 String Name=Multi.getParameter("Name");
	 String Email=Multi.getParameter("Email");
	 String Phone=Multi.getParameter("Phone");
	 String Password=Multi.getParameter("Password");
	 String Education=Multi.getParameter("Education");
	 String RegistrationNumber=Multi.getParameter("RegistrationNumber");
	 String Address=Multi.getParameter("Address");
	 String Languages=Multi.getParameter("Languages");
	 String Experience=Multi.getParameter("Experience");
	 String Abouthim=Multi.getParameter("Abouthim");
	 String Photo=Multi.getFilesystemName("Photo");
	 String Starttime=Multi.getParameter("Starttime");
	 String Endtime=Multi.getParameter("Endtime");
	 String Lunchtime=Multi.getParameter("Lunchtime");
	 String Speciality=Multi.getParameter("Speciality");
	 
	 DoctorModel doctorModel=new DoctorModel();
	 
	 doctorModel.setName(Name);
	 doctorModel.setEmail(Email);
	 doctorModel.setPhone(Phone);
	 doctorModel.setPassword(Password);
	 doctorModel.setEducation(Education);
	 doctorModel.setRegistrationNumber(RegistrationNumber);
	 doctorModel.setAddress(Address);
	 doctorModel.setLanguages(Languages);
	 doctorModel.setExperience(Experience);
	 doctorModel.setAbouthim(Abouthim);
	 doctorModel.setPhoto(Photo);
	 doctorModel.setStarttime(Starttime);
	 doctorModel.setEndtime(Endtime);
	 doctorModel.setLunchtime(Lunchtime);
	 doctorModel.setSpeciality(Speciality);
	 
	 DoctorDao doctorDao=new DoctorDao();
	 String Status= doctorDao.dreg(doctorModel);
	 
	 if(Status.equalsIgnoreCase("Doctor Details Registred Successfully")){
			response.sendRedirect("MmessageSuccess.jsp?Msg="+Status);
			
		}else{
			response.sendRedirect("MmessageFailed.jsp?Msg="+Status);
		}
	 
	 
%>>