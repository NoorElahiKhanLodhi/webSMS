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
    <title>Teachers Attendance</title>
    <link rel="stylesheet" href="css/TeacherAttendance.css">
</head>
<body>
   <a href="chooseAttendance.html">
        <input type="button" value="BACK" class="back">
    </a>
    <a href="index.html">
        <input type="button" value="LOGOUT" class="logout">
    </a>
    <a href="">
        <input type="button" value="CLEAR" class="clear">
    </a>
    <h1 class="heading">TEACHERS ATTENDANCE</h1>
    <div class="mark">
        <h2 style="text-align: center;">MARK ATTENDANCE</h2>
        <form method="post" action="TeacherAttendance.jsp">
        <select name="teacherid">
            <option>Select Teacher</option>
        
        <%
                    try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                                        Statement s = c.createStatement();
                                        ResultSet r = 
                                s.executeQuery("select * from teachinfo");
                                while(r.next()){
                                String name = r.getString(2);
                                String id = r.getString(1);
                                String teacher = "["+id+"]"+name;
                    %>  <option value="<%=id%>"><%=teacher%></option>
                    <%
                    }
                    c.close();
                    s.close();
                }catch(Exception e){out.println("<script>");
                            out.println("alert('DB Connect Error 1!');");
                            out.println("location='TeacherAttendance.jsp'DB Error;");
                            out.println("</script>");}
                    %>        
        </select>
        <input name="date" type="date">
        <input name="time" type="time">
                <button type="submit" name="b1">Mark Attendance</button>
        </form>
    
        <%
String id = request.getParameter("teacherid");
String date = request.getParameter("date");
String time = request.getParameter("time");
String stat = "p";
if(request.getParameter("b1")!=null){
try{
    Class.forName("com.mysql.jdbc.Driver");
           Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
Statement s = c.createStatement();
        s.executeUpdate("insert into teachattend(id,date,time,status)values('"+id+"','"+date+"','"+time+"','"+stat+"')");
        out.println("<script>");
            out.println("alert('Attendance Marked!');");
            out.println("location='TeacherAttendance.jsp';");
            out.println("</script>");
}catch(      ClassNotFoundException | SQLException e)
        {        out.println("<script>");
            out.println("alert('Error Marking Attendance!');");
            out.println("location='TeacherAttendance.jsp';");
            out.println("</script>");        }
        }
        %>
            </div>
        
        
        
        
        
        
        
        
        
    <div class="pview">
        <h2 style="text-align: center;">VIEW PERSONAL ATTENDANCE</h2>
        <form method="post" action="TeacherAttendance.jsp">
        <select name="teacherid0">
            <option>Select Teacher</option>
             <%
                    HashMap<String, String> teach = new HashMap<String, String>();
                    try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                                        Statement s = c.createStatement();
                                        ResultSet r = 
                                s.executeQuery("select * from teachinfo");
                                while(r.next()){
                                String name = r.getString(2);
                                String id0 = r.getString(1);
                                teach.put(id0, name);
                                String teacher = "["+id0+"]"+name;
                    %>  <option value="<%=id0%>"><%=teacher%></option>
                    <%
                    }
                request.setAttribute("list",teach);
                    c.close();
                    s.close();
                }catch(Exception e){out.println("<script>");
                            out.println("alert('DB Connect Error 1!');");
                            out.println("location='TeacherAttendance.jsp'DB Error;");
                            out.println("</script>");}
                    %>
        </select>
   
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
</select>
        <button type="submit" name="b2">VIEW</button>
        </form> 

        
 <%
            int daysPresent = 0;
                if(request.getParameter("b2") != null){
    
        %>
        <h1><%=request.getParameter("teacherid0")%></h1>
<h1><%=request.getParameter("month")%></h1>
        <table>
            <th>DATE</th>
            <th>STATUS</th>
                <%            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                    Statement s = c.createStatement();
            ResultSet r = 
            s.executeQuery("select date,status from teachattend where id = '"+request.getParameter("teacherid0")+"' and month(date) ="+request.getParameter("month")+"");
        
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
}catch(Exception e){
out.println("<script>");
                            out.println("alert('DB Connect Error 2!');");
                            out.println("location='TeacherAttendance.jsp'DB Error;");
                            out.println("</script>");
}
}%>

    </div>
            
            
            
    <div class="view">
        <h2 style="text-align: center;">VIEW OVERALL ATTENDANCE</h2>
        
        <form method="post" action="TeacherAttendance.jsp">
             <select class="month" name="month0">
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
</select>
            <button type="submit" name="b3">VIEW</button>
        </form>
        <%
         if(request.getParameter("b3")!=null){  
         
         try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                                        Statement s = c.createStatement();
                                        ResultSet r = 
                                s.executeQuery("select * from teachinfo");
                                while(r.next()){
                                String name = r.getString(2);
                                String id0 = r.getString(1);
                                teach.put(id0, name);
                    }
                    c.close();
                    s.close();
                }catch(Exception e){out.println("<script>");
                            out.println("alert('DB Connect Error 3!');");
                            out.println("location='TeacherAttendance.jsp'DB Error;");
                            out.println("</script>");}
         
         
         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        Statement st = c.createStatement();
                        ResultSet r;
                        r = s.executeQuery("SELECT id FROM schooldb.teachinfo");
            %>
            <table class="myTable">
                <th>T ID</th><th>Name</th><th>Present Days</th><th>Total Days</th><th>Percentage</th>
                    <%
                        while(r.next()){
                        String id1 = r.getString(1);
                    ResultSet rs = st.executeQuery("SELECT distinct id,"
+"(select count(*) from schooldb.teachattend where id= '"+id1+"' and status = 'p'), "
+"(select count(*) from schooldb.teachattend where id = '"+id1+"')"
+"FROM schooldb.teachattend where id = '"+id1+"'");
            
    int i=0,j=0,k=0;
    while(rs.next()){
    i++;j++;k++;
    String ids = rs.getString(1);
    int pre = Integer.parseInt(rs.getString(2));
    int tot = Integer.parseInt(rs.getString(3));
                    %>
                <tr>
                <td><%=ids%></td>
                <td><%=teach.get(ids)%></td>
                <td><%=pre%></td>
                <td><%=tot%></td>
                <td><%=(float)((float)(pre)/tot)*100%></td>
                </tr>
                <%
                }              
                    }
                %></table><br><br>
                <%
                            c.close();
                            s.close();
                    }catch(Exception e){out.println("<script>");
        out.println("alert('DB Connect Error 6!');");
        out.println("location='TeacherAttendance.jsp';");
        out.println("</script>");}
            }
        %>
        <table>
            <th>T ID</th><th>Name</th><th>Present Days</th><th>Total Days</th><th>Percentage</th>
            <tr></tr>
        </table>
    </div>
    
</body></html>