package medicine.express.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import com.mysql.cj.protocol.Resultset;

import emailsending.Email;
import medicine.express.dbcon.DatebaseConnection;
import medicine.express.models.DoctorModel;

public class DoctorDao {

	public String dreg(DoctorModel doctorModel) {

		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();

			int a = st.executeUpdate(
					"insert into Doctor(Name,Email,Phone,Password,Education,RegistrationNumber,Address,Languages,Experience,Abouthim,Photo,Starttime,Endtime,Lunchtime,Speciality) values('"
							+ doctorModel.getName() + "','" + doctorModel.getEmail() + "','" + doctorModel.getPhone()
							+ "','" + doctorModel.getPassword() + "','" + doctorModel.getEducation() + "','"
							+ doctorModel.getRegistrationNumber() + "','" + doctorModel.getAddress() + "','"
							+ doctorModel.getLanguages() + "','" + doctorModel.getExperience() + "','"
							+ doctorModel.getAbouthim() + "','" + doctorModel.getPhoto() + "','"
							+ doctorModel.getStarttime() + "','" + doctorModel.getEndtime() + "','"
							+ doctorModel.getLunchtime() + "','" + doctorModel.getSpeciality() + "')");
			Email.sendEmail("Doctor Registration", "Your Doctor Account Created Successfully.Your Login Credentails Are Phone: "+doctorModel.getPhone()+" Password:"+ doctorModel.getPassword(), "Email.getEmail()");
			
			return "Doctor Details Registred Successfully";

		} catch (Exception e) {
			System.out.println(e);
			
			return "Registration Failed";
		}

	}
	
		public boolean doctorlogin(String phone,String password,HttpServletResponse response,HttpSession session) {
			
			try {
				
				Connection con = DatebaseConnection.getConnection();
				Statement st = con.createStatement();
				
				ResultSet rs=st.executeQuery("select * from Doctor where Phone='"+phone+"' and Password='"+password+"'");
				
				if(rs.next()) {
					
					if(rs.getString("Status").equalsIgnoreCase("Activated")) {
						
						session.setAttribute("DoctorId", rs.getString("DoctorId"));
						session.setAttribute("Name", rs.getString("Name"));
						session.setAttribute("role","doctor");
						
						response.sendRedirect("Doctorhome.jsp");
						
						
					}else {
						response.sendRedirect("MmessageFailed.jsp?Msg=Doctor Profile Not Activated");
					}
					
				}else {
					
					response.sendRedirect("MmessageFailed.jsp?Msg=Invalid Login Details");
				}
				
			}catch (Exception e) {
				System.out.println(e);
				
				return false;
			}
			return false;
		}
	
	public List<DoctorModel> Viewdoctors(){
		
		try {
			
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from Doctor ");
			 
			List<DoctorModel> doctorList=new ArrayList<DoctorModel>();
			while( rs.next()) {
				
				DoctorModel doctorModel=new DoctorModel();
				
				doctorModel.setDoctorId(rs.getString("DoctorId"));
				doctorModel.setName(rs.getNString("Name"));
				doctorModel.setEmail(rs.getString("Email"));
				doctorModel.setPhone(rs.getString("Phone"));
				doctorModel.setPassword(rs.getString("Password"));
				doctorModel.setEducation(rs.getString("Education"));
				doctorModel.setRegistrationNumber(rs.getString("RegistrationNumber"));
				doctorModel.setAddress(rs.getString("Address"));
				doctorModel.setLanguages(rs.getString("Languages"));
				doctorModel.setExperience(rs.getString("Experience"));
				doctorModel.setAbouthim(rs.getString("Abouthim"));
				doctorModel.setPhoto(rs.getString("Photo"));
				doctorModel.setStarttime(rs.getString("Starttime"));
				doctorModel.setEndtime(rs.getString("Endtime"));
				doctorModel.setLunchtime(rs.getString("Lunchtime"));
				doctorModel.setSpeciality(rs.getString("Speciality"));
				doctorModel.setStatus(rs.getString("Status"));
				
				doctorList.add(doctorModel);
				
			}
				return doctorList;
			
		}catch (Exception e) {
			System.out.println(e);
			
			return null;
		}
	
	}
		
	public void Activate (String DoctorId,String Status,HttpServletResponse response) {
		String newstatus=null;
		
		if (Status.equalsIgnoreCase("activated")) {
			newstatus="deactivated";
		}else {
			newstatus="activated";
		}
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			int a = st.executeUpdate("update Doctor set status='"+newstatus+"' where DoctorId='"+DoctorId+"' ");
	
			response.sendRedirect("Viewdoctors.jsp");
	
		} catch (Exception e) {
	
			System.out.println(e);
	
		}
	}
	
	public DoctorModel getDoctorDetails(String DoctorId) {
		DoctorModel doctorModel=new DoctorModel();
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select * from Doctor where DoctorId='"+DoctorId+"'");
			if(rs.next()) {
				doctorModel.setDoctorId(rs.getString("DoctorId"));
				doctorModel.setName(rs.getString("Name"));
				doctorModel.setEmail(rs.getString("Email"));
				doctorModel.setPhone(rs.getString("Phone"));
				doctorModel.setPassword(rs.getString("Password"));
				doctorModel.setEducation(rs.getString("Education"));
				doctorModel.setRegistrationNumber(rs.getString("RegistrationNumber"));
				doctorModel.setAddress(rs.getString("Address"));
				doctorModel.setLanguages(rs.getString("Languages"));
				doctorModel.setExperience(rs.getString("Experience"));
				doctorModel.setAbouthim(rs.getString("Abouthim"));
				doctorModel.setPhoto(rs.getString("Photo"));
				doctorModel.setStarttime(rs.getString("Starttime"));
				doctorModel.setEndtime(rs.getString("Endtime"));
				doctorModel.setLunchtime(rs.getString("Lunchtime"));
				doctorModel.setSpeciality(rs.getString("Speciality"));
				doctorModel.setStatus(rs.getString("Status"));
			}
	
		} catch (Exception e) {
	
			System.out.println(e);
	
		}
		return doctorModel;
	}
	
	public List<DoctorModel> getDoctors(String Speciality, String Name){
		List<DoctorModel> doctorList=new ArrayList<DoctorModel>();
			try {
				Connection con = DatebaseConnection.getConnection();
				Statement st = con.createStatement();
				
				ResultSet rs=st.executeQuery("select * from Doctor where Speciality like '%"+Speciality+"%' and Name like '%"+Name+"%'");
				
				while(rs.next()) {
					DoctorModel doctorModel=new DoctorModel();
					doctorModel.setDoctorId(rs.getString("DoctorId"));
					doctorModel.setName(rs.getString("Name"));
					doctorModel.setEmail(rs.getString("Email"));
					doctorModel.setPhone(rs.getString("Phone"));
					doctorModel.setPassword(rs.getString("Password"));
					doctorModel.setEducation(rs.getString("Education"));
					doctorModel.setRegistrationNumber(rs.getString("RegistrationNumber"));
					doctorModel.setAddress(rs.getString("Address"));
					doctorModel.setLanguages(rs.getString("Languages"));
					doctorModel.setExperience(rs.getString("Experience"));
					doctorModel.setAbouthim(rs.getString("Abouthim"));
					doctorModel.setPhoto(rs.getString("Photo"));
					doctorModel.setStarttime(rs.getString("Starttime"));
					doctorModel.setEndtime(rs.getString("Endtime"));
					doctorModel.setLunchtime(rs.getString("Lunchtime"));
					doctorModel.setSpeciality(rs.getString("Speciality"));
					doctorModel.setStatus(rs.getString("Status"));
					doctorList.add(doctorModel);
				}
				
			}catch(Exception e) {
				System.out.println(e);
				return null;
			}
			return doctorList;
	}
}
