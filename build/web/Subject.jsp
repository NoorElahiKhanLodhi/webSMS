<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*" import="java.util.*"
        import="com.TransportPortal.MyFunctions.*"
        import="java.time.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Subject</title>
        <link rel="stylesheet" href="css/Student.css">
    </head>

    <body>
        <a href="AdminDashboard.jsp">
            <input type="button" value="BACK" class="back">
        </a>
        <a href="index.html">
            <input type="button" value="LOGOUT" class="logout">
        </a>
        <br>
        <br>
        <h1 class="heading">SUBJECT</h1>
        <div class="add">
            <h1>SUBJECT ASSIGNING</h1>
            <form method="post" action="Subject.jsp" id="f">
            <label for="sub">Subject : </label>
            <input type="text" name="sub" id="sub"><br>
            
             <select name="cid" id="cid">
                <option>Select Class</option>
        <%
     try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        ResultSet r = s.executeQuery("select * from class");
                         while(r.next()){
                String stu = r.getString(1)+"<>"+r.getString(2);
               %>
               <option value="<%=r.getString(1)%>"><%=stu%></option>
            <%
            } 
c.close();
    s.close();
}catch(Exception e){out.println("<script>");
            out.println("alert('DB Connect Error for showing Class!');");
            out.println("location='Class.jsp';");
            out.println("</script>");}
            %>
             </select><br>
            
            <select name="tid" id="tid">
                <option>Select Teacher</option>
        <%
     try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        ResultSet r = s.executeQuery("select * from teachinfo");
                         while(r.next()){
                String stu = r.getString(1)+"<>"+r.getString(2);
               %>
               <option value="<%=r.getString(1)%>"><%=stu%></option>
            <%
            } 
c.close();
    s.close();
}catch(Exception e){out.println("<script>");
            out.println("alert('DB Connect Error for showing class!');");
            out.println("location='Class.jsp';");
            out.println("</script>");}
            %>
</select>
            <button type="submit" name="b1" class="b1">Done</button>
            </form>
<%
                if(request.getParameter("b1") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("insert into subinfo(subject,tid,cid)values('"+request.getParameter("sub")+"','"
+request.getParameter("tid")+"','"+request.getParameter("cid")+"')"); 
                       
%> <script>alert('Subject Registered!');location='Subject.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Adding!');location='Subject.jsp';</script><%
}
                    }%>

    </div>

                    <div class="view">
        <h1>EDIT SUBJECT ASSIGNMENT</h1>
        <form method="post" action="Subject.jsp">
            <select name="sub" id="sub">
                <option>Select Subject</option>
        <%
     try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        ResultSet r = s.executeQuery("select * from subinfo");
                         while(r.next()){
                String stu = r.getString(1)+"<>"+r.getString(2)+"<>"+r.getString(3);
               %>
               <option value="<%=r.getString(1)%>"><%=stu%></option>
            <%
            } 
c.close();
    s.close();
}catch(Exception e){out.println("<script>");
            out.println("alert('DB Connect Error for showing Subject!');");
            out.println("location='Subject.jsp';");
            out.println("</script>");}
            %>
</select>

 <select name="tid" id="tid">
                <option>Select Teacher</option>
        <%
     try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        ResultSet r = s.executeQuery("select * from teachinfo");
                         while(r.next()){
                String stu = r.getString(1)+"<>"+r.getString(2);
               %>
               <option value="<%=r.getString(1)%>"><%=stu%></option>
            <%
            } 
c.close();
    s.close();
}catch(Exception e){out.println("<script>");
            out.println("alert('DB Connect Error for showing teachers for remove!');");
            out.println("location='Teacher.jsp';");
            out.println("</script>");}
            %>
</select>

<button type="submit" name="bb">Assign Subject</button>
</form>

<%
                if(request.getParameter("bb") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("UPDATE subinfo SET tid = '"+request.getParameter("tid")+"' where subject = '"
+request.getParameter("sub")+"'");
%> <script>alert('Subject Assignment Changed!');location='Subject.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Changing Assignment!');location='Subject.jsp';</script><%
}
                    }%>
 
</div>

</body>

</html>