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
        <title>Class</title>
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
        <h1 class="heading">Class</h1>
        <div class="add">
            <h1>CLASS ASSIGNING</h1>
            <form method="post" action="Class.jsp" id="f">
            <label for="cid">Class ID : </label>
            <input type="text" name="cid" id="cid"><br>
            <label for="cn">Class:</label>
            <input type="text" name="cn" id="cn"><br>
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
                LocalDate date = java.time.LocalDate.now();
                if(request.getParameter("b1") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("insert into class(cid,class,tid)values('"+request.getParameter("cid")+"','"
+request.getParameter("cn")+"','"+request.getParameter("tid")+"')"); 
                       
%> <script>alert('Class Registered!');location='Class.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Adding!');location='Class.jsp';</script><%
}
                    }%>

    </div>

                    <div class="view">
        <h1>EDIT CLASS ASSIGNMENT</h1>
        <form method="post" action="Class.jsp">
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

<button type="submit" name="bb">Assign Class</button>
</form>

<%
                if(request.getParameter("bb") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("UPDATE class SET tid = '"+request.getParameter("tid")+"' where cid = '"+request.getParameter("cid")+"'"); 
                       
%> <script>alert('Class Assignment Changed!');location='Class.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Changing Assignment!');location='Class.jsp';</script><%
}
                    }%>
 
</div>

</body>

</html>