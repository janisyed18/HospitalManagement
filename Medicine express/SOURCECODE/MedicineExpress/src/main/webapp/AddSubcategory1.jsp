<%@page import="medicine.express.models.SubcategoryModel"%>
<%@page import="medicine.express.dao.SubcategoryDao"%>
<%@page import="medicine.express.models.CategoryModel"%>
<%
		String SubcategoryName=request.getParameter("SubcategoryName");
		String CategoryId=request.getParameter("CategoryId");
		
		SubcategoryModel subcategoryModel=new SubcategoryModel();
		subcategoryModel.setCategoryId(CategoryId);
		subcategoryModel.setSubcategoryName(SubcategoryName);
		SubcategoryDao subcategoryDao=new SubcategoryDao();	
		String Status = subcategoryDao.addSubcategory(subcategoryModel);
		 if(Status.equalsIgnoreCase("Sub Category Added Successfully")){
			response.sendRedirect("MmessageSuccess.jsp?Msg="+Status);		
		}else{
				response.sendRedirect("MmessageFailed.jsp?Msg="+Status);
		}
%>