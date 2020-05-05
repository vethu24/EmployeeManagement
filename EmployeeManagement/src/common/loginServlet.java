package common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.Dbconnect;
import DataAccess.*;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String dbuname = null, dbpassword = null, dbUid = null;
		
		Connection conn = Dbconnect.getConnection();
		//String message = null;
		String sql = "select EID,username,password from employee where username='"
				+ username + "'";

		String sql2 = "select id,username,password from admin where username = '"
				+ username + "'";
		
		try{
			
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);

			Statement st2 = conn.createStatement();
			ResultSet rs2 = st2.executeQuery(sql2);
			
			int count = 0;
			int countAdmin = 0;
			
			while (rs.next()) {

				dbUid = (rs.getString(1));
				dbuname = (rs.getString(2));
				dbpassword = (rs.getString(3));
				
				count += 1;
			}

			if (count == 1 && dbuname.equals(username)
					&& dbpassword.equals(password)) {
				HttpSession session = request.getSession();

				
				session.setAttribute("username", dbuname);
				session.setAttribute("password", dbpassword);
				
			
				response.sendRedirect("Employee/dashboard.jsp");
				 

			}

			else if (count == 1 && dbuname.equals(username)
					&& !dbpassword.equals(password)) {
				out.println("Password worng");
				response.sendRedirect("index.jsp" );
			}

			else if (count > 1) {
			
				response.sendRedirect("index.jsp");
			}

			else{
				
					while (rs2.next()) {
	
						dbUid = (rs2.getString(1));
						dbuname = (rs2.getString(2));
						dbpassword = (rs2.getString(3));
						
						countAdmin += 1;
						}
				
						if (countAdmin == 1 && dbuname.equals(username)
								&& dbpassword.equals(password)) {
							HttpSession session = request.getSession();
		
							
							session.setAttribute("username", dbuname);
							session.setAttribute("password", dbpassword);
							
							response.sendRedirect("Admin/dashboard.jsp");
							
		
						}
		
						else if (countAdmin == 1 && dbuname.equals(username)
								&& !dbpassword.equals(password)) {
							out.println("Password worng");
							response.sendRedirect("index.jsp");
						}
		
						else if (countAdmin > 1) {
							
							response.sendRedirect("index.jsp");
						}
						
						else {
							response.sendRedirect("index.jsp");
						}			
				}
		}
			catch(Exception ex){
				ex.printStackTrace();
			}
	}

}
