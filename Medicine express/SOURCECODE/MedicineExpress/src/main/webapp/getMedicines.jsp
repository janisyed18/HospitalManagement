<%@page import="medicine.express.models.MedicalModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.models.MedicineModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.MedicineDao"%>
<% 
	String CategoryId=request.getParameter("CategoryId");
	String SubcategoryId=request.getParameter("SubcategoryId");
	String MedicineName=request.getParameter("MedicineName");
	String role=(String)session.getAttribute("role");
	String type = request.getParameter("type");
	String MedicalId = (String)session.getAttribute("MedicalId");
	MedicineDao medicineDao=new MedicineDao();
	List<MedicineModel>medicineList=medicineDao.getMedicines(CategoryId, SubcategoryId, MedicineName,role,MedicalId,type);
	Iterator<MedicineModel>medicineIterator=medicineList.iterator();
%>	
	<div class="container">
	<div class="text-center h4 mt-3 text-primary">Available Medicines</div>
	<div class="row">
	<% while(medicineIterator.hasNext()){
		MedicineModel medicineModel=medicineIterator.next();%>
		<div class="col-md-4">
			<div class="card m-3">
			  <div class="card-header text-center h4 text-dark"><%=medicineModel.getMedicineName()%></div>
			  <div class="card-body">
				<img src="Medicine/<%=medicineModel.getPicture()%>" style="max-width:100%;height: 200px;">
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
			  	<% 
			  	   
			  		if(role.equalsIgnoreCase("admin")){%>
			  		
			  		<div class="mt-2">
			  		<div >
			  		<% if(medicineModel.getStatus().equalsIgnoreCase("published")){%>
					 		
					 	<a href="Activate2.jsp?MedicineId=<%=medicineModel.getMedicineId()%>&Status=<%=medicineModel.getStatus()%>" class="btn btn-Danger" style="width:100%;">Disable</a>	
					 		
					 <%	}else{%>
					 	<a href="Activate2.jsp?MedicineId=<%=medicineModel.getMedicineId()%>&Status=<%=medicineModel.getStatus()%>" class="btn btn-Primary" style="width:100%;">Publish</a>
					 		
					 <%}%>
					 </div>
					 
			  		</div>
			  		<% }%>
			  	<% 	if(role.equalsIgnoreCase("MedicalStore")){%>
			  		<form action="Available.jsp" method="post">
			  		<div class="row">
			  			<div class="col-md-8">
				  			<input type="hidden" name="MedicineId" value="<%=medicineModel.getMedicineId() %>">
				  			<div class="mb-3 mt-3">
								<label for="price">Unit Price</label> 
								<input type="number"id="price" name="price" value="<%=medicineModel.getPrice()%>" required class="form-control">
							</div>
				  			<div class="mb-3">
								<label for="Available">Available</label> 
								<input type="number"id="Available" name="Available" value="<%=medicineModel.getAvailable()%>" required class="form-control">
							</div>
						</div>
						<div class="col-md-4 mt-4">
							<input type="Submit" value="Update" class="btn btn-primary btn-block mt-3 mb-4" style="width:100%">
						</div>
					</div>
			  		</form>
			  <%}%>
			  <% 	if(role.equalsIgnoreCase("doctor")){%>
			  		<form action="AddToPrescription.jsp" method="get">
			  		<div class="row">
			  			<div class="col-md-8">
				  			<input type="hidden" name="MedicineId" value="<%=medicineModel.getMedicineId() %>">
				  			<div class="mb-3 mt-3">
								<label for="Quantity">Quantity</label> 
								<input type="number"id="Quantity" name="Quantity" required class="form-control">
							</div>
						</div>
						<div class="col-md-4 mt-4">
							<input type="Submit" value="add" class="btn btn-primary btn-block mt-3 mb-4" style="width:100%">
						</div>
					</div>
			  		</form>
			  <%}%>
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
