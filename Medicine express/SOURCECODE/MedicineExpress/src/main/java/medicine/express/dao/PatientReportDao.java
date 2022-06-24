package medicine.express.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import medicine.express.dbcon.DatebaseConnection;
import medicine.express.models.DoctorModel;
import medicine.express.models.PatientReportModel;

public class PatientReportDao {

	public String addReports(PatientReportModel patientReportModel) {
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();

			int a = st.executeUpdate("insert into PatientReport(Reporttitle,Reportvalue,PatientId,DoctorId) values('"
					+ patientReportModel.getReporttitle() + "','" + patientReportModel.getReportvalue() + "','"
					+ patientReportModel.getPatientId() + "','"+patientReportModel.getDoctorId()+"')");

			return "Patient Reports added Succefully";
		} catch (Exception e) {
			System.out.println(e);
			return "Fails to add Patient Reports";
		}
	}

	public List<PatientReportModel>viewReports(String PatientId){
		
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs=st.executeQuery("Select * from PatientReport where PatientId='"+PatientId+"'");
			
			List<PatientReportModel>patientreportList=new ArrayList<PatientReportModel>();
			
			while(rs.next()) {
				PatientReportModel patientReportModel=new PatientReportModel();
				patientReportModel.setPatientreportId(rs.getString("PatientreportId"));
				patientReportModel.setReporttitle(rs.getString("Reporttitle"));
				patientReportModel.setReportvalue(rs.getString("Reportvalue"));
				patientReportModel.setPatientId(rs.getString("PatientId"));
				patientReportModel.setDoctorId(rs.getString("DoctorId"));
				patientReportModel.setDatee(rs.getString("Datee"));
				
				DoctorDao doctorDao=new DoctorDao();
				DoctorModel doctorModel=doctorDao.getDoctorDetails(patientReportModel.getDoctorId());
				patientReportModel.setDoctorModel(doctorModel);
				
				patientreportList.add(patientReportModel);
			}
			return patientreportList;
			
		}catch(Exception e) {
			System.out.println(e);
			
		}
		return null;
	}
}
