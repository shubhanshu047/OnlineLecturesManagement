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
	textarea{
		resize: vertical;
		overflow: auto;
		height:15px;
		min-height:5px;
		max-height:80px;
	}
</style>
</head>

<body>

	<%
	String name= request.getParameter("name");
	String pass= request.getParameter("pass");
	String od= request.getParameter("od");
	
	if(name!=null && pass!=null && od!=null){
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ideamagix","root", "shubhamsingh");
		    Statement s = con.createStatement();
		    s.executeUpdate("insert into instructor(Iname,password,IotherDetails) values('"+name+"','"+pass+"','"+od+"')");
		   	response.sendRedirect("login.jsp");
		    
		}catch(Exception e){}
	}
	
	
	%>

	<div id="main" style="padding: 200px 0px;display: flex;justify-content: center;">
		<div>
			<h4>Register as Instructor -</h4>
			<form action="register.jsp" method="post">
				<span>Name : <input type="text" name="name" required/></span>
				<span>pass : <input type="password" name="pass" required/></span>
				<span>Other Details : 
				<!--  <input type="text" name="od" required/>  -->
				<textarea name="od" required></textarea>
				</span>
				<span><input style="margin: 10px 0px;" type="submit"/></span>
			</form>
			
			<p><a href="login.jsp">Already registered ?<a/></p>
		</div>
	</div>
</body>
</html>