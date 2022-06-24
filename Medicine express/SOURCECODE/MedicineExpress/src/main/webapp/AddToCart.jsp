<%@page import="medicine.express.models.PatientMedicineModel"%>
<%@page import="medicine.express.dao.PrescriptionDao"%>
<%@page import="medicine.express.models.AvailabilityModel"%>
<%@page import="medicine.express.dao.AvailabilityDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.dao.MedicalDao"%>
<%@page import="medicine.express.models.MedicalModel"%>
<%@page import="java.util.List"%>
<%@ include file="Phead.jsp"%>
<% 
	String PatientMedicineId = request.getParameter("PatientMedicineId");
	String MedicineId = request.getParameter("MedicineId");
	String MedicineName = request.getParameter("MedicineName");
	String PatientId = (String)session.getAttribute("PatientId");
	MedicalDao medicalDao = new MedicalDao();
	List<MedicalModel> medicalStoreList = medicalDao.getMedicalStoreByMedicine(MedicineId);
	Iterator<MedicalModel> medicalIterator = medicalStoreList.iterator();
	PrescriptionDao prescriptionDao = new PrescriptionDao();
	PatientMedicineModel patientMedicineModel=prescriptionDao.getPatientMedicineById(PatientMedicineId);
%>
<div class="container">
	<div class="text-center h4 m-3"> 
	<% if(medicalStoreList.size()>0){ %>
	<%=MedicineName.toUpperCase()%> is Available in Below Stores
	<%}else {%>
		<%=MedicineName.toUpperCase()%> is not Available in any Stores
	<% } %>
	 </div>
	
	<table class="table table-bordered">
		<tr>
			<th>Store Name</th>
			<th>Phone</th>
			<th>Address</th>
			<th>Unit Price</th>
			<th>Quantity</th>
			<th>Total</th>
			<th>Add to Card</th>
		</tr>
		<%
			while(medicalIterator.hasNext()){
				MedicalModel medicalModel = medicalIterator.next();
				AvailabilityDao availabilityDao = new AvailabilityDao();
				AvailabilityModel availabilityModel = availabilityDao.getPriceByStore(MedicineId, medicalModel.getMedicalId());
				%>
				<tr>
					<td><%=medicalModel.getName() %></td>
					<td><%=medicalModel.getPhone() %></td>
					<td><%=medicalModel.getAddress() %></td>
					<td>$ <%=availabilityModel.getPrice()%></td>
					<td><%=patientMedicineModel.getQuantity() %></td>
					<td>$<%out.print(Integer.parseInt(patientMedicineModel.getQuantity())*Float.parseFloat(availabilityModel.getPrice()) ); %></td>
					<td><a class="btn btn-primary" href="addToCart2.jsp?PatientMedicineId=<%=PatientMedicineId%>&MedicineId=<%=MedicineId%>&MedicineName=<%=MedicineName %>&MedicalId=<%=medicalModel.getMedicalId()%>">Add to Cart</a></td>
				</tr>	
			<%}
		%>
	</table>
</div>
