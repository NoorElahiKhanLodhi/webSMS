import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class loginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String user = request.getParameter("id");
        String pass = request.getParameter("pass");
        String des = request.getParameter("poss");
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        if ("".equals(pass) || "".equals(user) || "".equals(des)) {
                out.println("<script>");
                out.println("alert('ID, pasword or designation cannot be empty!');");
                out.println("location='index.html';");
                out.println("</script>");
            }
        if (des.equals("a")){
        try {            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb", "root", "");
            String query = "select * from adminInfo where adminid='" + user + "' and pass='" + pass + "'";
            stm = con.createStatement();
            rs = stm.executeQuery(query);
            if (rs.next()) {
                out.println("<script>");
                out.println("alert('Login Successful!');");
                out.println("location='index.html';");
                out.println("</script>");
                session.setAttribute("aId", user);
                session.setAttribute("aName", rs.getString(2));
                response.sendRedirect("AdminDashboard.jsp");
                session.setAttribute("date", java.time.LocalDate.now());
            } else {                out.println("<script type=\"text/javascript\">");
                out.println("alert('ID, Password or designation incorrect');");
                out.println("location='index.html';");
                out.println("</script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println(e);
        } finally {
            try {
                rs.close();
                stm.close();
                con.close();
            } catch (SQLException e) {
                out.println(e);
            }
        }
        }
        else if (des.equals("t")){    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb", "root", "");
            String query = "select * from teachinfo where tid='" + user + "' and pass='" + pass + "'";
            stm = con.createStatement();
            rs = stm.executeQuery(query);
            if (rs.next()) {
                out.println("<script>");
                out.println("alert('Login Successful!');");
                out.println("location='index.html';");
                out.println("</script>");

                session.setAttribute("teachId", user);
                session.setAttribute("teachName", rs.getString(2));
                response.sendRedirect("TeacherDashboard.jsp");
                session.setAttribute("date", java.time.LocalDate.now());
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ID, Password or designation incorrect');");
                out.println("location='index.html';");
                out.println("</script>");
            }
        } catch (ClassNotFoundException e) {
            out.println(e);
        } catch (SQLException e) {
            out.println(e);
        } finally {
            try {
                rs.close();
                stm.close();
                con.close();
            } catch (SQLException e) {
                out.println(e);
            }
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false", "root", "");

            Statement s = c.createStatement();
            ResultSet r
                    = s.executeQuery("select * from class where tid = '" + session.getAttribute("teachId") + "'");
            while (r.next()) {
                session.setAttribute("myclass", r.getString(2));
                session.setAttribute("mycid", r.getString(1));
            }
            c.close();
            s.close();
        } catch (Exception e) {
            out.println("<script>");
            out.println("alert('DB Connect Error 1!');");
            out.println("location='StudentAttendence.jsp'DB Error;");
            out.println("</script>");
        }}
    }
}