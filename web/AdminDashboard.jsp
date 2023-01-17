<%@page contentType="text/html" pageEncoding="UTF-8"
        import="javax.servlet.ServletException"
        import="javax.servlet.http.HttpServlet"
        import="javax.servlet.http.HttpServletRequest"
        import="javax.servlet.http.HttpServletResponse"
        import="javax.servlet.http.HttpSession"
        import="java.io.IOException"
        import="java.io.PrintWriter"%>
<%@page import="java.sql.*" import="java.util.*"
        import="com.TransportPortal.MyFunctions.*"
        import="java.time.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="css/AdminDashboard.css">
    </head>
    <body>
        <h1 class="heading">DASHBOARD</h1>
        
        <div class="bar">
            <nav style="text-align: center;">
                <br>
            <a href="chooseAttendance.html">Attendance</a><br>
            <a href="Marks.jsp">Marks</a><br>
            <a href="Student.jsp">Student</a><br>
            <a href="Teacher.jsp">Teacher</a><br>
            <a href="Admin.jsp">Admin</a><br>
            <a href="Class.jsp">Classes</a><br>
            <a href="Subject.jsp">Subjects</a><br>
            <a href="index.html">Logout</a><br>
        </nav></div>
                <div class="panel">
                    <h1 class="hd">Academic Calender</h1>
            <form action="" method="post">    
                <input type="date" name="date1"><br>
                <select name="status">
                    <option value="">Select Status</option>
                    <option value="w">Working Day</option>
                    <option value="h">Holiday</option>
                </select><br>
                <label>Enter event or comment :</label>
  <br>              <input type="text" name="event">
 <br>               <button type="submit" name="b4">🗸Mark Day</button>
            </form>
                    <%
                    if(request.getParameter("b4")!=null){
                        String date1 = request.getParameter("date1");
                        String status = request.getParameter("status");
                        String event = request.getParameter("event");
                        
                        try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
Statement s = c.createStatement();
        s.executeUpdate("insert into academiccalender(date,status, event)values('"+date1+"','"+status+"','"+event+"')");
        out.println("<script>");
            out.println("alert('Calender Marked!');");
            out.println("location='AdminDashboard.jsp';");
            out.println("</script>");
            c.close();
}catch(      ClassNotFoundException | SQLException e)
        {        out.println("<script>");
            out.println("alert('Error Marking Calender!');");
            out.println("location='AdminDashboard.jsp';");
            out.println("</script>");        }
                        
                        
                        }
                    %>
        </div>
    </body>
</html>