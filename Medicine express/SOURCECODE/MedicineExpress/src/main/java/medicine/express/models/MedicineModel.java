package medicine.express.models;

public class MedicineModel {
	private String MedicineId;
	private String MedicineName;
	private String Brand;
	private String Power;
	private String PackingType;
	private String PrescriptionType;
	private String Mrp;
	private String Description;
	private String Picture;
	private String Status;
	private String CategoryId;
	private String SubcategoryId;
	private CategoryModel categoryModel;
	private SubcategoryModel subcategoryModel;
	private String available;
	private String price;
	
	public String getMedicineId() {
		return MedicineId;
	}
	public void setMedicineId(String medicineId) {
		MedicineId = medicineId;
	}
	public String getMedicineName() {
		return MedicineName;
	}
	public void setMedicineName(String medicineName) {
		MedicineName = medicineName;
	}
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public String getPower() {
		return Power;
	}
	public void setPower(String power) {
		Power = power;
	}

	public String getPackingType() {
		return PackingType;
	}
	public void setPackingType(String packingType) {
		PackingType = packingType;
	}
	public String getPrescriptionType() {
		return PrescriptionType;
	}
	public void setPrescriptionType(String prescriptionType) {
		PrescriptionType = prescriptionType;
	}
	public String getMrp() {
		return Mrp;
	}
	public void setMrp(String mrp) {
		Mrp = mrp;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getPicture() {
		return Picture;
	}
	public void setPicture(String picture) {
		Picture = picture;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(String categoryId) {
		CategoryId = categoryId;
	}
	public String getSubcategoryId() {
		return SubcategoryId;
	}
	public void setSubcategoryId(String subcategoryId) {
		SubcategoryId = subcategoryId;
	}
	public CategoryModel getCategoryModel() {
		return categoryModel;
	}
	public void setCategoryModel(CategoryModel categoryModel) {
		this.categoryModel = categoryModel;
	}
	public SubcategoryModel getSubcategoryModel() {
		return subcategoryModel;
	}
	public void setSubcategoryModel(SubcategoryModel subcategoryModel) {
		this.subcategoryModel = subcategoryModel;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
}
