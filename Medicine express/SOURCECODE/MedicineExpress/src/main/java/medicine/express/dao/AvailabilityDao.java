package medicine.express.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletResponse;

import medicine.express.dbcon.DatebaseConnection;
import medicine.express.models.AvailabilityModel;

public class AvailabilityDao {

	public void setAvilabilityMedicine(AvailabilityModel availabilityModel, HttpServletResponse response) {
		
		
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from  Availability where MedicineId='"+availabilityModel.getMedicineId()+"'and MedicalId='"+availabilityModel.getMedicalId()+"'  "); 
			if(rs.next()) {
				Statement st2 = con.createStatement();
				int a=st2.executeUpdate("update Availability set Available='"+availabilityModel.getAvailable()+"',price='"+availabilityModel.getPrice()+"' where MedicineId='"+availabilityModel.getMedicineId()+"'and MedicalId='"+availabilityModel.getMedicalId()+"'  ");
				
				
			}else {
				Statement st3 = con.createStatement();
				
				int a = st3.executeUpdate("insert into Availability(MedicineId,MedicalId,Available,price) values('"
						+ availabilityModel.getMedicineId() + "','" + availabilityModel.getMedicalId() + "','"
						+ availabilityModel.getAvailable() + "','"+availabilityModel.getPrice()+"')");
				
			}
			response.sendRedirect("StoreMedicine.jsp?type=all");
			
		} catch (Exception e) {
			System.out.println(e);

		}

	
	}

	public int getAvailablityInStores(String MedicineId) {
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			System.out.println("select count(MedicineId) from  Availability where MedicineId='"+MedicineId+"'and Available>0");
			ResultSet rs=st.executeQuery("select count(MedicineId) from  Availability where MedicineId='"+MedicineId+"'and Available>0  "); 
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	public AvailabilityModel getPriceByStore(String MedicineId,String MedicalId) {
		AvailabilityModel availabilityModel = new AvailabilityModel();
		try {
			
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			System.out.println("select * from  Availability where MedicineId='"+MedicineId+"'and MedicalId='"+MedicalId+"'");
			ResultSet rs=st.executeQuery("select * from  Availability where MedicineId='"+MedicineId+"'and MedicalId='"+MedicalId+"'"); 
			if(rs.next()) {
				availabilityModel.setAvailabilityId(rs.getString("AvailabilityId"));
				availabilityModel.setAvailable(rs.getString("Available"));
				availabilityModel.setMedicalId(rs.getString("MedicalId"));
				availabilityModel.setPrice(rs.getString("price"));
				availabilityModel.setMedicineId(rs.getString("MedicineId"));
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return availabilityModel;
	}
}
