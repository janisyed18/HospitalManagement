package medicine.express.models;

public class PatientReportModel {
	private String PatientreportId;
	private String Reporttitle;
	private String Reportvalue;
	private String PatientId;
	private PatientModel patientModel;
	private String DoctorId;
	private DoctorModel doctorModel;
	private String Datee;
	public String getPatientreportId() {
		return PatientreportId;
	}
	public void setPatientreportId(String patientreportId) {
		PatientreportId = patientreportId;
	}
	public String getReporttitle() {
		return Reporttitle;
	}
	public void setReporttitle(String reporttitle) {
		Reporttitle = reporttitle;
	}
	public String getReportvalue() {
		return Reportvalue;
	}
	public void setReportvalue(String reportvalue) {
		Reportvalue = reportvalue;
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
	public String getDatee() {
		return Datee;
	}
	public void setDatee(String datee) {
		Datee = datee;
	}

}
