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
        <title>Admin</title>
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
        <h1 class="heading">ADMINS</h1>
        <div class="add">
            <h1>REGISTRATION</h1>
            <form method="post" action="Admin.jsp" id="f">
                <label for="aid">Admin ID : </label>
            <input type="text" name="aid" id="aid"><br>
            <label for="an">Admin Name:</label>
            <input type="text" name="an" id="an"><br>
            <label for="pr">Password :</label>
            <input type="password" name="pr" id="pr"><br>
            
            <button type="submit" name="b1" class="b1">Register</button>
            </form>
<%
                if(request.getParameter("b1") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("insert into admininfo(adminId,name,pass)values('"+request.getParameter("aid")+"','"
+request.getParameter("an")+"','"+request.getParameter("pr")+"')"); 
                       
%> <script>alert('Admin Registered!');location='Admin.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Registering, May Already Be Registered!');location='Admin.jsp';</script><%
}
                    }%>

    </div>

                    <div class="view">
        <h1>REMOVE ADMIN</h1>
        <form method="post" action="Admin.jsp">
            <select name="aid" id="aid">
                <option>Select Admin</option>
        <%
     try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        ResultSet r = s.executeQuery("select * from admininfo");
                         while(r.next()){
                String stu = r.getString(1)+"<>"+r.getString(2);
               %>
               <option value="<%=r.getString(1)%>"><%=stu%></option>
            <%
            } 
c.close();
    s.close();
}catch(Exception e){out.println("<script>");
            out.println("alert('DB Connect Error for showing admins!');");
            out.println("location='Admin.jsp';");
            out.println("</script>");}
            %>
</select>
<button type="submit" name="bb">Remove Admin</button>
</form>

<%
                if(request.getParameter("bb") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("DELETE FROM admininfo where adminid = '"+request.getParameter("aid")+"'"); 
                       
%> <script>alert('Admin Removed!');location='Admin.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Removing Admin!');location='Admin.jsp';</script><%
}
                    }%>
 
</div>

</body>

</html>