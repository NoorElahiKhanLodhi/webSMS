import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.time.*;

public class teachAttenServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
             if (request.getParameter("sub") != null) {
             String id = session.getAttribute("teachId").toString();
LocalTime time = java.time.LocalTime.now();
LocalDate date = java.time.LocalDate.now();
String stat = "p";
try{
    Class.forName("com.mysql.jdbc.Driver");
           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
Statement s = c.createStatement();
        s.executeUpdate("insert into teachattend(id,date,time,status)values('"+id+"','"+date+"','"+time+"','"+stat+"')");
        out.println("<script>");
            out.println("alert('Attendance Marked!');");
            out.println("location='TeacherDashboard.jsp';");
            out.println("</script>");
}catch(      ClassNotFoundException | SQLException e)
        {        out.println("<script>");
            out.println("alert('Error Marking Attendance!');");
            out.println("location='TeacherDashboard.jsp';");
            out.println("</script>");        }
        }
    }

}
