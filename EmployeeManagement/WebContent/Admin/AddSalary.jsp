<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.empdata"%>
<%@page import="DataAccess.empdata"%>
<%@page import="model.EmployeeModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Salary Add</title>
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
 <form action="../AddSalaryServlet" method="POST"  >
								<table >
									<tbody>
									 
									<tr>
										<td>Username</td>
										<td><select class="form-control" name="username"  >
												<option value="0"> select</option>
												<%
													try{
														Connection con=Dbconnect.getConnection();
													     Statement ps=con.createStatement();
													     ResultSet rs=ps.executeQuery("select NIC,department,username from employee");
													     while(rs.next()){
													    	 %>
													    	 	<option value="<%=rs.getString("username")%>"><%=rs.getString("username") %></option>
													    	 <%
													     }
														con.close();
														rs.close();
													}catch(Exception e){
														e.printStackTrace();
													}
												%>
											</select></td>
									</tr>
									
									<tr>
										<td  >Basic Salary</td>
									
												<td><input type="text" 
												   name="bsalary" id="bsalary" autocomplete="off" pattern="[0-9]+" 
												    oninvalid="this.setCustomValidity('Check ')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required /><br>
											</td>
									</tr>
									<tr>
									<td  >Over Time</td>
									
												<td><input type="text" 
												   name="othour" autocomplete="off" pattern="[0-9]+" 
												    oninvalid="this.setCustomValidity('Check ')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required /><br>
											</td>
									</tr>
									
									<tr>
										<td  >Date</td>
										<td><input type="text" name="sdate" data-date-format='yyyy-mm-dd' autocomplete="off"   id="select_date" /></td>
									</tr>
									<tr>
										<td > </td>
										<td><input type="submit" value="Add Salary"  name="Submit" > </td>
									</tr>
									
									</tbody>
								</table>
								</form>
   

</body>
<script src="../font/script/jquery-1.12.4.js"></script>
<script src="../font/script/jquery-ui.js"></script>

<script type="text/javascript">

	 $(function(){
	        $("#select_date").datepicker({ dateFormat: 'yy-mm-dd',
				todayHighlight:true,
				showOtherMonths:true,
				
				selectOtherMonth:true,
				autoclose:true,
				changeMonth:true,
				changeYear:true,
				 });
	      
	    });


	 $(function(){
	        $("#select").datepicker({ dateFormat: 'yy-mm-dd',
				todayHighlight:true,
				showOtherMonths:true,
				
				selectOtherMonth:true,
				autoclose:true,
				changeMonth:true,
				changeYear:true,
				 });
	      
	    });
</script>
</html>