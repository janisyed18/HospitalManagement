package medicine.express.models;

public class AvailabilityModel {
	
	private String AvailabilityId;
	private String MedicineId;
	private MedicineModel medicineModel;
	private String MedicalId;
	private MedicalModel medicalModel;
	private String price;
	private String Available;
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
	public String getAvailabilityId() {
		return AvailabilityId;
	}
	public void setAvailabilityId(String availabilityId) {
		AvailabilityId = availabilityId;
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
	
	public String getAvailable() {
		return Available;
	}
	public void setAvailable(String available) {
		Available = available;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
