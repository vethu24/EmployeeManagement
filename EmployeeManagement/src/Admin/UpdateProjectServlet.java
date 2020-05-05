package Admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DB.Dbconnect;

/**
 * Servlet implementation class UpdateProjectServlet
 */
@WebServlet("/UpdateProjectServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, maxFileSize=1024*1024*1000,maxRequestSize=1024*1024*1000)

public class UpdateProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
 
         InputStream inputStream = null;

        // Random rand = new Random();
       //  int  n = rand.nextInt(9999) + 1;
         String pid=request.getParameter("id");

         
         String pname=(request.getParameter("pname"));
         String pdescription=request.getParameter("pdescription");
         String date=request.getParameter("date");
         String empname=request.getParameter("empname");
         Part filePart = request.getPart("file");
         
         if (filePart != null) 
         {
             System.out.println(filePart.getName());
             System.out.println(filePart.getSize());
             System.out.println(filePart.getContentType());

             inputStream = filePart.getInputStream();
         }
 
         try 
         {
             
             Connection conn= Dbconnect.getConnection();
             
             String sql = "update  project set pname=?,pdescription=?,date=?,empname=?,path=? where pid=?";
             PreparedStatement statement = conn.prepareStatement(sql);
             
             statement.setString(1, pname);
             statement.setString(2, pdescription);
             statement.setString(3, date);
             statement.setString(4, empname);
             if (inputStream != null) 
             {
                 statement.setBinaryStream(5, inputStream, (int) filePart.getSize());
             }
             statement.setString(6,pid );
             int row = statement.executeUpdate();
             if (row > 0) 
             {
                 out.println("File uploaded!!!");
                 
                 conn.close();
                 
                 //RequestDispatcher rs = request.getRequestDispatcher("upload_form.jsp");
                 out.println("<script>alert(' update successfully');window.location.href='http://localhost:8080/EmployeeManagement/Admin/ManageProject.jsp';</script>");
                  
                
             }
             else
             {
                 //out.println("Couldn't upload your file!!!");
                 out.println("<script>alert(' Couldn't upload your file!!!');window.location.href='http://localhost:8080/EmployeeManagement/Admin/UpdateProject.jsp';</script>");
                 
                 conn.close();
                 
               
             }    

         }catch(Exception e){e.printStackTrace();} 
	}

}
