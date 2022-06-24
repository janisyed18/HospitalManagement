-<%@ include file="links.jsp" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="index.jsp">Medical Store Home</a>
  
  <!-- Links -->
  <ul class="navbar-nav">
      <li class="nav-item"><a class="nav-link" href="StoreMedicine.jsp?type=all">View All Medicines</a></li>
      <li class="nav-item"><a class="nav-link" href="StoreMedicine.jsp?type=store">Medicines in Store</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewOrders.jsp?viewType=Ordered">View Orders</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewOrders.jsp?viewType=Accepted">Accepted Orders</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewOrders.jsp?viewType=Rejected">Rejected Orders</a></li>
      <li class="nav-item"><a class="nav-link" href="ViewOrders.jsp?viewType=Delivered">Delivered Orders</a></li>
      <li class="nav-item"><a class="nav-link" href="income.jsp">Income Per Day</a></li>
      <li class="nav-item"><a class="nav-link" href="Viewbargraph.jsp">View Bar graph</a></li>
      <li class="nav-item"><a class="nav-link" href="Logout.jsp">Logout</a></li>
  </ul>
</nav>