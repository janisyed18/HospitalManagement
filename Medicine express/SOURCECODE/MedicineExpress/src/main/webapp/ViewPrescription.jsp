<%@page import="medicine.express.dao.AvailabilityDao"%>
<%@page import="java.nio.file.DirectoryIteratorException"%>
<%@page import="medicine.express.models.PatientMedicineModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="medicine.express.models.PrescriptionModel"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.dao.PrescriptionDao"%>

<% 
	String role = (String)session.getAttribute("role");
if(role.equalsIgnoreCase("Patient")) {%>
	<%@ include file="Phead.jsp"%>
<% } else { %>
	<%@ include file="Dhead.jsp"%>
<% }%>
<% 
	String DoctorId=(String)session.getAttribute("DoctorId");
	String PatientId=(String)session.getAttribute("PatientId");
	PrescriptionDao prescriptionDao = new PrescriptionDao();
	List<PrescriptionModel> prescriptionList= prescriptionDao.viewPrescription(DoctorId,PatientId,role);
	Collections.reverse(prescriptionList);
	Iterator<PrescriptionModel>prescriptionIterator=prescriptionList.iterator();
	float total = 0;
	float total2 = 0;
%>
		<div class="container">
			<% while(prescriptionIterator.hasNext()){
				PrescriptionModel prescriptionModel=prescriptionIterator.next();%>
			
			<div class="card m-5">
			
			  <div class="card-header">
			  <div class="row">
			  <div class="col-md-2 mt-2">
			  <div>Prescription ID:</div>
			  	<b><%=prescriptionModel.getPrescriptionId()%></b>
			  </div>
			  <div class="col-md-2 mt-2">
			  	<div>UHID:</div>
			  	<b><%=prescriptionModel.getPatientModel().getPatientId()%></b>
			  </div>
			  <div class="col-md-2 mt-2">
			  <div>Prescribed To:</div>
			  	<b><%=prescriptionModel.getPatientModel().getName().toUpperCase()%> &nbsp;</b>
			  </div>
			  <div class="col-md-2 mt-2">
			  <div>Prescribed By</div>
			  <b><%=prescriptionModel.getDoctorModel().getName().toUpperCase()%></b>
			  </div>
			  <div class="col-md-2 mt-2">
			  <div>Prescribed Date</div>
			  <b><%=prescriptionModel.getDatee()%></b>
			  </div>
			  <div class="col-md-2 mt-2">
			  <div>Status</div>
			  <b><%=prescriptionModel.getStatus()%></b>
			  </div>
			  </div>
			  </div>
			  <div class="card-body">
			  	<% 
			  	List<PatientMedicineModel> patientMedicineList=prescriptionDao.getPatientMedicine(prescriptionModel.getPrescriptionId());
			  	Iterator<PatientMedicineModel> patientmedicineiterator= patientMedicineList.iterator();
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
					  		<th>Available In</th>
					  		<th>Store Name</th>
					  		<th>Price</th>
					  		<th>Total Price</th>
					  		<% if(prescriptionModel.getStatus().equalsIgnoreCase("new")) {%>
					  				<th>Remove</th>
					  		<%}%>
					  		<% if(prescriptionModel.getStatus().equalsIgnoreCase("prescribed")&&role.equalsIgnoreCase("Patient")) {%>
					  				<th>Order</th>
					  		<%}%>
					  	</tr>
				  	</thead>
				    <tbody>
				    <% 
				      while(patientmedicineiterator.hasNext()){
				    	  PatientMedicineModel patientMedicineModel=patientmedicineiterator.next();
				    	  	
				    	  	float tmrp = (Float.parseFloat(patientMedicineModel.getMedicineModel().getMrp()))*(Integer.parseInt(patientMedicineModel.getQuantity()));
				    	  	  
				    	  	total = total+tmrp;
				    	  	
				    	  %>
				    	  <tr>
				    	  	<td><img src="Medicine/<%=patientMedicineModel.getMedicineModel().getPicture() %>" style="width:50px;"></td>
				    	  	<td><%=patientMedicineModel.getMedicineModel().getMedicineName() %></td>
				    	  	<td><%=patientMedicineModel.getMedicineModel().getBrand() %></td>
				    	  	<td><%=patientMedicineModel.getMedicineModel().getPower() %></td>
				    	  	<td><%=patientMedicineModel.getMedicineModel().getMrp() %></td>
				    	  	<td><%=patientMedicineModel.getQuantity()%></td>
				    	  	<td><%=tmrp%></td>
				    	  	<td>
				    	  		<% 
				    	  			AvailabilityDao availabilityDao = new AvailabilityDao();
				    	  			out.print(availabilityDao.getAvailablityInStores(patientMedicineModel.getMedicineId()));
				    	  		%> Stores
				    	  	</td>
				    	  	<td><%if(patientMedicineModel.getPrice()!=null){%>
				    	  		<%=patientMedicineModel.getMedicalModel().getName()%>
				    	  		<%}%>
				    	  	</td>
				    	  	<td><%
				    	  		if(patientMedicineModel.getPrice()!=null){%>
				    	  		<%=patientMedicineModel.getPrice()%>
				    	  		<%}%>
				    	  	</td>
				    	  	 <td>
				    	  		<%
				    	  		if(patientMedicineModel.getPrice()!=null){
				    	  			float tdisc = (Float.parseFloat(patientMedicineModel.getPrice()))*(Integer.parseInt(patientMedicineModel.getQuantity()));
									total2 = total2+tdisc;
				    	  			out.println(tdisc);
				    	  		}else{
				    	  			
				    	  		}
				    	  		%>
				    	  	</td>
				    	  	<% if(prescriptionModel.getStatus().equalsIgnoreCase("new")) {%>
					  				<th><a href="removeFromCart.jsp?PatientMedicineId=<%=patientMedicineModel.getPatientMedicineId()%>" class="btn btn-danger">Remove</a></th>
					  		<%}%>
					  		<% if(prescriptionModel.getStatus().equalsIgnoreCase("prescribed")&&role.equalsIgnoreCase("Patient")) {%>
					  				<th><a href="AddToCart.jsp?PatientMedicineId=<%=patientMedicineModel.getPatientMedicineId()%>&MedicineId=<%=patientMedicineModel.getMedicineId()%>&MedicineName=<%=patientMedicineModel.getMedicineModel().getMedicineName() %>" class="btn btn-info">Add to Cart</a></th>	
					  		<%}%>
				    	  </tr>
				   <%}%>
				    
				    <tr>
				    	<th colspan="6"></th>
				    	<th><%=total %></th>
				    	<th colspan="3"></th>
				    	<th><%=total2 %></th>
				    </tr>
				    </tbody>
			  	</table>
			  </div>
			  <div class="card-footer text-end">
			  		<% if(prescriptionModel.getStatus().equalsIgnoreCase("new")) {%>
			  			<a href="StoreMedicine.jsp?PatientId=<%=prescriptionModel.getPatientId()%>" class="btn btn-primary">Add More</a>
					  	<a href="sendPrescription.jsp?PrescriptionId=<%=prescriptionModel.getPrescriptionId()%>" class="btn btn-primary">Send Prescription</a>
					 <%}%>
			  		
			  </div>
	
			</div>
			<% }%>
		</div>