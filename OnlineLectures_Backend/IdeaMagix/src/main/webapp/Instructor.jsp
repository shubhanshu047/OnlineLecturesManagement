<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main div{
	width:100%;
}
table{
    width: 50%;
    margin: auto;
    border-radius: 10px;
}
table th{
	padding: 10px;
}
table td{
	padding:5px;
	text-align:center;
}
</style>
</head>
<body>

<%	 	 	 	  	 	
	String name= (String)session.getAttribute("Iname");
	Connection con=null;
	Statement statement=null;
	ResultSet rs=null;

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ideamagix","root", "shubhamsingh");
		statement = con.createStatement();
		
		rs= statement.executeQuery("select * from lectures where Linstructor='"+name+"' order by id desc");
	}catch(Exception e){}
%>
<div id="main" style="padding: 200px 0px;display: flex;justify-content: center;">
	<div>
		<h4 style="text-align:center">Your scheduled lectures </h4>
		<table  border=1px cellspacing=0px cellpadding=0px>
			<thead>
				<tr><th>Sr no.</th><th>Course</th><th>Date</th></tr>
			</thead>
			<tbody>
				<% 
				rs= statement.executeQuery("select * from lectures where Linstructor='"+name+"' order by id desc");
				int i=1;
				if(!rs.next()){
					%>	
					<tr><td colspan=3>No lecture scheduled yet.</td></tr>
					<%
				}
				else{
					do{ 
					%>
					<tr>
						<td><%= i++ %></td><td><%= rs.getString("Lcourse") %></td>
						<td><%= rs.getString("Ldate") %></td>
					</tr>
					<% }while(rs.next());
				}%>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>