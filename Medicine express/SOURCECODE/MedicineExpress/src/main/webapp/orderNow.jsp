<%@ include file="Phead.jsp"%>
<% 
	String Medicineorderid = request.getParameter("Medicineorderid");
	String total2 = request.getParameter("total2");
	String MedicalId = request.getParameter("MedicalId");
	
%>
<script>
$(document).ready(function(){
 	$("#cardNumber").on("blur",()=>{
 		if($("#cardNumber").val().length!=16){
 			alert('Card Number Length should be 16')
 		}
 	})
 	$("#cvv").on("blur",()=>{
 		if($("#cvv").val().length!=3 && $("#cvv").val().length!=4){
 			alert('Invalid CVV')
 		}
 	})
 	 $("#expiryDate").on("blur",()=>{
 		if($("#expiryDate").val().length!=5){
 			alert('Invalid Expire Date')
 		}
 	})
 	
});
</script>

<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div class="card p-3 mt-5">
			<form action="orderNow2.jsp" method="post">
				<input type="hidden" name="Medicineorderid" value="<%=Medicineorderid%>">
				<input type="hidden" name="MedicalId" value="<%=MedicalId %>">
				<input type="hidden" name="total2" value="<%=total2 %>">
				<div class="text-center h4">Pay Now</div>
				<div class="text-center h4">Total Amount :$ <%=total2 %></div>
				<div class="mb-3 mt-3">
					<label for="cardNumber" class="form-label">Card Number</label>
					<input type="number" name="cardNumber" class="form-control" id="cardNumber" placeholder="Enter Card Number" required>
				</div>
				<div class="mb-3 mt-3">
					<label for="cardName" class="form-label">Name on Card</label>
					<input type="text" name="cardName" class="form-control" id="cardName" placeholder="Name On Card" required>
				</div>
				<div class="mb-3 mt-3">
					<label for="cvv" class="form-label">CVV</label>
					<input type="text" name="cvv" class="form-control" id="cvv" placeholder="Enter CVV" required>
				</div>
				<div class="mb-3 mt-3">
					<label for="expiryDate" class="form-label">Expiry Date</label>
					<input type="text" name="expiryDate" class="form-control" id="expiryDate" placeholder="Enter Expiry Date (MM/YY)" required>
				</div>
				<div>
					<input type="Submit" value="Pay Now" class="btn btn-primary" id="pay"  style="width: 100%;">
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-3"></div>
</div>