<%@page import="medicine.express.dao.CategoryDao"%>
<%@page import="medicine.express.models.CategoryModel"%>
<%
	String CategoryName=request.getParameter("CategoryName");


	CategoryModel categoryModel=new CategoryModel();
	categoryModel.setCategoryName(CategoryName);
	CategoryDao categoryDao=new CategoryDao();
	
	String Status=categoryDao.addCategory(categoryModel);
	
	 if(Status.equalsIgnoreCase("Category Added Successfully")){
			response.sendRedirect("MmessageSuccess.jsp?Msg="+Status);
			
		}else{
			response.sendRedirect("MmessageFailed.jsp?Msg="+Status);
		}
	
%>