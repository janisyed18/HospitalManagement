<%@ include file="mhead.jsp" %>
<div class="doctor-app-mlg">
<div class="row">
<div class="col-md-4"></div>
<div class="col-md-4"><br><br><br>
	<div class="card mt-5 p-3">
		<form action="mlog1.jsp" method="post">
		<div class="text-center h3">Medical Store Login</div>
			<div class="mb-3 mt-3">
				<label for="phone">Phone</label>
				<input type="text" id="phone" name="phone" placeholder="Enter Phone Number" required class="form-control">
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" placeholder="Enter Password" required class="form-control">
			</div>
			<input type="submit" value="Login" class="btn btn-primary btn-block mt-3 mb-4" style="width:100%;">
			<br>
			<div class="text-center"><a href="creg.jsp">New Medical Store Click Here to Register</a></div>
		</form>
	</div>
</div>
<div class="col-md-4"></div>
</div>
</div>