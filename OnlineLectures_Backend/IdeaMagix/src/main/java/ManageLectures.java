

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ManageLectures")
public class ManageLectures extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String Linstructor=request.getParameter("Linstructor");
		String Ldate=request.getParameter("Ldate");
		String Lcourse=request.getParameter("Lcourse");
		
		String schedInst= request.getParameter("schedInst");
		String schedDate= request.getParameter("schedDate");
		String schedCourse=request.getParameter("schedCourse");
		
		
		String action=request.getParameter("action");
		Connection con=null;
		Statement st=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/ideamagix","root","shubhamsingh");
			st=con.createStatement();
			
			
			if(action.equals("delete")) {
				st.executeUpdate("delete from lectures where Lcourse='"+Lcourse+"' AND Linstructor='"+Linstructor+"' AND Ldate='"+Ldate+"'");
				response.sendRedirect("admin.jsp?msg=lectureCancelled");
			}
			
			else if(action.equals("submit")) {
				ResultSet rs= st.executeQuery("select * from lectures where Linstructor='"+schedInst+"' AND Ldate='"+schedDate+"'");
				if(rs.next()) {
					response.sendRedirect("admin.jsp?msg=lecturePresent&iname="+schedInst+"");
				}
				else if(!rs.next()) {
					st.executeUpdate("insert into lectures(Lcourse,Ldate,Linstructor) values('"+schedCourse+"','"+schedDate+"','"+schedInst+"')");
					response.sendRedirect("admin.jsp?msg=lectureScheduled");
				}
			}
			else {
				response.sendRedirect("login.jsp");
			}
			
		}catch(Exception e) {}		
	}	

}
