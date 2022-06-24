<%@page import="medicine.express.models.MedicineModel"%>
<%@page import="medicine.express.dao.MedicineDao"%>
<%@page import="medicine.express.models.MedicalModel"%>
<%@page import="medicine.express.dao.MedicalDao"%>
<%@ include file="ahead.jsp"%>
<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.models.DoctorModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.DoctorDao"%>
<%
	MedicineDao medicineDao=new MedicineDao();
	List<MedicineModel> medicineList=medicineDao.getMedicines();
	Iterator<MedicineModel> medicineIterator=medicineList.iterator();%>
	<div class="container">
	<div class="text-center h4 mt-3 text-primary">Available Medicines</div>
	<div class="row">
	<% while(medicineIterator.hasNext()){
		MedicineModel medicineModel=medicineIterator.next();%>
		<div class="col-md-4">
			<div class="card m-3">
			  <div class="card-header text-center h4 text-dark"><%=medicineModel.getMedicineName()%></div>
			  <div class="card-body">
				<img src="Medicine/<%=medicineModel.getPicture()%>" style="width:100%;">
			  	<div class="row">
			  		<div  class="col-md-6 mt-2">Brand</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=medicineModel.getBrand() %></div>
					<div  class="col-md-6 mt-2">Power</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=medicineModel.getPower()%></div>
			  		<div  class="col-md-6 mt-2">Category</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=medicineModel.getCategoryModel().getCategoryName() %></div>
			  		<div  class="col-md-6 mt-2">Sub Category</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=medicineModel.getSubcategoryModel().getSubcategoryName()%></div>
			  		<div  class="col-md-6 mt-2">Packing Type</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=medicineModel.getPackingType() %></div>
			  		<div  class="col-md-6 mt-2">Is Prescription Compulsory ?</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=medicineModel.getPrescriptionType() %></div>
			  		<div  class="col-md-6 mt-2">MRP</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=medicineModel.getMrp() %></div>
			  		<div  class="col-md-6 mt-2">Status</div>
			  		<div  class="col-md-6 mt-2 h6"> <%=medicineModel.getStatus() %></div>
			  		<div class="mt-2">
			  		<div >
			  		<% if(medicineModel.getStatus().equalsIgnoreCase("published")){%>
					 		
					 	<a href="Activate2.jsp?MedicineId=<%=medicineModel.getMedicineId()%>&Status=<%=medicineModel.getStatus()%>" class="btn btn-Danger" style="width:100%;">Disable</a>	
					 		
					 <%	}else{%>
					 	<a href="Activate2.jsp?MedicineId=<%=medicineModel.getMedicineId()%>&Status=<%=medicineModel.getStatus()%>" class="btn btn-Primary" style="width:100%;">Publish</a>
					 		
					 <%}%>
					 </div>
			  		</div>
			  	</div>
			  </div>
			  <div class="card-footer">
			  <div>About Medicine</div>
			  <div><%=medicineModel.getDescription()%></div>
				</div>
			</div>
		</div>
	<% }%>
	</div>
	</div>

	