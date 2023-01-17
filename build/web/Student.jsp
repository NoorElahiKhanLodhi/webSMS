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
        <title>Student</title>
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
        <h1 class="heading">STUDENT</h1>
        <div class="add">
            <h1>ADMISSION</h1>
            <form method="post" action="Student.jsp" id="f">
                <select name="cls" id="cls" onchange="myFunction()">
                    <option value="">Select Class</option>
                    <%
           try{
                      Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                           Statement s = c.createStatement();
                           ResultSet r = s.executeQuery("SELECT * FROM class ");
                           while(r.next()){
                           String cs = "["+r.getString("cid")+"] Class : "+r.getString("class");
                    %>               
                    <option value="<%=r.getString(1)%>"><%=cs%></option>
                    <%    }     
            c.close();
            s.close();
        }catch(Exception e){out.println("<script>");
                    out.println("alert('DB Connect Error 1!');");
                    out.println("location='Marks.jsp'DB Error;");
                    out.println("</script>");}%>
                </select>
                <label for="rna">Roll No:</label>
            <input type="text" name="rna" id="rna"><br>
                <label for="na">Name:</label>
            <input type="text" name="na" id="na"><br>
            <label for="fna">Father:</label>
            <input type="text" name="fna" id="fna"><br>
            <label for="dob">DOB:</label>
            <input type="date" name="dob"><br>
            <label for="ada">Addmission Date:</label>
            <input type="date" name="ada"><br>
            <label for="pna">Phone:</label>
            <input type="text" name="pna" id="pna"><br>
            
            <button type="submit" name="b1" class="b1">Done</button>
            </form>
<%
                if(request.getParameter("b1") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("insert into stuinfo(roll,name,cid,father,dob,addDate,phone)values('"
+request.getParameter("rna")+"','"+request.getParameter("na")+"','"+request.getParameter("cls")
+"','"+request.getParameter("fna")+"','"+request.getParameter("dob")+"','"+request.getParameter("ada")+
"','"+request.getParameter("pna")+"')"); 
                       
%> <script>alert('Student Registered And Granted Admission!');location='Student.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Admiting, May Already Be In School!');location='Student.jsp';</script><%
}
                    }%>

    </div>

                    <div class="view">
        <h1>CANCEL ADDMISSION</h1>
        <form method="post" action="Student.jsp">
            <select name="roll" id="roll">
                <option>Select Student</option>
        <%
     try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        ResultSet r = s.executeQuery("select * from stuinfo");
                         while(r.next()){
                String stu = r.getString(1)+"<>"+r.getString(2)+"<>"+r.getString(3);
               %>
               <option value="<%=r.getString(1)%>"><%=stu%></option>
            <%
            } 
c.close();
    s.close();
}catch(Exception e){out.println("<script>");
            out.println("alert('DB Connect Error for showing students for tc!');");
            out.println("location='Student.jsp';");
            out.println("</script>");}
            %>
</select>
<button type="submit" name="bb">Cancel Addmission</button>
</form>

<%
                if(request.getParameter("bb") != null){
                 try{  
                    Class.forName("com.mysql.jdbc.Driver");
                           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
s.executeUpdate("DELETE FROM stuinfo where roll = '"+request.getParameter("roll")+"'"); 
                       
%> <script>alert('Student Removed!');location='Student.jsp';</script>
<%                    
                    }catch(Exception e){
 %> <script>alert('Error Removing Student!');location='Student.jsp';</script><%
}
                    }%>

</div>

</body>

</html>