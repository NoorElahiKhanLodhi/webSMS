<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Attendace</title>
        <link rel="stylesheet" href="css/ViewAttendence.css">
    </head>
    <body>
        <a href="TeacherDashboard.jsp">
            <input type="button" value="BACK" class="back">
        </a>
        <a href="index.html">
            <input type="button" value="LOGOUT" class="logout">
        </a>
        <h1 class="heading">YOUR ATTENDANCE</h1>
        <div class="hh">
            <h1><%=session.getAttribute("teachName")%></h1>
            <h1><%=session.getAttribute("teachId")%></h1></div>
        <form method="post" action="ViewAttendance.jsp">
            <select class="month" name="month">
                <option value="0">Select Month</option>
                <option value="1">JAN</option>
                <option value="2">FEB</option>
                <option value="3">MAR</option>
                <option value="4">APR</option>
                <option value="5">MAY</option>
                <option value="6">JUN</option>
                <option value="7">JUL</option>
                <option value="8">AUG</option>
                <option value="9">SEP</option>
                <option value="10">OCT</option>
                <option value="11">NOV</option>
                <option value="12">DEC</option>
            </select><br>
            <button type="submit" name="v" class="view">VIEW</button>
        </form>
            
        <%
            int daysPresent = 0;
                if(request.getParameter("v") != null){
    
        %>
        <table>
            <th>DATE</th>
            <th>STATUS</th>
                <%            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                    Statement s = c.createStatement();
            ResultSet r = 
            s.executeQuery("select date,status from teachattend where id = '"+session.getAttribute("teachId")+"' and month(date) ="+request.getParameter("month")+"");
        
                    while(r.next()){
                    daysPresent++;
                %><tr>
                <td><%=r.getDate("date")%></td>
                <td><%=r.getString("status")%></td>
            </tr><%
            %><%
             }
            %></table><%
        %><br><label class="per">PERCENTAGE : <%=((float)daysPresent/30)*100%></label><%
}catch(Exception e){}
}%>
    </body>
</html>