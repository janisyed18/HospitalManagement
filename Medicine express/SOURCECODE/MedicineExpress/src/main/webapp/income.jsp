<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="medicine.express.models.WalletModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="medicine.express.dao.MedicineorderDao"%>
<%@ include file="Medicalhead.jsp"%>
<% 
	String MedicalId = (String)session.getAttribute("MedicalId");
	MedicineorderDao medicineorderDao=new MedicineorderDao();
	Map<String, List<WalletModel>> walletMap = medicineorderDao.getWalletModels(MedicalId);
	System.out.println(walletMap.size());
	Map<String, String> dayRecores = new HashMap();
	
	%>
	<div class="container">
	<%for (Map.Entry<String,List<WalletModel>> wallet : walletMap.entrySet()){
		float total = 0;
	%>
		<div class="card mt-3">
			<div class="card-header"><b><%=wallet.getKey()%></b></div>
			  <div class="card-body">
			  	<% 
			  		List<WalletModel> walletModelList = wallet.getValue();
			  		Iterator<WalletModel> walletIterator = walletModelList.iterator();%>
			  		<table class="table table-bordered">
			  		<tr>
			  			<th>Patient Name</th>
			  			<th>Order Id</th>
			  			<th>Amount</th>
			  			<th>Date</th>
			  		</tr>
			  		<%while(walletIterator.hasNext()){
			  			WalletModel walletModel =walletIterator.next();
			  			total =total + Float.parseFloat(walletModel.getAmount());
			  			%>
			  			<tr>
			  			<td><%=walletModel.getPatientModel().getName()%></td>
			  			<td><%=walletModel.getMedicineorderid()%></td>
			  			<td><%=walletModel.getAmount()%></td>
			  			<td><%=walletModel.getWalletDate()%></td>
			  			</tr>
			  		<% }%>
			  		<% dayRecores.put(wallet.getKey(), ""+total);%>
			  		<tr><th></th><th class="text-end">Total</th><th><%=total%></th></tr>
			  		</table>
			  </div>
			  
		</div>
	<%}%>
	</div>

