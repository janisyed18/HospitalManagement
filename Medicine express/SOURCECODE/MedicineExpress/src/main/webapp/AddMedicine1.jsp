<%@page import="medicine.express.dao.MedicineDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="medicine.express.models.MedicineModel"%>
<%@page import="medicine.express.models.MedicalModel"%>
<%@page import="medicine.express.dao.CategoryDao"%>
<%@page import="medicine.express.models.CategoryModel"%>
<%
		String path=application.getRealPath("Medicine");
		MultipartRequest Multi=new MultipartRequest(request,path);
		
		 String  MedicineName=Multi.getParameter("MedicineName");
		 String Brand=Multi.getParameter("Brand");
		 String Power=Multi.getParameter("Power");
		 String PackingType=Multi.getParameter("PackingType");
		 String PrescriptionType=Multi.getParameter("PrescriptionType");
		 String Mrp=Multi.getParameter("Mrp");
		 String Description=Multi.getParameter("Description");
		 String Picture=Multi.getFilesystemName("Picture");
		 String CategoryId=Multi.getParameter("CategoryId");
		 String SubcategoryId=Multi.getParameter("SubcategoryId"); 
		MedicineModel medicineModel=new MedicineModel();
	
		medicineModel.setMedicineName(MedicineName);
		medicineModel.setBrand(Brand);
		medicineModel.setPower(Power);
		medicineModel.setPackingType(PackingType);
		medicineModel.setPrescriptionType(PrescriptionType);
		medicineModel.setMrp(Mrp);
		medicineModel.setDescription(Description);
		medicineModel.setPicture(Picture);
		medicineModel.setCategoryId(CategoryId);
		medicineModel.setSubcategoryId(SubcategoryId);
		
		MedicineDao medicineDao = new MedicineDao();
		String responseStatus = medicineDao.addMedicine(medicineModel);
		if(responseStatus.equalsIgnoreCase("Medicine Added Successfully")){
			response.sendRedirect("MmessageSuccess.jsp?Msg="+responseStatus);
			
		}else{
			response.sendRedirect("MmessageFailed.jsp?Msg="+responseStatus);
		}
	
%>