
<%@page import="edu.jspiders.contactapplication.ContactApp"%>
<%@page import="edu.jspiders.contactapplication.ContactDataBase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JspFullDataAddon</title>
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
		ContactApp ap = new ContactApp();
		ap.setName(request.getParameter("name"));
		ap.setNumber(request.getParameter("num"));
		ap.setEmail(request.getParameter("mail"));
		ap.setDate(request.getParameter("dob"));
		
		if(db.insertData(ap))
		{
	%>
	<h1 style="color: navy;" align="center">SUCCESSFULLY DATA HAS INSERTED TO DATABASE !!!</h1>
	<%
		}
		else
		{
	
	%>
	<h1 style="color: navy;" align="center">INVALID DATA HAS GIVEN... PLEASE INSERT THE DATA PROPERLY !!!</h1>
	<%
		}	
	%>
	<div align="center">
	  <a href="HomePage.html">Click here for home page</a>
	  </div>
</body>
</html>