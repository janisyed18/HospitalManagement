package medicine.express.models;

public class MedicineorderModel {

	private String Medicineorderid;
	private String PatientId;
	private PatientModel patientModel;
	private String MedicalId;
	private MedicalModel medicalModel;
	private String Status;
	private String Datee;
	public String getMedicineorderid() {
		return Medicineorderid;
	}
	public void setMedicineorderid(String medicineorderid) {
		Medicineorderid = medicineorderid;
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
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getDatee() {
		return Datee;
	}
	public void setDatee(String datee) {
		Datee = datee;
	}
	
}
