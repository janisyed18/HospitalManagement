<%@page import="medicine.express.models.AvailabilityModel"%>
<%@page import="medicine.express.dao.AvailabilityDao"%>
<% 
	String MedicineId=request.getParameter("MedicineId");
	String MedicalId=(String)session.getAttribute("MedicalId");
	String Available=request.getParameter("Available");
	String price=request.getParameter("price");

	AvailabilityModel availabilityModel=new AvailabilityModel();
	
	availabilityModel.setMedicineId(MedicineId);
	availabilityModel.setMedicalId(MedicalId);
	availabilityModel.setAvailable(Available);
	availabilityModel.setPrice(price);
	AvailabilityDao availabilityDao=new AvailabilityDao();
	availabilityDao.setAvilabilityMedicine(availabilityModel,response);
	
%>