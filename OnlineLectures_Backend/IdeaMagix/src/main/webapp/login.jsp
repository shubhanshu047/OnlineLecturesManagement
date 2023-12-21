<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main div{
		    display: inline-flex;
    		padding: 0% 2% 0% 2%;
 		    border: 2px solid green;
   			border-radius: 15px;
    		flex-direction: column;
    		align-items: center;
    		
	}
	#main form{
		display: flex;
		flex-direction:column;
		padding: 10% 0%;
	}
	#main form span{
		margin:5px 0px
	}
	#main form > :last-child{
		display: flex;
    	justify-content: center;
	}
	#main input[type="submit"]{
		padding: 2px 10px;
    border: 1px solid #0000008c;
    border-radius: 5px;
    background-color: #bdc5ff;
	}
</style>
</head>
<body>


<%
	
	String name= request.getParameter("name");
	String pass= request.getParameter("pass");
	
	try{
	    if(name.equals("admin") && pass.equals("admin")){
			response.sendRedirect("admin.jsp");
		}
	    else if(name!=null && pass!=null){
	    	Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ideamagix","root", "shubhamsingh");
		    Statement statement = con.createStatement();
			ResultSet rs= statement.executeQuery("select * from instructor where iname='"+name+"' AND password='"+pass+"'");
			if(!rs.next()){
				out.println("<script>");
				out.println("alert('Wrong Username or password !');");
				out.println("</script>");
			}
			else{
			    session.setAttribute("Iname",name);
				response.sendRedirect("Instructor.jsp");
			}
		}
		
	}catch(Exception e){}

%>


	<div id="main" style="padding: 200px 0px;display: flex;justify-content: center;">
		<div>
			<h4>Login in -</h4>
			<form method="post" action="login.jsp">
				<span>Name : <input type="text" name="name" required/></span>
				<span> Password : <input type="password" name="pass" required/></span>
				<span><input type="submit"/></span>
			</form>
			
			<p><a href="register.jsp">Register as Instructor<a/></p>
		</div>
	</div>
	
</body>
</html>