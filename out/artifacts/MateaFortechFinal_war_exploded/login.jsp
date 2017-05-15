<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%
        String userid = request.getParameter("usr");
        session.putValue("idStudent", userid);
        String pwd = request.getParameter("pwd");
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenti", "root", "aeria68121357!");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from studenti.student where username='" + userid + "'");
        if (rs.next()) {
            if (rs.getString(3).equals(pwd)) {

                Statement getAll=con.createStatement();
                ResultSet resultSet=getAll.executeQuery("select name,forname,credits from studenti.student");
                int columns=resultSet.getMetaData().getColumnCount();
                StringBuilder message=new StringBuilder();
                while(resultSet.next()){
                    for(int i=1;i<=columns;i++){
                        message.append(resultSet.getString(i)+  " ");
                    }
                    message.append("\n");
                    %>
                    <br/><br/>
                    <%
                }
                out.println(message);

            } else {
                out.println("Invalid password try again");
            }
        } else
%>
<a href="index.jsp">Logout</a>
</body>
</html>