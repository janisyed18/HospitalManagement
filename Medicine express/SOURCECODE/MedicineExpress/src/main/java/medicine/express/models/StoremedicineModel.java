package medicine.express.models;

public class StoremedicineModel {
	
	private String StoreMedicineId;
	private String MedicineId;
	private MedicalModel medicalModel;
	private String Quantity;
	private String price;
	public String getStoreMedicineId() {
		return StoreMedicineId;
	}
	public void setStoreMedicineId(String storeMedicineId) {
		StoreMedicineId = storeMedicineId;
	}
	public String getMedicineId() {
		return MedicineId;
	}
	public void setMedicineId(String medicineId) {
		MedicineId = medicineId;
	}
	public MedicalModel getMedicalModel() {
		return medicalModel;
	}
	public void setMedicalModel(MedicalModel medicalModel) {
		this.medicalModel = medicalModel;
	}
	public String getQuantity() {
		return Quantity;
	}
	public void setQuantity(String quantity) {
		Quantity = quantity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

}
