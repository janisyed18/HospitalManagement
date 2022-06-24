<%@page import="medicine.express.models.WalletModel"%>
<%@page import="medicine.express.dao.MedicineorderDao"%>
<% 
	String Medicineorderid = request.getParameter("Medicineorderid");
	String total2 = request.getParameter("total2");
	String PatientId = (String)session.getAttribute("PatientId");
	String MedicalId = request.getParameter("MedicalId");
	
	WalletModel walletModel=new WalletModel();

	walletModel.setMedicalId(MedicalId);
	walletModel.setMedicineorderid(Medicineorderid);
	walletModel.setAmount(total2);
	walletModel.setPatientId(PatientId);
	MedicineorderDao medicineorderDao = new MedicineorderDao();
	medicineorderDao.setWalletModel(walletModel);
	medicineorderDao.orderNow(Medicineorderid,response);
%>