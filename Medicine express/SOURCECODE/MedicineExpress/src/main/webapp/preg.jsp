<%@ include file="mhead.jsp" %>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
	 <div class="card p-4">
		<form action="preg1.jsp" method="post">
			<div class="text-center h2">New Patient Sign Up</div>
			<div class="row">
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
						<label for="Age">Age </label> 
						<input type="Number"id="Age" name="Age" placeholder="Enter Age"required class="form-control">
				</div>
				<div class="mb-3 mt-3">
					   <label for="Gender">Gender</label>
          				<input type="radio" id="Gender" checked name="Gender" value="Male" required>Male
         			  	<input type="radio" id="Gender" name="Gender" value="Female" required>Female
				</div>
				<div class="mb-3 mt-3">
						<input type="Submit" value="Sign Up" class="btn btn-primary btn-block mt-3 mb-4" style="width:100%">
				</div>
				
			  </div>
		</form>
	</div>
	</div>
	</div>