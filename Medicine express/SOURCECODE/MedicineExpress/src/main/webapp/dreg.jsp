
<% 
	String role = (String)session.getAttribute("role");
	if(role!=null&& role.equalsIgnoreCase("admin")){%>
		<%@ include file="ahead.jsp"%>
	<% } else{%>
		<%@ include file="mhead.jsp"%>
	<% }%>
<div class="container mt-5">
	<div class="card p-4">
		<form action="dreg1.jsp" method="post" enctype="multipart/form-data">
			<div class="text-center h2">New Doctor Sign Up</div>
			<div class="row">
				<div class="col-md-4">
					<div class="mb-3 mt-3">
						<label for="Name">Name</label>
						<input type="text" id="Name" name="Name" placeholder="Enter Name" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Email">Email</label>
						 <input type="Email" id="Email"name="Email" placeholder="Enter Email" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Phone">Phone</label>
						<input type="Number" id="Phone"name="Phone" placeholder="Enter Phone" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Password">Password </label> 
						<input type="Password"id="Password" name="Password" placeholder="Enter Password"required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Address">Add Address</label>
						<textarea name="Address" class="form-control" ></textarea>
					</div>
				</div>
	

				<div class="col-md-4">
					
					<div class="mb-3 mt-3">
						<label for="RegistrationNumber">Registration Number</label>
						<input type="Number" id="RegistrationNumber" name="RegistrationNumber" placeholder="Enter Registration Number" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Education">Education </label> 
						<input type="text"id="Education" name="Education" placeholder="Enter Education"required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Languages">Languages </label> 
						<select id="Languages" required class="form-control" name="Languages"> 
							<option value="Spanish">Spanish</option>
							<option value="Italic">Italic</option>
							<option value="Chinese">Chinese</option>
						</select>
					</div>
					<div class="mb-3 mt-3">
						<label for="Experience">Experience</label>
						<input type="Number" id="Experience" name="Experience"placeholder="Enter Experience" required class="form-control">
					</div >
						<div class="mb-3 mt-3">
						<label for="Abouthim">About Him</label>
						<textarea name="Abouthim" class="form-control" ></textarea>
					</div>
				</div>

				<div class="col-md-4">
					
					<div class="mb-3 mt-3">
						<label for="Photo">Photo</label>
						<input type="File" id="Photo" name="Photo" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Starttime">Start Time</label> 
						<input type="Time"id="Time" name="Starttime" placeholder="Enter Start Time" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Endtime">End Time</label> 
						<input type="Time"id="Time2" name="Endtime" placeholder="Enter End Time" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Lunchtime">Lunch Time</label> 
						<input type="Time"id="Time3" name="Lunchtime" placeholder="Enter Lunch Time" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<label for="Speciality">Speciality</label> 
						<input type="text"id="Speciality" name="Speciality" placeholder="Enter Speciality" required class="form-control">
					</div>
					<div class="mb-3 mt-3">
						<input type="Submit" value="Sign Up" class="btn btn-primary btn-block mt-3 mb-4" style="width:100%">
					</div>
				</div>
				</div>
		</form>
	</div>
</div>