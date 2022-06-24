package medicine.express.models;

public class PrescriptionModel {

	private String PrescriptionId;
	private String DoctorId;
	private DoctorModel doctorModel;
	private String PatientId;
	private PatientModel patientModel;
	private String Status;
	private String Datee;

	public String getPrescriptionId() {
		return PrescriptionId;
	}
	public void setPrescriptionId(String prescriptionId) {
		PrescriptionId = prescriptionId;
	}
	public String getDoctorId() {
		return DoctorId;
	}
	public void setDoctorId(String doctorId) {
		DoctorId = doctorId;
	}
	public DoctorModel getDoctorModel() {
		return doctorModel;
	}
	public void setDoctorModel(DoctorModel doctorModel) {
		this.doctorModel = doctorModel;
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
