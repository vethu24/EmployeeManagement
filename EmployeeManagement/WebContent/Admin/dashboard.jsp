
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Admin Pannel</title>
<jsp:include page="Adminheader.jsp"></jsp:include>
</head>
<body>
<jsp:include page="Adminbody.jsp"></jsp:include>
<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                        	 <div class="header">
                                <h4 class="title">Email Statistics</h4>
                                <p class="category">Last Campaign Performance</p>
                            </div>
                             <div class="content">
                              <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>
                             
                             	<div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Open
                                        <i class="fa fa-circle text-danger"></i> Bounce
                                        <i class="fa fa-circle text-warning"></i> Unsubscribe
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                    </div>
                                </div>
                             </div>
 	 					</div>
 	 			    </div>
 	 			     <div class="col-md-8">
                        <div class="card">
                        	 <div class="header">
                                <h4 class="title">Employees Behavior</h4>
                                <p class="category">24 Hours performance</p>
                            </div>
                             <div class="content">
                                <div id="chartHours" class="ct-chart"></div>
                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Open
                                        <i class="fa fa-circle text-danger"></i> Click
                                        <i class="fa fa-circle text-warning"></i> Click Second Time
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-history"></i> Updated 3 minutes ago
                                    </div>
                                </div>
                            </div>
                      	</div>
                     </div>
                     
 	 			</div>
 	 	   </div>
 	 	  
 	 	</div> 
<jsp:include page="Adminfooter.jsp"></jsp:include>
</div>
</div>
</body>
 

</html>