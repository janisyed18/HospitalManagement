
<%
	String phone=request.getParameter("phone");
	String password=request.getParameter("password");
	
	if(phone.equalsIgnoreCase("9876543210") && password.equalsIgnoreCase("1234") ){
		
			session.setAttribute(phone, phone);
			session.setAttribute("role", "admin");
			
			response.sendRedirect("Adminhome.jsp");
		
	}else{
			response.sendRedirect("MmessageFailed.jsp?Msg=Invalid Login Details");
	}
%>>