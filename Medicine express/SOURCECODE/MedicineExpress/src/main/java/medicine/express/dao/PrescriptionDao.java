package medicine.express.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import medicine.express.dbcon.DatebaseConnection;
import medicine.express.models.DoctorModel;
import medicine.express.models.MedicalModel;
import medicine.express.models.MedicineModel;
import medicine.express.models.PatientMedicineModel;
import medicine.express.models.PatientModel;
import medicine.express.models.PrescriptionModel;


public class PrescriptionDao {
	
	public String getMedicine(String MedicineId,String PatientId,String Quantity,String DoctorId) {
		
		try {
			String PrescriptionId=null;
			
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from Prescription where Status='New' and PatientId='"+PatientId+"' and DoctorId='"+DoctorId+"' ");
			
			if(rs.next()) {
				PrescriptionId=rs.getString("PrescriptionId");
				
			}else {
				Statement st2 = con.createStatement();
				int a=st2.executeUpdate("insert into Prescription(PatientId,DoctorId) values('"+PatientId+"','"+DoctorId+"')",Statement.RETURN_GENERATED_KEYS);	
				ResultSet rs2= st2.getGeneratedKeys();
				while(rs2.next()) {
					PrescriptionId = rs2.getString(1);
				}
			}
			Statement st3 = con.createStatement();
			ResultSet rs3=st3.executeQuery("select * from PatientMedicine where PrescriptionId='"+PrescriptionId+"'and MedicineId='"+MedicineId+"' ");
			if(rs3.next()) {
				Statement st4 = con.createStatement();
				
				int a=st4.executeUpdate("update PatientMedicine set Quantity='"+Quantity+"' where PrescriptionId='"+PrescriptionId+"'and MedicineId='"+MedicineId+"' ");
				
			} else {
				Statement st5 = con.createStatement();
				int a=st5.executeUpdate("insert into PatientMedicine(PrescriptionId,Quantity,MedicineId) values('"+PrescriptionId+"','"+Quantity+"','"+MedicineId+"');");
				
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public List<PrescriptionModel> viewPrescription(String DoctorId,String PatientId,String role){
		List<PrescriptionModel> prescriptionList=new ArrayList<PrescriptionModel>();
		try {
			String query = "select * from Prescription where PatientId='"+PatientId+"'";
			if(DoctorId!=null) {
				query="select * from Prescription where DoctorId='"+DoctorId+"'";
			}
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()) {
				PrescriptionModel prescriptionModel=new PrescriptionModel();
				prescriptionModel.setPrescriptionId(rs.getString("PrescriptionId"));
				prescriptionModel.setDoctorId(rs.getString("DoctorId"));
				prescriptionModel.setPatientId(rs.getString("PatientId"));
				prescriptionModel.setStatus(rs.getString("Status"));
				prescriptionModel.setDatee(rs.getString("Datee"));
				
				DoctorDao doctorDao = new DoctorDao();
				DoctorModel doctorModel = doctorDao.getDoctorDetails(prescriptionModel.getDoctorId());
				prescriptionModel.setDoctorModel(doctorModel);
				
				PatientDao patientDao = new PatientDao();
				PatientModel patientModel = patientDao.searchPatient(prescriptionModel.getPatientId());
				prescriptionModel.setPatientModel(patientModel);
				if(role.equalsIgnoreCase("Patient") && !prescriptionModel.getStatus().equalsIgnoreCase("New")) {
					prescriptionList.add(prescriptionModel);
				}else if(role.equalsIgnoreCase("doctor") ) {
					prescriptionList.add(prescriptionModel);
				}
				
			}
			
			return prescriptionList;
			
		}catch(Exception e){
			
			System.out.println(e);
		}
		return null;
	}
	
	public List<PatientMedicineModel> getPatientMedicine(String PrescriptionId){
		List<PatientMedicineModel>  patientMedicineList = new ArrayList<PatientMedicineModel>();
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select * from PatientMedicine where PrescriptionId='"+PrescriptionId+"'");
			while(rs.next()) {
				PatientMedicineModel patientMedicineModel = new PatientMedicineModel();
				patientMedicineModel.setPatientMedicineId(rs.getString("PatientMedicineId"));
				patientMedicineModel.setPrescriptionId(rs.getString("PrescriptionId"));
				patientMedicineModel.setQuantity(rs.getString("Quantity"));
				patientMedicineModel.setPrice(rs.getString("Price"));
				patientMedicineModel.setMedicalId(rs.getString("MedicalId"));
				patientMedicineModel.setMedicineId(rs.getString("MedicineId"));
				MedicalDao medicalDao=new MedicalDao();
				MedicalModel medicalModel=medicalDao.getMdicalDetails(patientMedicineModel.getMedicalId());
				patientMedicineModel.setMedicalModel(medicalModel);
				
				MedicineDao medicineDao=new MedicineDao();
				MedicineModel medicineModel=medicineDao.getMedicineDetails(patientMedicineModel.getMedicineId());
				patientMedicineModel.setMedicineModel(medicineModel);
				
				patientMedicineList.add(patientMedicineModel);
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return patientMedicineList;
	}
	
	public void removeMedicines(HttpServletResponse responce,String PatientMedicineId) {
		
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			int a=st.executeUpdate("delete from PatientMedicine where PatientMedicineId='"+PatientMedicineId+"'");
			
			responce.sendRedirect("ViewPrescription.jsp");
			
		}catch(Exception e) {
			
			System.out.println(e);
		}
	}
	
	public void sendPrescription(HttpServletResponse responce,String PrescriptionId) {
		
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			int a=st.executeUpdate("update Prescription set Status='Prescribed' where PrescriptionId='"+PrescriptionId+"'");
			
			responce.sendRedirect("ViewPrescription.jsp");
		}catch(Exception e) {
			System.out.println(e);	
		}
	}
	
	public PatientMedicineModel getPatientMedicineById(String PatientMedicineId){
		PatientMedicineModel patientMedicineModel = new PatientMedicineModel();
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select * from PatientMedicine where PatientMedicineId='"+PatientMedicineId+"'");
			if(rs.next()) {
				
				patientMedicineModel.setPatientMedicineId(rs.getString("PatientMedicineId"));
				patientMedicineModel.setPrescriptionId(rs.getString("PrescriptionId"));
				patientMedicineModel.setQuantity(rs.getString("Quantity"));
				patientMedicineModel.setPrice(rs.getString("Price"));
				patientMedicineModel.setMedicalId(rs.getString("MedicalId"));
				patientMedicineModel.setMedicineId(rs.getString("MedicineId"));
				MedicalDao medicalDao=new MedicalDao();
				MedicalModel medicalModel=medicalDao.getMdicalDetails(patientMedicineModel.getMedicalId());
				patientMedicineModel.setMedicalModel(medicalModel);
				
				MedicineDao medicineDao=new MedicineDao();
				MedicineModel medicineModel=medicineDao.getMedicineDetails(patientMedicineModel.getMedicineId());
				patientMedicineModel.setMedicineModel(medicineModel);
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return patientMedicineModel;
	}
	
}
