<%@ include file="Dhead.jsp" %>
<div class="doctor-app-avm2">
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="card mt-5 p-3">
			<form action="ViewPatient1.jsp" method="post">
			<div class="mb-3 mt-3">
				<label for="PatientId">Enter Patient UHID</label>
				<input type="text" id="PatientId" name="PatientId" placeholder="Enter Patient UHID" required class="form-control">
			</div>
			<div>
				<input type="submit" value="Search" class="btn btn-primary btn-block mt-3 " style="width:100%;">	
			</div>
			</form>
		</div>
	</div>
</div>
</div>