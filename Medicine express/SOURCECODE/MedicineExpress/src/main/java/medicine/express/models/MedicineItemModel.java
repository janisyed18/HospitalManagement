package medicine.express.models;

public class MedicineItemModel {
	
	private String MedicineItemId;
	private String Medicineorderid;
	private MedicineorderModel medicineorderModel;
	private String PatientId;
	private PatientModel patientModel;
	private String MedicalId;
	private MedicalModel medicalModel;
	private String MedicineId;
	private MedicineModel medicineModel;
	private String PatientMedicineId;
	private PatientMedicineModel patientMedicineModel;
	private String Quantity;
	private String Price;
	private String Status;
	public String getMedicineItemId() {
		return MedicineItemId;
	}
	public void setMedicineItemId(String medicineItemId) {
		MedicineItemId = medicineItemId;
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
	public String getMedicineId() {
		return MedicineId;
	}
	public void setMedicineId(String medicineId) {
		MedicineId = medicineId;
	}
	public MedicineModel getMedicineModel() {
		return medicineModel;
	}
	public void setMedicineModel(MedicineModel medicineModel) {
		this.medicineModel = medicineModel;
	}
	public String getPatientMedicineId() {
		return PatientMedicineId;
	}
	public void setPatientMedicineId(String patientMedicineId) {
		PatientMedicineId = patientMedicineId;
	}
	public PatientMedicineModel getPatientMedicineModel() {
		return patientMedicineModel;
	}
	public void setPatientMedicineModel(PatientMedicineModel patientMedicineModel) {
		this.patientMedicineModel = patientMedicineModel;
	}
	public String getQuantity() {
		return Quantity;
	}
	public void setQuantity(String quantity) {
		Quantity = quantity;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
}
