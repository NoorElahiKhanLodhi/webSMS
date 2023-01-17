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
        <title>Teacher</title>
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
        <h1 class="heading">TEACHERS</h1>
        <div class="add">
            <h1>REGISTRATION</h1>
            <form method="post" action="Teacher.jsp" id="f">
                <label for="tid">Teacher ID : </label>
            <input type="text" name="tid" id="tid"><br>
            <label for="nr">Teacher Name:</label>
            <input type="text" name="nr" id="nr"><br>
            <label for="dob">DOB:</label>
            <input type="date" name="dob"><br>
            <label for="jd">Join Date:</label>
            <input type="date" name="jd"><br>
            <label for="pr">Password :</label>
            <input type="password" name="pr" id="pr"><br>
            
            <button type="submit" name="b1" class="b1">Done</button>
            </form>
<%
                LocalDate date = java.time.LocalDate.now();
                if(request.getParameter("b1") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("insert into teachinfo(tid,name,dob,joinDate,pass)values('"
+request.getParameter("tid")+"','"+request.getParameter("nr")+"','"+request.getParameter("dob")
+"','"+request.getParameter("jd")+"','"+request.getParameter("pr")+"')"); 
                       
%> <script>alert('Teacher Registered!');location='Teacher.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Admiting, May Already Be An Employee!');location='Teacher.jsp';</script><%
}
                    }%>

    </div>

                    <div class="view">
        <h1>REMOVE TEACHER</h1>
        <form method="post" action="Teacher.jsp">
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
<button type="submit" name="bb">Remove Teacher</button>
</form>

<%
                if(request.getParameter("bb") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("DELETE FROM teachinfo where tid = '"+request.getParameter("tid")+"'"); 
                       
%> <script>alert('Teacher Removed!');location='Teacher.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Removing Teacher!');location='Teacher.jsp';</script><%
}
                    }%>
 
</div>

</body>

</html>