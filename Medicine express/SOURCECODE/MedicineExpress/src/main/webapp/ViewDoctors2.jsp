<%@ include file="Phead.jsp"%>

<script>
$(document).ready(()=>{
	getDoctors();
	$("#Speciality").on("keyup",()=>{
		getDoctors();
	});
	
	$("#Name").on("keyup",()=>{
		getDoctors();
	});
});

function getDoctors(){
	$.get("getDoctors.jsp?Speciality="+$("#Speciality").val()+"&Name="+$("#Name").val(),(data,status)=>{
		$("#doctors").html(data);
		
	});
}

</script>
<div class="container">
<div class="row mt-3">
	<div class="col-md-12"></div>
	
		<div class="card mt-3 p-3">
			<form action="" method="post">
			<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<div class="mb-3 mt-3">
					<label for="Speciality">Speciality</label>
					<input type="text" id="Speciality" name="Speciality" placeholder="Enter Speciality" value="" required class="form-control">
				</div>
				</div>
				<div class="col-md-5">
				<div class="mb-3 mt-3">
				<div class="form-group">
					<label for="Name">Name</label>
					<input type="text" id="Name" name="Name" placeholder="Enter Doctor Name" value="" required class="form-control">
				</div>
				</div>
				</div>
				</div>
			</form>
		</div>
	</div>
	<div id="doctors">
	</div>
</div>

