
<% 
	String role = (String)session.getAttribute("role");
	if(role!=null&& role.equalsIgnoreCase("admin")){%>
		<%@ include file="ahead.jsp"%>
	<% } else{%>
		<%@ include file="mhead.jsp"%>
	<% }%>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="card p-3">
			<form action="creg1.jsp" method="post" enctype="multipart/form-data">
				<div class="text-center h2">New Medical Store Sign Up</div>
				<div class="row">
					<div class="col-md-6">
						<div class="mb-3 mt-3">
							<label for="Name">Name</label> <input type="text" id="Name"
								name="Name" placeholder="Enter Name" required
								class="form-control">
						</div>
						<div class="mb-3 mt-3">
							<label for="Ownername">Owner Name</label> <input type="text"
								id="Ownername" name="Ownername" placeholder="Enter Owner Name"
								required class="form-control">
						</div>
						<div class="mb-3 mt-3">
							<label for="Password">Password </label> <input type="Password"
								id="Password" name="Password" placeholder="Enter Password"
								required class="form-control">
						</div>
						<div class="mb-3 mt-3">
							<label for="Email">Email</label> <input type="Email" id="Email"
								name="Email" placeholder="Enter Email" required
								class="form-control">
						</div>
						
						<div class="mb-3 mt-3">
							<label for="Address">Add Address</label>
							<textarea name="Address" class="form-control" ></textarea>
						</div>
					</div >
					<div class="col-md-6">
						<div class="mb-3 mt-3">
							<label for="RegistrationNumber">Registration Number</label> <input
								type="Number" id="RegistrationNumber" name="RegistrationNumber"
								placeholder="Enter Registration Number" required
								class="form-control">
						</div>
						<div class="mb-3 mt-3">
							<label for="Phone">Phone</label> <input type="Number" id="Phone"
								name="Phone" placeholder="Enter Phone" required
								class="form-control">
						</div>
						<div class="mb-3 mt-3">
							<label for="Opentime">Open Time</label> <input type="Time"
								id="Time" name="Opentime" placeholder="Enter Open Time" required
								class="form-control">
						</div>
						<div class="mb-3 mt-3">
							<label for="Closetime">Close Time</label> <input type="Time"
								id="Time2" name="Closetime" placeholder="Enter Close Time"
								required class="form-control">
						</div>
						<div class="mb-3 mt-3">
							<label for="Documents">Documents</label> <input type="File"
								id="Documents" name="Documents" value="Choose File" required
								class="form-control">
						</div>
						<div class="mb-3 mt-3">
							<input type="Submit" value="Sign Up" class="btn btn-primary btn-block mt-3 mb-4" style="width:100%">
						</div>
					</div>
				</div>
			</form>
		</div>

	</div>
	<div class="col-md-2"></div>
</div>