package medicine.express.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import emailsending.Email;
import medicine.express.dbcon.DatebaseConnection;
import medicine.express.models.PatientModel;

public class PatientDao {

	public String preg(PatientModel patientModel) {

		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();

			int a = st.executeUpdate("insert into Patient(Name,Email,Phone,Password,Age,Gender) values('"
					+ patientModel.getName() + "','" + patientModel.getEmail() + "','" + patientModel.getPhone() + "','"
					+ patientModel.getPassword() + "','" + patientModel.getAge() + "','" + patientModel.getGender()
					+ "')");		
			
		Email.sendEmail("Patient Registration", "Your Patient Account Created Successfully.Your Login Credentails Are Phone: "+patientModel.getPhone()+" Password:"+patientModel.getPassword(), "Email.getEmail()");
	
			return "Patient Registred Successfully";
			
		} catch (Exception e) {
			System.out.println(e);
			
			return "Registration Failed";
		}
	}
	
	public boolean patientlogin(String phone,String password,HttpServletResponse response,HttpSession session) {
		
		try {
			
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from Patient where Phone='"+phone+"' and Password='"+password+"'");
		   
			if(rs.next()){
				
				session.setAttribute("PatientId", rs.getString("PatientId"));
				session.setAttribute("Name", rs.getString("Name"));
				session.setAttribute("role","Patient");
				
				response.sendRedirect("Patienthome.jsp");
			}else {
				
				response.sendRedirect("MmessageFailed.jsp?Msg=Invalid Login Details");
			}
			
		}catch(Exception e) {
			
			System.out.println(e);
			
			return false;
		}
			
	return false;
	}
	
	public PatientModel searchPatient(String PatientId) {
		
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st2 = con.createStatement();
			
			ResultSet rs2=st2.executeQuery("select * from Patient Where PatientId='"+PatientId+"'");
			
				PatientModel patientModel=new PatientModel();
			if(rs2.next()) {
				
				patientModel.setPatientId(rs2.getString("PatientId"));
				patientModel.setName(rs2.getString("Name"));
				patientModel.setEmail(rs2.getString("Email"));
				patientModel.setPhone(rs2.getString("Phone"));
				patientModel.setPassword(rs2.getString("Password"));
				patientModel.setAge(rs2.getString("Age"));
				patientModel.setGender(rs2.getString("Gender"));
				
			}
			return patientModel;
				
		}catch(Exception e) {
			System.out.println(e);
			
			return null;
		}
	}
}
