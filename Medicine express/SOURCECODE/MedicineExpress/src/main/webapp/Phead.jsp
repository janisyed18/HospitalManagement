<%@ include file="links.jsp" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="index.jsp">Patient Home</a>
  
  <!-- Links -->
  <ul class="navbar-nav">
<!--       <li class="nav-item"><a class="nav-link" href="Viewdoctors.jsp">View Doctors</a></li> -->
      <li class="nav-item"><a class="nav-link" href="ViewDoctors2.jsp">Search by Speciality</a></li> 
      <li class="nav-item"><a class="nav-link" href="ViewPrescription.jsp">View Prescription</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewOrders.jsp?viewType=Cart">View Cart</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewOrders.jsp?viewType=Accepted">Accepted Orders</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewOrders.jsp?viewType=Rejected">Rejected Orders</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewOrders.jsp?viewType=Delivered">Delivered Orders</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewReports1.jsp?viewType=Ordered">View Reports</a></li>
      <li class="nav-item"><a class="nav-link" href="Logout.jsp">Logout</a></li>
  </ul>
</nav>