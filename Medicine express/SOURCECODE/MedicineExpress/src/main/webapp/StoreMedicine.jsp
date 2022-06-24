<%@page import="medicine.express.models.SubcategoryModel"%>
<%@page import="medicine.express.dao.SubcategoryDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.models.CategoryModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.CategoryDao"%>

<% 
	String role=(String)session.getAttribute("role");
	if(role.equalsIgnoreCase("admin")){%>
		<%@ include file="ahead.jsp" %>
		
	<%}else if(role.equalsIgnoreCase("MedicalStore")){ %>
		<%@ include file="Medicalhead.jsp" %>
		
	<%}else{
		session.setAttribute("currentPatientId", request.getParameter("PatientId"));
	%>
		<%@ include file="Dhead.jsp" %>
		
	<%}%>


<script>
$(document).ready(function(){
	getMedicines();
	$("#CategoryId").on("change",()=>{
		getMedicines();
	})
	$("#SubcategoryId").on("change",()=>{
		getMedicines();
	})
	$("#MedicineName").on("keyup",()=>{
		getMedicines();
	})
	
});
function getMedicines(){
	console.log($("#SubcategoryId").val());
	 $.get("getMedicines.jsp?CategoryId="+$("#CategoryId").val()+"&SubcategoryId="+$("#SubcategoryId").val()+"&MedicineName="+$("#MedicineName").val()+"&type="+$("#type").val(), function(data, status){
	      $("#medicines").html(data)
	 });
}
</script>

<%
	
	CategoryDao categoryDao=new CategoryDao();
	List<CategoryModel> categoryList=categoryDao.getCategory();
	Iterator<CategoryModel> categoryIterator=categoryList.iterator();
%>
<%
	SubcategoryDao subcategoryDao=new SubcategoryDao();
	List<SubcategoryModel> subcategoryList=subcategoryDao.getSubcategory();
	Iterator<SubcategoryModel> subcategoryIterator=subcategoryList.iterator();
%>
<div class="container">
<div class="row mt-3" >
	<div class="col-md-12"> 
	  	<form action=" "method="post">
	  	<div class="row">
	  	<div class="col-md-4">
	  	<div class="mb-3 mt-3">
	  	<input type="hidden" id="type" value="<%=request.getParameter("type")%>">
		 <label for="CategoryId">Category</label> 
			<select id="CategoryId" required class="form-control" name="CategoryId"> 
			<option value="all">All Categories</option>
			<%
				while(categoryIterator.hasNext()){
				CategoryModel categoryModel= categoryIterator.next();%>
				<option value="<%=categoryModel.getCategoryId()%>"><%=categoryModel.getCategoryName()%></option>
			<%}%>	
			</select>
		</div>
		</div>
		<div class="col-md-4">
		<div class="mb-3 mt-3">
		 <label for="SubcategoryId">Sub Category</label> 
			<select id="SubcategoryId" required class="form-control" name="SubcategoryId"> 
			<option value="all">All SubCategories</option>
			<%
				while(subcategoryIterator.hasNext()){
					SubcategoryModel subcategoryModel= subcategoryIterator.next();%>
				<option value="<%=subcategoryModel.getSubcategoryId()%>"><%=subcategoryModel.getSubcategoryName()%></option>
			<%}%>		
			</select>
		</div>
		</div>
		<div class="col-md-4">
		<div class="mb-3 mt-3">
			<label for="MedicineName">Medicine Name</label>
			<input type="text" id="MedicineName" name="MedicineName" placeholder="Enter Medicine Name" value="all" required class="form-control">
		</div>
		</div>
		</div>
		</form>
	  </div>
</div>
<div id="medicines">
</div>
</div>
