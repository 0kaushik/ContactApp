<%@page import="edu.jspiders.contactapplication.ContactApp"%>
<%@page import="edu.jspiders.contactapplication.ContactDataBase"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>displayall</title>
<style>
      
        body
        {
           background-image: url(./net.jpg);
           background-repeat: no-repeat;
           background-size: cover;
        }
       
    </style>
</head>
<body>
	
	
	<%
		
		ContactDataBase db = new ContactDataBase();
		
		List<ContactApp> l = db.displayAll();
		
		
    %>
    <h1 style="color: navy;" align="center">HERE IS THE DATA OF YOUR FELLOWMATE CHAMP</h1>
	<hr><hr>
	<table border="2" align="center">
	  <tr>
	  	<th>Name</th>
	  	<th>Number</th>
	  	<th>Email</th>
	  	<th>Date of birth</th>
	  </tr>
	  <%
	  	for(int i = 0; i < l.size(); i++)
	  	{
	  		ContactApp ap = l.get(i);
	  	 	
	  %>
	  <tr>
	  	<td> <%= ap.getName() %> </td>
	  	<td><%= ap.getNumber()%></td>
	  	<td><%= ap.getEmail() %></td>
	  	<td><%= ap.getDate() %></td>
	  </tr>
	  <%
	  	}	  
	  %>
	  </table>
	  <div align="center">
	  <a href="HomePage.html">Click here for home page</a>
	  </div>
	  

</body>
</html>