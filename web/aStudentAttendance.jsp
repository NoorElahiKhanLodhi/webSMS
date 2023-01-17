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
        <title>Student Attendace</title>
        <link rel="stylesheet" href="css/aStudentAttendance.css">
    </head>
    <body>
        <a href="chooseAttendance.html">
            <input type="button" value="BACK" class="back">
        </a>
        <a href="index.html">
            <input type="button" value="LOGOUT" class="logout">
        </a>
        <h1 class="heading">STUDENT ATTENDANCE</h1>
        <a href=""><button class="clear">CLEAR ALL</button></a>
        <br><br>
        <div class="take">
            <%
    ArrayList<String> rolls = new ArrayList<String>();
            %>

            <h2 style="text-align: center;">TAKE ATTENDANCE</h2>
            <br>
            <form action="aStudentAttendance.jsp" method="post">
                <select name="cls" id="dis">
                    <option value="">Select Class</option>
                    <%
            try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                            Statement s = c.createStatement();
                            ResultSet r = s.executeQuery("select * from class");
                            while(r.next()){
                            String cs = r.getString(1)+"->"+r.getString(2);
                    %>               
                    <option value="<%=r.getString(1)%>"><%=cs%></option>
                    <%    }     
            c.close();
            s.close();
        }catch(Exception e){out.println("<script>");
                    out.println("alert('DB Connect Error 1!');");
                    out.println("location='aStudentAttendance.jsp';");
                    out.println("</script>");}%>
                </select>
                <br>
                <button type="submit" name="b1" id="dis0">Fetch</button>
                <br><br>
            </form>


            <%
            if(request.getParameter("b1")!=null){
            String cls = request.getParameter("cls");
                
            %>
            <form method="post" action="aStudentAttendance.jsp">
                <table class="atd">
                    <th>Roll no</th>
                    <th>Name</th>
                    <th>Status</th>
                        <%  
                    
                      try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                                        Statement s = c.createStatement();
                                        ResultSet r =s.executeQuery("select roll, name from stuinfo where cid = '"+cls+"'");
                                while(r.next()){
                                String roll = r.getString(1);
                                rolls.add(roll);
                        %>
                    <tr>
                        <td><%=roll%></td>
                        <td><%=r.getString(2)%></td>
                        <td><select name="<%=roll%>" id="attendace">
                                <option value="p">Present</option>
                                <option value="a">Absent</option>
                            </select>
                        </td>
                    </tr>
                    <%
                        } 
                }catch(Exception e){out.println("<script>");
                            out.println("alert('DB connect Error 2!');");
                            out.println("location='aStudentAttendance.jsp';");
                            out.println("</script>");}
                    %> 
                </table>
                <br><br><br>
                <button type="submit" name="bx" >Save And Continue</button>
            </form>
            <%
session.setAttribute("rolls",rolls);
                }                    
             
if(request.getParameter("bx") != null){
rolls = (ArrayList) session.getAttribute("rolls");
LocalDate date = java.time.LocalDate.now();

try{  
                Class.forName("com.mysql.jdbc.Driver");
                       Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
            Statement s = c.createStatement();
                
             for (String r : rolls) {                     
s.executeUpdate("insert into stuattend(roll,date,status)values('"+r+"','"+date+"','"+request.getParameter(r)+"')"); 
             }       
            %> <script>alert('Attendance Marked!');location = 'aStudentAttendance.jsp';</script>
            <%                   
                                            }catch(Exception e){
            %> <script>alert('Error Marking Attendance, May Have Already Been Marked!');location = 'aStudentAttendance.jsp';</script><%         

            }

            }

            %>
        </div>

        <div class="view">
            <%HashMap<String, String> rol = new HashMap<String, String>();%>
            <h2 style="text-align:center;">VIEW STUDENT PERSONAL ATTENDANCE</h2>
            <br>

            <form action="aStudentAttendance.jsp" method="post">
                <select name="cls" id="dis">
                    <option value="">Select Class</option>
                    <%
            try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                            Statement s = c.createStatement();
                            ResultSet r = s.executeQuery("select * from class");
                            while(r.next()){
                            String cs = r.getString(1)+"->"+r.getString(2);
                    %>               
                    <option value="<%=r.getString(1)%>"><%=cs%></option>
                    <%    }     
            c.close();
            s.close();
        }catch(Exception e){out.println("<script>");
                    out.println("alert('DB Connect Error 1!');");
                    out.println("location='aStudentAttendance.jsp';");
                    out.println("</script>");}%>
                </select>
                <br>
                <button type="submit" name="x" id="dis0">View</button>
            </form>
            <form action="aStudentAttendance.jsp" method="post">
                <%     if(request.getParameter("x") != null){
                %>
                <script>document.getElementById("dis").hidden = true;
                    document.getElementById("dis0").hidden = true;
                </script>
                <select name="stu"><option value="0">Select Student</option>
                    <%
                                       try{
                     Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                         Statement s = c.createStatement();
                         ResultSet r = s.executeQuery("select * from stuinfo where cid = '"+request.getParameter("cls")+"'");
                         while(r.next()){
                         String rn = r.getString(1);
                         String n = r.getString(2);
                         String cs = rn+"->"+n;
                         rol.put(rn,n);
                         session.setAttribute("stdrn",rol);
                    %>               
                    <option value="<%=r.getString(1)%>"><%=cs%></option>
                    <%    } %></select><%    
            c.close();
            s.close();
        }catch(Exception e){out.println("<script>");
                    out.println("alert('DB Connect Error 1!');");
                    out.println("location='aStudentAttendance.jsp';");
                    out.println("</script>");}                %>


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
                <br>
                <button type="submit" name="f">View</button>
            </form>
            <br><br>
            <%
                }
           int daysPresent = 0;
           int days = 0;
               if(request.getParameter("f") != null){
            %>
            <script>document.getElementById("dis").hidden = true;
                document.getElementById("dis0").hidden = true;
            </script>
            <table>
                <%
                    rol = (HashMap) session.getAttribute("stdrn");
                    String rn=request.getParameter("stu");
                    String display = "("+request.getParameter("stu")+")" + rol.get(request.getParameter("stu"));
                %>
                <label><%=display%></label>
                <th>DATE</th>
                <th>STATUS</th>
                    <%            try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                        Statement s = c.createStatement();
                ResultSet r = 
                s.executeQuery("select date,status from stuattend where roll = '"+request.getParameter("stu")+"' and month(date) ="+request.getParameter("month")+"");
                        while(r.next()){
                        days++;
                        String stat = r.getString("status");
                        if(stat.equals("p")){daysPresent++;}
                    %><tr>
                    <td><%=r.getDate("date")%></td>
                    <td><%=stat%></td>
                </tr><%
                %><%
                 }
                %></table><%
            %><br><label class="per">PERCENTAGE : <%=((float)daysPresent/(float)days)*100%></label><%
    }catch(Exception e){out.println("<script>");
                out.println("alert('DB Connect Error 3!');");
                out.println("location='aStudentAttendance.jsp';");
                out.println("</script>");}
    }%>
       <br>
        </div>  
        <br><br>
        <div class="cview">
            <h2 style="">VIEW CLASS COMBINED ATTENDANCE</h2>
            <br>
            <form action="aStudentAttendance.jsp" method="post">

                <select name="cls" id="dis">
                    <option value="">Select Class</option>
                    <%
            try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                            Statement s = c.createStatement();
                            ResultSet r = s.executeQuery("select * from class");
                            while(r.next()){
                            String cs = r.getString(1)+"->"+r.getString(2);
                    %>               
                    <option value="<%=r.getString(1)%>"><%=cs%></option>
                    <%    }     
            c.close();
            s.close();
        }catch(Exception e){out.println("<script>");
                    out.println("alert('DB Connect Error 4!');");
                    out.println("location='aStudentAttendance.jsp';");
                    out.println("</script>");}%>
                </select>
                <br>

                <button type="submit" name="b">VIEW</button>
                <br><br>
            </form>
            <%
            if(request.getParameter("b")!=null){                                      
               try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                Statement s = c.createStatement();
                ResultSet r = s.executeQuery("select * from stuinfo where cid = '"+request.getParameter("cls")+"'");
                while(r.next()){
                String rn = r.getString(1);
                String n = r.getString(2);
                rol.put(rn,n);
                }
                c.close();
s.close();
}catch(Exception e){out.println("<script>");
        out.println("alert('DB Connect Error 5!');");
        out.println("location='aStudentAttendance.jsp';");
        out.println("</script>");}
                   
            
               try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        Statement st = c.createStatement();
                        ResultSet r;
                        r = s.executeQuery("SELECT roll FROM schooldb.stuinfo where cid='"+request.getParameter("cls")+"'");
            %>
            <table class="myTable">
                <th>Rollno</th><th>Name</th><th>Present Days</th><th>Total Days</th><th>Percentage</th>
                    <%
                        while(r.next()){
                        String rollno = r.getString(1);
                    ResultSet rs = st.executeQuery("SELECT distinct roll,"
+"(select count(*) from schooldb.stuattend where roll = '"+rollno+"' and status = 'p'), "
+"(select count(*) from schooldb.stuattend where roll = '"+rollno+"')"
+"FROM schooldb.stuattend where roll = '"+rollno+"'");
            
    int i=0,j=0,k=0;
    while(rs.next()){
    i++;j++;k++;
    String rno = rs.getString(1);
    int pre = Integer.parseInt(rs.getString(2));
    int tot = Integer.parseInt(rs.getString(3));
                    %>
                <tr>
                <td><%=rno%></td>
                <td><%=rol.get(rno)%></td>
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
        out.println("location='aStudentAttendance.jsp';");
        out.println("</script>");}                    }
                %>

        </div>


    </body>
</html>