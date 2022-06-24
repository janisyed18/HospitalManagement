<%@ include file="Dhead.jsp" %>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4"> 
	<div class="card p-4 mt-4">
	  	<form action="AddReports1.jsp" method="post">
	  	<div class="text-center h3">Add Patient Reports</div>
	  	<input type="hidden" name="PatientId" value="<%=request.getParameter("PatientId")%>">
			<div class="mb-3 mt-3">
				<label for="Reporttitle" class="form-label">Report Title</label>
				<input type="text" name="Reporttitle" class="form-control" id="Reporttitle" placeholder="Enter Report Title" required>
			</div>
			<div class="mb-3 mt-3">
				<label for="Reportvalue" class="form-label">Report Value</label>
				<input type="text" name="Reportvalue" class="form-control" id="Reportvalue" placeholder="Enter Report Value" required>
			</div>
			<div>
				<input type="Submit" value="Add" class="btn btn-primary"  style="width: 100%;">
			</div>
		</form>
		</div>
	  </div>
</div>
