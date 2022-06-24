<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="medicine.express.models.SubcategoryModel"%>
<%@page import="medicine.express.dao.SubcategoryDao"%>
<option value="">Choose Sub Category</option>
<%
	String CategoryId = request.getParameter("CategoryId");
	System.out.print(CategoryId);
	SubcategoryDao subcategoryDao = new SubcategoryDao();
	List<SubcategoryModel> subCategoryList= subcategoryDao.getSubCategoryById(CategoryId);
	Iterator<SubcategoryModel> subCategoryIterator = subCategoryList.iterator();
	while(subCategoryIterator.hasNext()){
		SubcategoryModel subcategoryModel = subCategoryIterator.next();%>
		
		<option value="<%=subcategoryModel.getSubcategoryId()%>"><%=subcategoryModel.getSubcategoryName()%></option>	
	<%}
%>
