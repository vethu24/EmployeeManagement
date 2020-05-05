<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="DB.Dbconnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con =Dbconnect.getConnection();
					String mail = (String) session.getAttribute("username");
					String uname;
					PreparedStatement ps = con.prepareStatement("select * from admin where username=?");

					ps.setString(1, mail);
					ResultSet rs = ps.executeQuery();

					if (null == mail) {
						response.sendRedirect("AdminLogin.jsp");
					}

					if (rs.next()) {
						uname = rs.getString("username");
						//out.print("<b><span style='color:white;'>&nbsp;&nbsp;Hi&nbsp;  " + uname + "</span></b>");
					} else {
						uname = "";

						//out.print("<b><span style='color:white;'>&nbsp;&nbsp;" + uname + "</span></b>");
					}
				%>
 
 <div class="wrapper">
 	<div class="sidebar" data-color="red">
 		<div class="sidebar-wrapper">
 			<div class="logo">
                <a href="#" class="simple-text pe-7s-home ">
				<b>	Admin Pannel</b>
                </a>
            </div>
             <ul class="nav">
                <li class="active">
                    <a href="dashboard.jsp">
                        <i class="pe-7s-graph"></i>
                         Dashboard
                      
                    </a>
                </li>
               
                <li>
                    <a href="AddEmployee.jsp">
                        <i class="pe-7s-add-user"></i>
                        Add Employee
                    </a>
                </li>
              
            
                <li>
                    <a href="ManageEmployee.jsp">
                        <i class="pe-7s-tools"></i>
                        Manage Employee
                    </a>
                </li>
                <li>
                    <a href="AddSalary.jsp">
                        <i class="pe-7s-cash"></i>
                        Salary Calculation
                    </a>
                </li>
				<li>
                    <a href="ManageSalary.jsp">
                        <i class="pe-7s-cash"></i>
                        Salary Details
                    </a>
                </li>
                <li>
                    <a href="ManageLeaveEmployee.jsp">
                        <i class="pe-7s-bell"></i>
                        Leave Notification
                    </a>
                </li>
                 <li>
                    <a href="Addproject.jsp">
                        <i class="pe-7s-plus"></i>
                        Add new Project
                    </a>
                </li>
                  <li>
                    <a href="ManageProject.jsp">
                        <i class="pe-7s-file"></i>
                        Manage Project
                    </a>
                </li>
            </ul>
            
 		</div>
 	</div>
 	 <div class="main-panel">
 	 	 <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"></a>
                </div>
                <div class="collapse navbar-collapse">
                  <ul class="nav navbar-nav navbar-right">
                        <li> <a >Welcome <%=uname %></a></li>
                         <li><a href="../view/AdminProfile.jsp">Profile</a> </li>
                        <li><a href="../controller/logoutcontroller.jsp">Log Out</a></li>
				  </ul>
                </div>
            </div>
        </nav>
       
 	 	<script type="text/javascript">
    	$(document).ready(function(){

        	demo.initChartist();

        	$.notify({
            	icon: 'pe-7s-gift',
            	message: "Welcome"

            },{
                type: 'info',
                timer: 4000
            });

    	});
	</script>

</body>
</html>