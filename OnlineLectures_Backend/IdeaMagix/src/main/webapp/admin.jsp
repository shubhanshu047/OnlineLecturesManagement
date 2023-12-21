<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.Date" import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#course * {
		align-items: center;
		margin: 10px;
		
	}
	#courses{
		display: flex;
		flex-direction: row;
		flex-wrap:wrap;
		justify-content: space-evenly;
		align-items:center;
	}
	a button{
		padding: 5px 10px;
		border: 1px solid green;
		background-color: black;
		color: white;
		border-radius: 5px;
	}
	#top{
	width: 100%;
    padding: 50px 0px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    }
    #mid table{
    border: 2px solid green;
    border-radius: 10px;
    margin:auto;
    }
    #mid table td, #mid table th{
    padding: 10px 15px;
    }
    
    
</style>
</head>
<body>
<%

String msg="";
String msg2="";

try{
	msg=request.getParameter("msg");
	msg2=request.getParameter("iname");
	if(msg.equals("lecturePresent")){
		out.println("<script>");
		out.println("alert('A lecture is already scheduled for "+msg2+" on this date, cant reschedule');");
		out.println("</script>");
	}
	else if(msg.equals("lectureCancelled")){
		out.println("<script>");
		out.println("alert('The lecture was cancelled');");
		out.println("</script>");
	}
	else{
		out.println("<script>");
		out.println("alert('Lecture Scheduled !');");
		out.println("</script>");
	}	
}catch(Exception e){}

Connection con=null;

Statement s=null;
ResultSet rs=null;

Statement ss2=null;
ResultSet rs2=null;

Statement s2=null;
ResultSet r2=null;

Statement ss3=null;
ResultSet rs3=null;

SimpleDateFormat sd= new SimpleDateFormat("yyyy-MM-dd");
String todayDate=sd.format(new Date());


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ideamagix","root", "shubhamsingh");
    s = con.createStatement();
    s2 = con.createStatement();
    ss2 = con.createStatement();
    ss3 = con.createStatement();
    rs= s.executeQuery("select * from courses ");
}catch(Exception e){}
%>
<div>
	<div id="top" >	
		<h2 style="text-align:center; margin-bottom:20px;">Courses</h2>
		<div id="courses" style="height:100%; width:100%; margin-bottom:20px;">
			<%
			while(rs.next()){
				%>
				<div id="course" style="text-align:center; margin:2%; border:2px solid green;border-radius:10px; display:flex; flex-direction:column; justify-content:space-evenly;align-items:center; max-width:35%">
					<div style="display:flex;text-align:center; justify-content:center"><h3><%= rs.getString("Cname") %></h3> | <span><%= rs.getString("Clevel") %></span></div>
					<img style="height:100px; width:100px; margin:auto;" src="<%= rs.getString("Cimage")%>" alt="Course Logo.."/>
					<p style="margin: 10px 0px;"><%= rs.getString("cdescription") %></p>
					<div id="lecs" style="border-top:1px solid green">
					<h5 style="text-align:center; margin-bottom:10px;">Lectures</h5>
					<table  border=1px cellspacing=0px cellpadding=0px>
					<thead>
						<tr><th>Sr no.</th><th>Instructor</th><th>Date</th><th>Action</th></tr>
					</thead>
					<tbody>
						<% 
						rs2 = ss2.executeQuery("select * from lectures where Lcourse='"+ rs.getString("Cname") +"' order by id desc");
						int i=1;
						while(rs2.next()){ 
						String x="ManageLectures?action=delete&Linstructor="+rs2.getString("Linstructor")+"&Ldate="+rs2.getString("Ldate")+"&Lcourse="+rs.getString("Cname")+"";
						%>
						<tr>
							<td><%= i++ %></td><td><%= rs2.getString("Linstructor") %></td>
							<td><%= rs2.getString("Ldate") %></td>
							<td><a href=<%=x %>><button>Cancel</button></a></td>
						</tr><% } %>
						<tr>
						<form action="ManageLectures" method="Get">
							<td></td>
							<td><label for="schedInst">Instructor: </label>
										<select id="schedInst" name="schedInst" required>
										<option value="" disabled selected>Select Instructor</option>
										<%
										r2 = s2.executeQuery("select * from instructor");
										while(r2.next()){
										%>
										<option value="<%=r2.getString("Iname")%>"><%=r2.getString("Iname")%></option>
										<%}%>
										</select>
							</td>
							<td>
								<label for="date">Select Date: </label>
								<input type="date" name="schedDate" id="date" min="<%= todayDate %>" value="" required/>
								<input type="hidden" name="schedCourse" value="<%=rs.getString("Cname")%>"/>
							</td>
							<td><input type="submit" name="action" value="submit"/>
							</td>
							</form>
						</tr>
					</tbody>
					</table>
				</div>
				</div>
			<%} %>
		</div>
		<a style="margin-bottom:20px;" href="AddCourses.jsp"><button>Add more courses</button></a>
	</div>
	<div id="mid" style="margin-bottom: 50px;">
		<h2 style="text-align:center; margin-bottom:20px;"> Registered Instructors  </h2>
			<div id="ins" style="text-align:center;">
				<table  border=1px cellspacing=0px cellpadding=0px>
					<thead>
						<tr><th>Sr no.</th><th>Name</th><th>Password</th><th>Other details</th></tr>
					</thead>
					<tbody>
						<% 
						rs3 = ss3.executeQuery("select * from instructor");
						int i=1;
						while(rs3.next()){ %>
						<tr>
							<td><%= i++ %></td><td><%= rs3.getString("Iname") %></td><td><input type="password" value="<%= rs3.getString("password") %>" style="text-align:center; border:0px;" readonly/></td><td><%= rs3 .getString("IotherDetails") %></td>
						</tr><% } %>
					</tbody>
					</table>
			</div>
	</div>
</div>
</body>
</html>