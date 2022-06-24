package medicine.express.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import medicine.express.dbcon.DatebaseConnection;
import medicine.express.models.CategoryModel;
import medicine.express.models.MedicalModel;
import medicine.express.models.MedicineModel;
import medicine.express.models.SubcategoryModel;

public class MedicineDao {
	public String addMedicine(MedicineModel medicineModel) {

		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			int a = st.executeUpdate(
					"insert into Medicine(MedicineName,Brand,Power,PackingType,PrescriptionType,Mrp,Description,Picture,CategoryId,SubcategoryId) values('"
							+ medicineModel.getMedicineName() + "','" + medicineModel.getBrand() + "','"
							+ medicineModel.getPower() + "','" + medicineModel.getPackingType() + "','"
							+ medicineModel.getPrescriptionType() + "','" + medicineModel.getMrp() + "','"
							+ medicineModel.getDescription() + "','" + medicineModel.getPicture() + "','"
							+ medicineModel.getCategoryId() + "','" + medicineModel.getSubcategoryId() + "')");

			return "Medicine Added Successfully";

		} catch (Exception e) {
			System.out.println(e);

			return "Fails to add Medicine";
		}
	}

	public List<MedicineModel> getMedicines() {

		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Medicine");
			List<MedicineModel> medicineList = new ArrayList<MedicineModel>();

			while (rs.next()) {

				MedicineModel medicineModel = new MedicineModel();
				medicineModel.setMedicineId(rs.getString("MedicineId"));
				medicineModel.setMedicineName(rs.getString("MedicineName"));
				medicineModel.setBrand(rs.getString("Brand"));
				medicineModel.setPower(rs.getString("Power"));
				medicineModel.setPackingType(rs.getString("PackingType"));
				medicineModel.setPrescriptionType(rs.getString("PrescriptionType"));
				medicineModel.setMrp(rs.getString("Mrp"));
				medicineModel.setDescription(rs.getString("Description"));
				medicineModel.setPicture(rs.getString("Picture"));
				medicineModel.setStatus(rs.getString("Status"));
				medicineModel.setCategoryId(rs.getString("CategoryId"));
				medicineModel.setSubcategoryId(rs.getString("SubcategoryId"));
				Statement st2 = con.createStatement();
				ResultSet rs2 = st2.executeQuery(
						"select * from Category where CategoryId='" + medicineModel.getCategoryId() + "' ");
				if (rs2.next()) {
					CategoryModel categoryModel = new CategoryModel();
					categoryModel.setCategoryId(rs2.getString("CategoryId"));
					categoryModel.setCategoryName(rs2.getString("CategoryName"));
					medicineModel.setCategoryModel(categoryModel);
				}
				Statement st3 = con.createStatement();
				ResultSet rs3 = st3.executeQuery(
						"select * from Subcategory where SubcategoryId='" + medicineModel.getSubcategoryId() + "'");
				while (rs3.next()) {
					SubcategoryModel subcategoryModel = new SubcategoryModel();
					subcategoryModel.setCategoryId(rs3.getString("CategoryId"));
					subcategoryModel.setSubcategoryId(rs3.getString("SubcategoryId"));
					subcategoryModel.setSubcategoryName(rs3.getString("SubcategoryName"));
					medicineModel.setSubcategoryModel(subcategoryModel);
				}
				medicineList.add(medicineModel);

			}
			return medicineList;

		} catch (Exception e) {
			System.out.println(e);

			return null;
		}
	}

	public void Disable(String MedicineId, String Status, HttpServletResponse response) {
		String newstatus = null;

		if (Status.equalsIgnoreCase("published")) {
			newstatus = "Disable";
		} else {
			newstatus = "published";
		}
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			int a = st.executeUpdate(
					"update Medicine set status='" + newstatus + "' where MedicineId='" + MedicineId + "' ");

			response.sendRedirect("Viewmedicine.jsp");

		} catch (Exception e) {

			System.out.println(e);

		}
	}

	public List<MedicineModel> getMedicines(String CategoryId, String SubcategoryId, String MedicineName,String role,String MedicalId,String type) {

		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = null;
			if (SubcategoryId.equalsIgnoreCase("all")) {
					
				if (CategoryId.equalsIgnoreCase("all")) {

					if (MedicineName.equalsIgnoreCase("all")) {
						
						rs=st.executeQuery("Select * from Medicine ");

					} else {
						rs=st.executeQuery("Select * from Medicine where MedicineName like '%"+MedicineName+"%' ");
					}
				} else {
					if (MedicineName.equalsIgnoreCase("all")) {
						
						rs=st.executeQuery("Select * from Medicine where CategoryId='"+CategoryId+"' ");
					} else {
						rs=st.executeQuery("Select * from Medicine where CategoryId='"+CategoryId+"' and MedicineName like '%"+MedicineName+"%' ");
					}

				}

			} else {
				if (MedicineName.equalsIgnoreCase("all")) {
					System.out.println("Select * from Medicine where SubcategoryId='"+SubcategoryId+"' ");
					rs=st.executeQuery("Select * from Medicine where SubcategoryId='"+SubcategoryId+"' ");
				} else {
					rs=st.executeQuery("Select * from Medicine where SubcategoryId='"+SubcategoryId+"' and MedicineName like '%"+MedicineName+"%' ");
				}

			}
			List<MedicineModel> medicineList=new ArrayList<MedicineModel>();
			
			while(rs.next()) {
				
				MedicineModel medicineModel=new MedicineModel();
				
				medicineModel.setMedicineId(rs.getString("MedicineId"));
				medicineModel.setMedicineName(rs.getString("MedicineName"));
				medicineModel.setBrand(rs.getString("Brand"));
				medicineModel.setPower(rs.getString("Power"));
				medicineModel.setPackingType(rs.getString("PackingType"));
				medicineModel.setPrescriptionType(rs.getString("PrescriptionType"));
				medicineModel.setMrp(rs.getString("Mrp"));
				medicineModel.setDescription(rs.getString("Description"));
				medicineModel.setPicture(rs.getString("Picture"));
				medicineModel.setStatus(rs.getString("Status"));
				medicineModel.setCategoryId(rs.getString("CategoryId"));
				medicineModel.setSubcategoryId(rs.getString("SubcategoryId"));
				
				Statement st2 = con.createStatement();
				ResultSet rs2 = st2.executeQuery(
						"select * from Category where CategoryId='" + medicineModel.getCategoryId() + "' ");
				if (rs2.next()) {
					CategoryModel categoryModel = new CategoryModel();
					categoryModel.setCategoryId(rs2.getString("CategoryId"));
					categoryModel.setCategoryName(rs2.getString("CategoryName"));
					medicineModel.setCategoryModel(categoryModel);
				}
				Statement st3 = con.createStatement();
				ResultSet rs3 = st3.executeQuery(
						"select * from Subcategory where SubcategoryId='" + medicineModel.getSubcategoryId() + "'");
				while (rs3.next()) {
					SubcategoryModel subcategoryModel = new SubcategoryModel();
					subcategoryModel.setCategoryId(rs3.getString("CategoryId"));
					subcategoryModel.setSubcategoryId(rs3.getString("SubcategoryId"));
					subcategoryModel.setSubcategoryName(rs3.getString("SubcategoryName"));
					medicineModel.setSubcategoryModel(subcategoryModel);
				}
				
				if(role.equalsIgnoreCase("admin")) {
					medicineList.add(medicineModel);
				}else if(!role.equalsIgnoreCase("admin") && medicineModel.getStatus().equalsIgnoreCase("published")){
					if(role.equalsIgnoreCase("MedicalStore")) {
						Statement st4 = con.createStatement();
						ResultSet rs4=st4.executeQuery("select * from Availability where MedicineId='"+medicineModel.getMedicineId()+"' and MedicalId='"+MedicalId+"'");
						if(rs4.next()) {
							medicineModel.setAvailable(rs4.getString("Available"));
							medicineModel.setPrice(rs4.getString("price"));
							medicineList.add(medicineModel);
						} else {
							medicineModel.setAvailable("0");
							medicineModel.setPrice("0");
							if(type.equalsIgnoreCase("all")) {
								medicineList.add(medicineModel);
							}
						}
					} else if(role.equalsIgnoreCase("doctor")) {
						medicineList.add(medicineModel);
					}
					
					}
				}
			return medicineList;

		} catch (Exception e) {
			System.out.println(e);

		}
		return null;
	}
	
	public MedicineModel getMedicineDetails(String MedicineId) {
		MedicineModel medicineModel=new MedicineModel();
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			System.out.println("select * from Medicine where MedicineId='"+MedicineId+"'");
			ResultSet rs=st.executeQuery("select * from Medicine where MedicineId='"+MedicineId+"'");
			if(rs.next()) {
				medicineModel.setMedicineId(rs.getString("MedicineId"));
				medicineModel.setMedicineName(rs.getString("MedicineName"));
				medicineModel.setBrand(rs.getString("Brand"));
				medicineModel.setPower(rs.getString("Power"));
				medicineModel.setPackingType(rs.getString("PackingType"));
				medicineModel.setPrescriptionType(rs.getString("PrescriptionType"));
				medicineModel.setMrp(rs.getString("Mrp"));
				medicineModel.setDescription(rs.getString("Description"));
				medicineModel.setPicture(rs.getString("Picture"));
				medicineModel.setStatus(rs.getString("Status"));
			}
		}catch(Exception e) {
			
		}
		return medicineModel;
	}

}
