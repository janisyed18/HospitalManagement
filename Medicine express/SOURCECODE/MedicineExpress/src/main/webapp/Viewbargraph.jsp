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
	Map<String, String> dayRecores = new HashMap();
	
	for (Map.Entry<String,List<WalletModel>> wallet : walletMap.entrySet()){
		float total = 0;
			  		List<WalletModel> walletModelList = wallet.getValue();
			  		Iterator<WalletModel> walletIterator = walletModelList.iterator();
			  		
			  		while(walletIterator.hasNext()){
			  			WalletModel walletModel =walletIterator.next();
			  			total =total + Float.parseFloat(walletModel.getAmount());
			  		}
			  		 dayRecores.put(wallet.getKey(), ""+total);
	                    }
	%>
<div class="card m-5">	
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

	<canvas id="myChart" style="width:100%;max-width:600px"></canvas>

<script>
$(document).ready(function(){
	var  yValues=[
		<%for (Map.Entry<String,String> day : dayRecores.entrySet()){%>
			parseFloat(<%=day.getValue()%>),
		<%}%>];
	var  barColors=[
		<%for (Map.Entry<String,String> day : dayRecores.entrySet()){%>
			'green',
		<%}%>];
	var  xValues=[
		<%for (Map.Entry<String,String> day : dayRecores.entrySet()){%>
			'<%=day.getKey()%>',
		<%}%>];
	console.log(yValues);
	//var xValues = ["Italy", "France", "Spain", "USA", "Argentina","venu"];
	//var yValues = [55.8, 49, 44, 24,76];
	//var barColors = ["red", "green","blue","orange"];

	new Chart("myChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: barColors,
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    title: {
	      display: true,
	      text:"Income Per Day"
	    }
	  }
	});
});
</script>
</body>
</div>
</div>
</div>