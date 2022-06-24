package medicine.express.models;

public class SubcategoryModel {
	private String SubcategoryId;
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
	private String SubcategoryName;
	private String CategoryId;
	private CategoryModel categoryModel;
	public String getSubcategoryName() {
		return SubcategoryName;
	}
	public void setSubcategoryName(String subcategoryName) {
		SubcategoryName = subcategoryName;
	}
	public String getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(String categoryId) {
		CategoryId = categoryId;
	}
	
}
