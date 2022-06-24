package medicine.express.models;

public class WalletModel {
	
	private String WalletId;
	private String MedicalId;
	private MedicalModel medicalModel;
	private String Medicineorderid;
	private MedicineorderModel medicineorderModel;
	private String Amount;
	private String WalletDate;
	private String Datee;
	private String PatientId;
	private PatientModel patientModel;
	public String getWalletId() {
		return WalletId;
	}
	public void setWalletId(String walletId) {
		WalletId = walletId;
	}
	public String getMedicalId() {
		return MedicalId;
	}
	public void setMedicalId(String medicalId) {
		MedicalId = medicalId;
	}
	public MedicalModel getMedicalModel() {
		return medicalModel;
	}
	public void setMedicalModel(MedicalModel medicalModel) {
		this.medicalModel = medicalModel;
	}
	public String getMedicineorderid() {
		return Medicineorderid;
	}
	public void setMedicineorderid(String medicineorderid) {
		Medicineorderid = medicineorderid;
	}
	public MedicineorderModel getMedicineorderModel() {
		return medicineorderModel;
	}
	public void setMedicineorderModel(MedicineorderModel medicineorderModel) {
		this.medicineorderModel = medicineorderModel;
	}
	public String getAmount() {
		return Amount;
	}
	public void setAmount(String amount) {
		Amount = amount;
	}
	public String getWalletDate() {
		return WalletDate;
	}
	public void setWalletDate(String walletDate) {
		WalletDate = walletDate;
	}
	public String getDatee() {
		return Datee;
	}
	public void setDatee(String datee) {
		Datee = datee;
	}
	public String getPatientId() {
		return PatientId;
	}
	public void setPatientId(String patientId) {
		PatientId = patientId;
	}
	public PatientModel getPatientModel() {
		return patientModel;
	}
	public void setPatientModel(PatientModel patientModel) {
		this.patientModel = patientModel;
	}

}
