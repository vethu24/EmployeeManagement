<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Project</title>
<jsp:include page="Adminheader.jsp"></jsp:include>
<style>

table{
  	 	 margin: auto;
   		 width: 100%;
   		padding: 100px;
   
   
}

td {
   
    text-align: left;
    padding: 8px;
  color:black;
}


</style>
</head>
<body>
<jsp:include page="Adminbody.jsp"></jsp:include>




<%
%>
<form>
	<table>
		<thead>
			<tr style="color:black">
				<th>Project ID</th>
				<th>Project Name</th>
				<th>Project Description</th>
				<th>Start Date</th>
				<th>Due Date</th>
				<th>Employee</th>
				<th>File</th>
				
				
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<jsp:include page="../controller/ProjectManageController.jsp"></jsp:include>
		</tbody>
	</table>
</form>
		                  

</div>
</div>
<jsp:include page="Adminfooter.jsp"></jsp:include>
</body>

</html>