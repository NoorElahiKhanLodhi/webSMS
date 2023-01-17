<%@page contentType="text/html" pageEncoding="UTF-8"
        import="javax.servlet.*"
        import="javax.servlet.http.*"
        import="java.io.IOException"
        import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Teacher Dashboard</title>
        <link rel="stylesheet" href="css/TeacherDashboard.css">
    </head>
    <body>
        <h1 class="heading">DASHBOARD</h1>
        <nav class="bar">
            <a href="ViewAttendance.jsp">View Your Attendance</a>
            <a href="StudentAttendence.jsp">Student Attendance</a>
            <a href="StudentMarks.jsp">Student Marks</a>
            <a href="index.html"
               style="border-style: hidden;">Logout</a>
        </nav>
        <div class="panel">
            <h1 style="color: brown; font-size: 3em;">Mark Your Attendance</h1>
            <label>ID :</label>
            <label for="name"><%=session.getAttribute("teachId")%><br>
                Name : <%=session.getAttribute("teachName")%></label><br>
            <label>Date :</label>
            <label for="date"><%=session.getAttribute("date")%></label><br>
            <form action="teachAttenServlet" method="post">    
                <input type="submit" value="🗸Mark Attendance" name="sub">        </form>
        </div>
    </body>
</html>