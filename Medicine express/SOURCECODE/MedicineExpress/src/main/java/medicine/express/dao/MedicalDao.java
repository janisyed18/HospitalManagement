package medicine.express.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import emailsending.Email;
import medicine.express.dbcon.DatebaseConnection;
import medicine.express.models.DoctorModel;
import medicine.express.models.MedicalModel;

public class MedicalDao {

	public String creg(MedicalModel medicalModel) {

		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			int a = st.executeUpdate(
					"insert into Medical(Name,RegistrationNumber,Ownername,Phone,Password,Email,Opentime,Closetime,Documents,Address) values('"
							+ medicalModel.getName() + "','" + medicalModel.getRegistrationNumber() + "','"
							+ medicalModel.getOwnername() + "','" + medicalModel.getPhone() + "','"
							+ medicalModel.getPassword() + "','" + medicalModel.getEmail() + "','"
							+ medicalModel.getOpentime() + "','" + medicalModel.getClosetime() + "','"
							+ medicalModel.getDocuments() + "','"+medicalModel.getAddress()+"')");
			Email.sendEmail("MedicalStore Registration", "Your MedicalStore Account Created Successfully.Your Login Credentails Are Phone: "+medicalModel.getPhone()+" Password:"+ medicalModel.getPassword(), "Email.getEmail()");
			
			return "Medical Store Registred Successfully";
			
		} catch (Exception e) {
			System.out.println(e);
			
			return "Registration Failed";
		}
		
	}
	
	
	public boolean medicalLogin(String phone,String password,HttpServletResponse response,HttpSession session) {
		
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select * from Medical where Phone='"+phone+"' and Password='"+password+"'");
			if(rs.next()) {		
				if(rs.getString("Status").equalsIgnoreCase("Activated")) {
					
					session.setAttribute("MedicalId", rs.getString("MedicalId"));
					session.setAttribute("Name", rs.getString("Name"));
					session.setAttribute("role","MedicalStore");
					
					response.sendRedirect("Medicalstorehome.jsp");
					
				}else {
					response.sendRedirect("MmessageFailed.jsp?Msg=Medical Store Profile Not Activated");
				}
				
				
			}else {
				
				response.sendRedirect("MmessageFailed.jsp?Msg=Invalid Login Details");
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
			
			
			return false;
		}
		
		return false;
	}
	
	public List<MedicalModel> Viewmedicalstore(){
		
		try {
			
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from Medical ");
			 
			List<MedicalModel> medicalList=new ArrayList<MedicalModel>();
			
			while( rs.next()) {
				
				MedicalModel medicalModel=new MedicalModel();
				
				medicalModel.setMedicalId(rs.getString("MedicalId"));
				medicalModel.setName(rs.getString("Name"));
				medicalModel.setRegistrationNumber(rs.getString("RegistrationNumber"));
				medicalModel.setOwnername(rs.getString("Ownername"));
				medicalModel.setPhone(rs.getString("Phone"));
				medicalModel.setPassword(rs.getString("Password"));
				medicalModel.setEmail(rs.getString("Email"));
				medicalModel.setOpentime(rs.getString("Opentime"));
				medicalModel.setClosetime(rs.getString("Closetime"));
				medicalModel.setDocuments(rs.getString("Documents"));
				medicalModel.setAddress(rs.getString("Address"));
				medicalModel.setStatus(rs.getString("Status"));
				
				medicalList.add(medicalModel);
				
			}
				return medicalList;
			
		}catch (Exception e) {
			System.out.println(e);
			
			return null;
		}
	  }
	
	
	public void Activate (String MedicalId,String Status,HttpServletResponse response) {
		String newstatus=null;
		
		if (Status.equalsIgnoreCase("activated")) {
			newstatus="deactivated";
		}else {
			newstatus="activated";
		}
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			int a = st.executeUpdate("update Medical set status='"+newstatus+"' where MedicalId='"+MedicalId+"' ");
	
			response.sendRedirect("Viewmedicalstore.jsp");
	
		} catch (Exception e) {
	
			System.out.println(e);
	
		}
	}
	
	public MedicalModel getMdicalDetails(String MedicalId) {
		MedicalModel medicalModel=new MedicalModel();
		
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select * from Medical where MedicalId='"+MedicalId+"'");
			
			if(rs.next()) {
				medicalModel.setMedicalId(rs.getString("MedicalId"));
				medicalModel.setName(rs.getString("Name"));
				medicalModel.setRegistrationNumber(rs.getString("RegistrationNumber"));
				medicalModel.setOwnername(rs.getString("Ownername"));
				medicalModel.setPhone(rs.getString("Phone"));
				medicalModel.setPassword(rs.getString("Password"));
				medicalModel.setEmail(rs.getString("Email"));
				medicalModel.setOpentime(rs.getString("Opentime"));
				medicalModel.setClosetime(rs.getString("Closetime"));
				medicalModel.setDocuments(rs.getString("Documents"));
				medicalModel.setAddress(rs.getString("Address"));
				medicalModel.setStatus(rs.getString("Status"));
				
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return medicalModel;
	}
	
	public List<MedicalModel>  getMedicalStoreByMedicine(String MedicineId) {
		List<MedicalModel> medicalStoreList =new ArrayList<MedicalModel>();
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			System.out.println("select * from Medical where MedicalId in (select MedicalId from Availability where MedicineId='"+MedicineId+"' and Available>0)");
			ResultSet rs=st.executeQuery("select * from Medical where MedicalId in (select MedicalId from Availability where MedicineId='"+MedicineId+"' and Available>0)");
			
		 while(rs.next()) {
			 	MedicalModel medicalModel = new MedicalModel();
				medicalModel.setMedicalId(rs.getString("MedicalId"));
				medicalModel.setName(rs.getString("Name"));
				medicalModel.setRegistrationNumber(rs.getString("RegistrationNumber"));
				medicalModel.setOwnername(rs.getString("Ownername"));
				medicalModel.setPhone(rs.getString("Phone"));
				medicalModel.setPassword(rs.getString("Password"));
				medicalModel.setEmail(rs.getString("Email"));
				medicalModel.setOpentime(rs.getString("Opentime"));
				medicalModel.setClosetime(rs.getString("Closetime"));
				medicalModel.setDocuments(rs.getString("Documents"));
				medicalModel.setAddress(rs.getString("Address"));
				medicalModel.setStatus(rs.getString("Status"));
				medicalStoreList.add(medicalModel);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return medicalStoreList;
	}
}

