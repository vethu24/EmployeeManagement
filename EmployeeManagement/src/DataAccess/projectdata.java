package DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DB.Dbconnect;
import model.project;

public class projectdata {
	
	

//--------------------------------------------------------UPDATE QUERY------------------------------------------------------

	public static int salaryUpdate(project s) {
		int result=0;
		 try {
			 	Connection connection=Dbconnect.getConnection();
			 	
	           
	            PreparedStatement ps =connection.prepareStatement("update  project set pname=?,pdescription=?,date=?,duedate=?,empname=?,path=? where pid=?");
	           
	            ps.setString(1,s.getPname());
	            ps.setString(2,s.getPdescription());
	            
	            ps.setString(3,s.getDate());
	            ps.setString(4,s.getDuedate());
	            ps.setString(5,s.getEmpname());
	            ps.setBlob(6, s.getPath());
	            ps.setString(7,s.getPid());
	            
	            
	            result = ps.executeUpdate();
	            ps.close();
	            connection.close();
	            
	           }catch (Exception ex) {

	              ex.printStackTrace();

	        }
		 return result;
	}
	

//--------------------------------------------------------GET ID QUERY------------------------------------------------------


public static project getProjectById(String id){

	project e = new project();

try{
	Connection connection=Dbconnect.getConnection();
	 PreparedStatement ps =connection.prepareStatement("select * from project where pid=?");
    ps.setString(1,id);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		
		e.setPid(rs.getString(1));
       
        
        e.setPname(rs.getString(2));
        e.setPdescription(rs.getString(3));
        
       e.setDate(rs.getString(4));
       e.setDuedate(rs.getString(5));
       e.setEmpname(rs.getString(6));
       e.setPath(rs.getBlob(7));
		
			
	}
	connection.close();
}catch(Exception ex){ex.printStackTrace();}

return e;
}

//--------------------------------------------------------DELETE QUERY------------------------------------------------------


public static int ProjectDelete(String id){
	
	int status = 0;
	
	try{
		Connection connection=Dbconnect.getConnection();
		
		PreparedStatement ps =connection.prepareStatement("delete  from project where pid=?");
		ps.setString(1,id);
		
		status = ps.executeUpdate();
		
		connection.close();
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	return status;
}
}
