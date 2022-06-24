<%@ include file="ahead.jsp" %>
<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.models.CategoryModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.CategoryDao"%>

<script>
$(document).ready(function(){
	$("#CategoryId").on("change",()=>{
		$.get("getSubCategories.jsp?CategoryId="+$("#CategoryId").val(), function(data, status){   
		    $("#SubcategoryId").html(data);
		  });
		});
	})
	  
</script>
<%
	CategoryDao categoryDao=new CategoryDao();
	List<CategoryModel> categoryList=categoryDao.getCategory();
	Iterator<CategoryModel> categoryIterator=categoryList.iterator();
%>

<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	 <div class="card p-4 mt-3">
		<form action="AddMedicine1.jsp" method="post" enctype="multipart/form-data">
			<div class="text-center h2">Add New Medicine</div>
			<div class="row">
			<div class="col-md-6">
				<div class="mb-3 mt-3">
					<label for="MedicineName">Medicine Name</label>
					<input type="text" id="MedicineName" name="MedicineName" placeholder="Enter Medicine Name" required class="form-control">
				</div>
				<div class="mb-3 mt-3">
						<label for="CategoryId">Category </label> 
						<select  name="CategoryId" id="CategoryId" required class="form-control">
						<option value="">Choose Category</option>
						<%
							while(categoryIterator.hasNext()){
								CategoryModel categoryModel= categoryIterator.next();%>
								<option value="<%=categoryModel.getCategoryId()%>"><%=categoryModel.getCategoryName()%></option>
							<%}
						%>
						</select>
				</div>
				<div class="mb-3 mt-3">
					<label for="Brand">Brand</label>
					<input type="text" id="Brand" name="Brand" placeholder="Enter Brand Name" required class="form-control">
				</div>
				<div class="mb-3 mt-3">
					<label for="PackingType">Packing Type</label>
					<select id="PackingType" name="PackingType"  required class="form-control">
						<option>Ampoules</option>
						<option>Vials</option>
						<option>Containers</option>
						<option>Strip package</option>
						<option>Blister Packaging</option>
						<option>Syringe</option>
						<option>Dosing Doppler</option>
						<option>Sachet Packaging</option>
					</select>
				</div>
				<div class="mb-3 mt-3">
					<label for="Description">Medicine Description</label>
					<textarea id="Description" name="Description" placeholder="Enter Description" required class="form-control"></textarea>
				</div>
			  	</div>
			  	<div class="col-md-6">
			  		<div class="mb-3 mt-3">
						<label for="Mrp">MRP</label>
						<input type="number" id="Mrp" name="Mrp" placeholder="Enter MRP" required class="form-control">
					</div>
				  	<div class="mb-3 mt-3">
						<label for="SubcategoryId">Sub Category </label> 
						<select  name="SubcategoryId" id="SubcategoryId" required class="form-control">
						<option value="">Choose Sub Category</option>
						</select>
					</div>
				<div class="mb-3 mt-3">
					<label for="Power">Power</label>
					<input type="text" id="Power" name="Power" placeholder="Enter Power" required class="form-control">
				</div>
			   <div class="mb-3 mt-3">
					<label for="Picture">Medicine Picture</label>
					<input type="file" id="Picture" name="Picture" required class="form-control">
				</div>
				<div class="mb-3 mt-3">
					<label for="">Is Prescription Compulsory ?</label> <br><br>
					&nbsp; &nbsp; &nbsp; <input type="radio" id="PrescriptionType1" value="yes" name="PrescriptionType">&nbsp;<label for="PrescriptionType1">Yes</label>
					 &nbsp; &nbsp; &nbsp; <input type="radio" id="PrescriptionType2" value="no" name="PrescriptionType">&nbsp;<label for="PrescriptionType2">No</label>
				</div>
			  	</div>
			</div>	
			<div class="mt-1">
						<input type="Submit" value="Add Medicine" class="btn btn-primary btn-block mt-3 mb-4" style="width:100%">
			</div>
		</form>
	</div>
	</div>
	</div>
