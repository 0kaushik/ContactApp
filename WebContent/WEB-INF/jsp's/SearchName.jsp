
<%@page import="edu.jspiders.contactapplication.ContactDataBase"%>
<%@page import="edu.jspiders.contactapplication.ContactApp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Naam</title>
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
	<%  ContactApp p = new ContactApp();
		p.setName(request.getParameter("fellow"));
		ContactDataBase db = new ContactDataBase();
		ContactApp app =  db.searchName(p);
		if(app.getNumber() == null)
		{
	%>
	<h1 style="color: navy;" align="center">OOP'S FILE NOT FOUND SOLDIER</h1>
	
	<%
		}
		else
		{
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
	  <tr>
	    <td><%= app.getName() %></td>
	    <td><%= app.getNumber() %></td>
	    <td><%= app.getEmail() %></td>
	   <td><%= app.getDate() %></td>
	   
	   </tr>	    	    
	</table>
	
	<%
		}	
	%>
	 <div align="center">
	  <a href="HomePage.html">Click here for home page</a>
	  </div>

</body>
</html>