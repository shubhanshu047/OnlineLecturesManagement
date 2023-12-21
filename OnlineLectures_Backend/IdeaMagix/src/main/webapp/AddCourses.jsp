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
		margin:10px 0px;
	}
	#main input[type="submit"]{
		padding: 2px 10px;
	    border: 1px solid #0000008c;
   		border-radius: 5px;
    	background-color: #bdc5ff;
    	width:30%;
    	margin:auto;
	}
</style>
</head>
<body>

<%
	String cname= request.getParameter("cname");
	String clevel= request.getParameter("clevel");
	String cdec= request.getParameter("cdec");
	String cimage= request.getParameter("cimage");
	
	if(cname!=null && clevel!=null && cdec!=null && cimage!=null){
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ideamagix","root", "shubhamsingh");
		    Statement s = con.createStatement();
		    s.executeUpdate("insert into courses(Cname,Clevel,Cdescription,Cimage) values('"+cname+"','"+clevel+"','"+cdec+"','"+cimage+"')");
		    response.sendRedirect("admin.jsp");
		    
		}catch(Exception e){
			System.out.println(e);
			response.sendRedirect("admin.jsp");
		}
	}
	else{}
	
	
	
	%>

	<div id="main" style="padding: 200px 0px;display: flex;justify-content: center;">
		<div>
			<h4>Add a new course</h4>
			<form action="AddCourses.jsp" method="post">
				<span>Course name : <input type="text" name="cname" required/></span>
				<span><label for="level">Set level: </label>
						<select id="level" name="clevel" required>
							<option value="Beginner">Beginner</option>
							<option value="Intermediate">Intermediate</option>
							<option value="Advanced">Advanced</option>
						</select>
				</span>
				<span>Image link: <input type="text" name="cimage" required/></span>
				
				<span style="margin-bottom:20px;">Description : <input type="text" name="cdec" required/></span>
				<input type="submit"/>
			</form>
		</div>
	</div>
</body>
</html>