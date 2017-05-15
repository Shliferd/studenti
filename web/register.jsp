<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Register</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
    String idStudent=request.getParameter("userid");
    session.putValue("idStudent",idStudent);
    String username=request.getParameter("username");
    String pwd=request.getParameter("pwd");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String credits =request.getParameter("credits");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenti",
            "root","aeria68121357!");
    Statement st= con.createStatement();
    ResultSet rs;
    int i=st.executeUpdate("insert into studenti.student values ('"+idStudent+"','"+username+"','"+pwd+"','"+fname+"',	'"+lname+"','"+credits+"')");

    out.println("Registered");


%>
<a href ="Login.html">Login</a><br/><br/>
<a href="index.jsp">Home</a>
</body>
</html>