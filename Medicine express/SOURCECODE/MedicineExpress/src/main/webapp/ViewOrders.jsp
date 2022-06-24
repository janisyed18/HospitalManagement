<%@page import="medicine.express.models.MedicineItemModel"%>
<%@page import="medicine.express.models.PatientMedicineModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="medicine.express.models.MedicineorderModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.MedicineorderDao"%>
<% 
	String role = (String)session.getAttribute("role");
if(role.equalsIgnoreCase("Patient")) {%>
	<%@ include file="Phead.jsp"%>
<% } else { %>
	<%@ include file="Medicalhead.jsp"%>
<% }%>
<% 
	String PatientId = (String)session.getAttribute("PatientId");
	String MedicalId = (String)session.getAttribute("MedicalId");
	String viewType = request.getParameter("viewType");
	MedicineorderDao medicineorderDao=new MedicineorderDao();
	List<MedicineorderModel> medicineorderlist=medicineorderDao.getMedicineorder(PatientId,MedicalId,role,viewType);
	Collections.reverse(medicineorderlist);
	Iterator<MedicineorderModel> medicineorderIterator=medicineorderlist.iterator();
	float total = 0;
	float total2 = 0;
%>
<div class="container">
		<% if(medicineorderlist.size()==0) {%>
			<div class="text-center h4 mt-3">No Items Found in <%=viewType %> Orders</div>
		<% }else{%>
			<div class="text-center h4 mt-3"><%=viewType %> Orders</div>
		<%}%>
		<% if(viewType.equalsIgnoreCase("Cart")) {%>
			<div class="text-center h4 mt-3">Items in Cart</div>
		<% }
		
	while(medicineorderIterator.hasNext()){
		MedicineorderModel medicineorderModel=medicineorderIterator.next();%>
		<div class="card m-5">
			
			  <div class="card-header">
			  <div class="row">
			  <div class="col-md-2 mt-2">
			  <div>Order ID:</div>
			  	<b><%=medicineorderModel.getMedicineorderid() %></b>
			  </div>
			  <div class="col-md-2 mt-2">
			  	<div>UHID:</div>
			  	<b><%=medicineorderModel.getPatientModel().getPatientId()%></b>
			  </div>
			  <div class="col-md-2 mt-2">
			  <div>Prescribed To:</div>
			  	<b><%=medicineorderModel.getPatientModel().getName().toUpperCase()%> &nbsp;</b>
			  </div>
			  <div class="col-md-2 mt-2">
			  <div>Medical Store</div>
			  <b><%=medicineorderModel.getMedicalModel().getName().toUpperCase()%></b>
			  </div>
			  <div class="col-md-2 mt-2">
			  <div>Order Date</div>
			  <b><%=medicineorderModel.getDatee()%></b>
			  </div>
			  <div class="col-md-2 mt-2">
			  <div>Status</div>
			  <b><%=medicineorderModel.getStatus()%></b>
			  </div>
			  </div>
			  </div>
			  <div class="card-body">
			  	<% 
			  	List<MedicineItemModel> medicineItemList=medicineorderDao.getMedicineItem(medicineorderModel.getMedicineorderid());
			  	Iterator<MedicineItemModel> patientmedicineiterator= medicineItemList.iterator();
			  	%>
			  	<table class="table table-bordered ">
				  	<thead>
					  	<tr>
					  	    <th>Picture</th>
					  		<th>Medicine Name</th>
					  		<th>Brand</th>
					  		<th>Power</th>
					  		<th>Mrp</th>
					  		<th>Quantity</th>
					  		<th>Total MRP</th>
					  		<th>Store Price</th>
					  		<th>Store Total Price</th>
					  		
					  	</tr>
				  	</thead>
				    <tbody>
				    <% 
				      while(patientmedicineiterator.hasNext()){
				    	  MedicineItemModel medicineItemModel=patientmedicineiterator.next();
				    	  	
				    	  	float tmrp = (Float.parseFloat(medicineItemModel.getMedicineModel().getMrp()))*(Integer.parseInt(medicineItemModel.getQuantity()));
				    	  	  
				    	  	total = total+tmrp;
				    	  	
				    	  %>
				    	  <tr>
				    	  	<td><img src="Medicine/<%=medicineItemModel.getMedicineModel().getPicture() %>" style="width:50px;"></td>
				    	  	<td><%=medicineItemModel.getMedicineModel().getMedicineName() %></td>
				    	  	<td><%=medicineItemModel.getMedicineModel().getBrand() %></td>
				    	  	<td><%=medicineItemModel.getMedicineModel().getPower() %></td>
				    	  	<td><%=medicineItemModel.getMedicineModel().getMrp() %></td>
				    	  	<td><%=medicineItemModel.getQuantity()%></td>
				    	  	<td><%=tmrp%></td>
				    	  	<td><%
				    	  		if(medicineItemModel.getPrice()!=null){%>
				    	  		<%=medicineItemModel.getPrice()%>
				    	  		<%}%>
				    	  	</td>
				    	  	 <td>
				    	  		<%
				    	  		if(medicineItemModel.getPrice()!=null){
				    	  			float tdisc = (Float.parseFloat(medicineItemModel.getPrice()))*(Integer.parseInt(medicineItemModel.getQuantity()));
									total2 = total2+tdisc;
				    	  			out.println(tdisc);
				    	  		}else{
				    	  			
				    	  		}
				    	  		%>
				    	  	</td>
				
				    	  </tr>
				   <%}%>
				    
				    <tr>
				    	<th colspan="6"></th>
				    	<th><%=total %></th>
				    	<th colspan="1"></th>
				    	<th><%=total2 %></th>
				    </tr>
				    </tbody>
			  	</table>
			  </div>
			  <div class="card-footer text-end">	
			  		<% if(viewType.equalsIgnoreCase("Cart")) {%>
						<form action="orderNow.jsp" method="post">
							<input type="hidden" name="Medicineorderid" value="<%=medicineorderModel.getMedicineorderid() %>">
							<input type="hidden" name="total2" value="<%=total2 %>">
							<input type="hidden" name="MedicalId" value="<%=medicineorderModel.getMedicalId() %>">
							
							<input type="submit" value="Order Now" class="btn btn-primary">
						</form>
					<% }%>	
					<%if(role.equalsIgnoreCase("MedicalStore") && viewType.equalsIgnoreCase("Ordered")) {%>
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-3"></div>
							<div class="col-md-3">
								<form action="setOrder.jsp" method="post">
									<input type="hidden" name="Medicineorderid" value="<%=medicineorderModel.getMedicineorderid() %>">
									<input type="hidden" name="Status" value="Accepted">
									<input type="submit" value="Accept Order" class="btn btn-primary">
								</form>
							</div>
							<div class="col-md-3">
								<form action="setOrder.jsp" method="post">
									<input type="hidden" name="Medicineorderid" value="<%=medicineorderModel.getMedicineorderid() %>">
									<input type="hidden" name="Status" value="Rejected">
									<input type="submit" value="Reject Order" class="btn btn-danger">
								</form>
							</div>
						</div>

						
					<% }%>	  		
					<%if(role.equalsIgnoreCase("Patient") && viewType.equalsIgnoreCase("Accepted")) {%>
						<form action="setOrder.jsp" method="post">
							<input type="hidden" name="Medicineorderid" value="<%=medicineorderModel.getMedicineorderid() %>">
							<input type="hidden" name="Status" value="Delivered">
							<input type="submit" value="Pickup Order" class="btn btn-primary">
					    </form>	
					<% }%>	  		
			  </div>
	
			</div>
	<%}%>
</div>