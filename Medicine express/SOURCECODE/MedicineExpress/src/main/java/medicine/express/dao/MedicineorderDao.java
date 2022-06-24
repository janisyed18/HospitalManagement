package medicine.express.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import medicine.express.dbcon.DatebaseConnection;
import medicine.express.models.MedicineItemModel;
import medicine.express.models.MedicineorderModel;
import medicine.express.models.WalletModel;

public class MedicineorderDao {

	public void addItemToCart(String PatientMedicineId, String MedicineId, String MedicalId, String PatientId,
			HttpServletResponse response) {
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from  Availability where MedicineId='" + MedicineId
					+ "'and MedicalId='" + MedicalId + "'");
			if (rs.next()) {
				Statement st2 = con.createStatement();
				System.out
						.println("select * from  PatientMedicine where PatientMedicineId='" + PatientMedicineId + "'");
				ResultSet rs2 = st2.executeQuery(
						"select * from  PatientMedicine where PatientMedicineId='" + PatientMedicineId + "'");
				if (rs2.next()) {
					Statement st3 = con.createStatement();
					ResultSet rs3 = st3.executeQuery("select * from  Medicineorder where PatientId='" + PatientId
							+ "' and MedicalId='" + MedicalId + "' and status = 'Cart'");
					String Medicineorderid = null;
					if (rs3.next()) {
						Medicineorderid = rs3.getString("Medicineorderid");
					} else {
						Statement st4 = con.createStatement();
						st4.executeUpdate("insert into Medicineorder(PatientId,MedicalId) values('" + PatientId + "','"
								+ MedicalId + "')", Statement.RETURN_GENERATED_KEYS);
						ResultSet rs4 = st4.getGeneratedKeys();
						if (rs4.next()) {
							Medicineorderid = rs4.getString(1);
							Statement st5 = con.createStatement();
							st5.executeUpdate("delete from MedicineItem where PatientId='" + PatientId
									+ "' and PatientMedicineId='" + PatientMedicineId + "' and Status='New'");
						}
					}
					Statement st5 = con.createStatement();
					ResultSet rs5 = st5.executeQuery("select * from  MedicineItem where Medicineorderid='"
							+ Medicineorderid + "' and MedicineId='" + MedicineId + "'");
					if (rs5.next()) {
						Statement st6 = con.createStatement();
						st6.executeUpdate("update MedicineItem set MedicalId='" + MedicalId + "',PatientMedicineId='"
								+ PatientMedicineId + "', Quantity='" + rs2.getString("Quantity") + "',Price='"
								+ rs.getString("Price") + "' where MedicineItemId='" + rs5.getString("MedicineItemId")
								+ "'");
					} else {
						Statement st6 = con.createStatement();
						st6.executeUpdate(
								"insert into MedicineItem(Medicineorderid,PatientId,MedicalId,MedicineId,PatientMedicineId,Quantity,Price) values('"
										+ Medicineorderid + "','" + PatientId + "','" + MedicalId + "','" + MedicineId
										+ "','" + PatientMedicineId + "','" + rs2.getString("Quantity") + "','"
										+ rs.getString("Price") + "')");
					}
					Statement st6 = con.createStatement();
					st6.executeUpdate("update PatientMedicine set MedicalId='" + MedicalId + "', Price='"
							+ rs.getString("Price") + "' where PatientMedicineId='" + PatientMedicineId + "'");
					response.sendRedirect("ViewPrescription.jsp");
				}
			} else {
				response.sendRedirect(
						"MmessageFailed.jsp?msg=This Medicine is not Available in Any Store&color=text-danger");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public List<MedicineorderModel> getMedicineorder(String PatientId, String MedicalId, String role, String viewType) {
		List<MedicineorderModel> medicineorderlist = new ArrayList<MedicineorderModel>();
		try {
			String query = "select * from Medicineorder where Status='" + viewType + "'";
			if (role.equalsIgnoreCase("Patient")) {
				query = query + " and PatientId='" + PatientId + "'";
			} else {
				query = query + " and MedicalId='" + MedicalId + "'";
			}

			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				MedicineorderModel medicineorderModel = new MedicineorderModel();
				medicineorderModel.setMedicineorderid(rs.getString("Medicineorderid"));
				medicineorderModel.setPatientId(rs.getString("PatientId"));
				medicineorderModel.setMedicalId(rs.getString("MedicalId"));
				medicineorderModel.setStatus(rs.getString("Status"));
				medicineorderModel.setDatee(rs.getString("Datee"));
				PatientDao patientDao = new PatientDao();
				medicineorderModel.setPatientModel(patientDao.searchPatient(medicineorderModel.getPatientId()));
				MedicalDao medicalDao = new MedicalDao();
				medicineorderModel.setMedicalModel(medicalDao.getMdicalDetails(medicineorderModel.getMedicalId()));
				medicineorderlist.add(medicineorderModel);
			}

			return medicineorderlist;
		} catch (Exception e) {
			System.out.println(e);

		}
		return medicineorderlist;
	}

	public List<MedicineItemModel> getMedicineItem(String Medicineorderid) {
		List<MedicineItemModel> medicineItemList = new ArrayList<MedicineItemModel>();
		try {
			String query = "select * from MedicineItem where Medicineorderid='" + Medicineorderid + "'";
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				MedicineItemModel medicineItemModel = new MedicineItemModel();
				medicineItemModel.setMedicineItemId(rs.getString("MedicineItemId"));
				medicineItemModel.setMedicineorderid(rs.getString("Medicineorderid"));
				medicineItemModel.setPatientId(rs.getString("PatientId"));
				medicineItemModel.setMedicalId(rs.getString("MedicalId"));
				medicineItemModel.setMedicineId(rs.getString("MedicineId"));
				medicineItemModel.setQuantity(rs.getString("Quantity"));
				medicineItemModel.setPrice(rs.getString("Price"));

				PatientDao patientDao = new PatientDao();
				medicineItemModel.setPatientModel(patientDao.searchPatient(medicineItemModel.getPatientId()));

				MedicalDao medicalDao = new MedicalDao();

				medicineItemModel.setMedicalModel(medicalDao.getMdicalDetails(medicineItemModel.getMedicalId()));
				MedicineDao medicineDao = new MedicineDao();
				medicineItemModel.setMedicineModel(medicineDao.getMedicineDetails(medicineItemModel.getMedicineId()));
				medicineItemList.add(medicineItemModel);

			}
			return medicineItemList;
		} catch (Exception e) {
			System.out.println(e);

		}
		return medicineItemList;
	}

	public void orderNow(String Medicineorderid, HttpServletResponse response) {
		try {
			String query = "update Medicineorder set Status='Ordered' where Medicineorderid='" + Medicineorderid + "'";
			String query2 = "update MedicineItem set Status='Ordered' where Medicineorderid='" + Medicineorderid + "'";
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate(query);
			st.executeUpdate(query2);
			response.sendRedirect("ViewOrders.jsp?viewType=Ordered");
		} catch (Exception e) {
			System.out.println(e);

		}
	}

	public void setOrder(String Medicineorderid, String Status, HttpServletResponse response) {
		try {
			String query = "update Medicineorder set Status='" + Status + "' where Medicineorderid='" + Medicineorderid
					+ "'";
			String query2 = "update MedicineItem set Status='" + Status + "' where Medicineorderid='" + Medicineorderid
					+ "'";
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate(query);
			st.executeUpdate(query2);
			response.sendRedirect("ViewOrders.jsp?viewType=" + Status);
		} catch (Exception e) {
			System.out.println(e);

		}
	}

	public void setWalletModel(WalletModel walletModel) {

		try {

			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("insert into Wallet(MedicalId,Medicineorderid,Amount,WalletDate,PatientId) values('"
					+ walletModel.getMedicalId() + "','" + walletModel.getMedicineorderid() + "','"
					+ walletModel.getAmount() + "',curdate(),'"+walletModel.getPatientId()+"')");
		} catch (Exception e) {
			System.out.println(e);

		}
	}
	
	public Map<String, List<WalletModel>> getWalletModels(String MedicalId) {
		Map<String, List<WalletModel>>  walletMap =new HashMap<String, List<WalletModel>>();
		try {
			Connection con = DatebaseConnection.getConnection();
			Statement st = con.createStatement();
			System.out.println("select distinct(WalletDate) from Wallet where MedicalId='"+MedicalId+"'");
			ResultSet rs= st.executeQuery("select distinct(WalletDate) from Wallet where MedicalId='"+MedicalId+"'");
			while(rs.next()) {
				List<WalletModel> walletModelList = new ArrayList<WalletModel>();
				Statement st2 = con.createStatement();
				ResultSet rs2= st2.executeQuery("select * from Wallet where WalletDate='"+rs.getString(1)+"'");
				while(rs2.next()) {
					WalletModel walletModel =new WalletModel();
					walletModel.setWalletId(rs2.getString("WalletId"));
					walletModel.setMedicalId(rs2.getString("MedicalId"));
					walletModel.setMedicineorderid(rs2.getString("Medicineorderid"));
					walletModel.setAmount(rs2.getString("Amount"));
					walletModel.setWalletDate(rs2.getString("WalletDate"));
					walletModel.setDatee(rs2.getString("Datee"));
					walletModel.setPatientId(rs2.getString("PatientId"));
					PatientDao patientDao=new PatientDao();
					walletModel.setPatientModel(patientDao.searchPatient(walletModel.getPatientId()));
					walletModelList.add(walletModel);
				}
				walletMap.put(rs.getString(1), walletModelList);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return walletMap;
	}
	
}
