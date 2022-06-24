package medicine.express.models;

public class PatientMedicineModel {
	
	private String PatientMedicineId;
	private String PrescriptionId;
	//private PrescriptionModel prescriptionModel;
	private String Quantity;
	private String Price;
	private String MedicalId;
	private MedicalModel medicalModel;
	private String MedicineId;
	private MedicineModel medicineModel;
	public String getPatientMedicineId() {
		return PatientMedicineId;
	}
	public void setPatientMedicineId(String patientMedicineId) {
		PatientMedicineId = patientMedicineId;
	}
	public String getPrescriptionId() {
		return PrescriptionId;
	}
	public void setPrescriptionId(String prescriptionId) {
		PrescriptionId = prescriptionId;
	}
//	public PrescriptionModel getPrescriptionModel() {
//		return prescriptionModel;
//	}
//	public void setPrescriptionModel(PrescriptionModel prescriptionModel) {
//		this.prescriptionModel = prescriptionModel;
//	}
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
	
}
