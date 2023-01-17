<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*" import="java.util.*"
        import="com.TransportPortal.MyFunctions.*"
        import="java.time.*"%>
<%String cls = session.getAttribute("myclass").toString();
String cid = session.getAttribute("mycid").toString();
%>
<%
    HashMap<String, String> std = new HashMap<String, String>();
    String sc = "";
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StudentMarks</title>
        <link rel="stylesheet" href="css/StudentMarks.css">
    </head>

    <body>
        <a href="TeacherDashboard.jsp">
            <input type="button" value="BACK" class="back">
        </a>
        <a href="index.html">
            <input type="button" value="LOGOUT" class="logout">
        </a>
        <br>
        <br>
        <h1 class="heading">STUDENT MARKS</h1>
        <div class="add">
            <h1>ADD / EDIT MARKS</h1>
            <form method="post" action="StudentMarks.jsp" id="f">
                <select name="cls" id="clas" onchange="myFunction()">
                    <option value="">Select Class</option>
                    <%
           try{
                       Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                           Statement s = c.createStatement();
                           ResultSet r = s.executeQuery("SELECT subinfo.cid, class.class, subinfo.tid FROM subinfo INNER JOIN class ON subinfo.cid=class.cid and subinfo.tid = '"+session.getAttribute("teachId")+"'");
                           while(r.next()){
                           String cs = "["+r.getString(1)+"] Class : "+r.getString(2);
                    %>               
                    <option value="<%=r.getString(1)%>"><%=cs%></option>
                    <%    }     
            c.close();
            s.close();
        }catch(Exception e){out.println("<script>");
                    out.println("alert('DB Connect Error 1!');");
                    out.println("location='StudentMarks.jsp'DB Error;");
                    out.println("</script>");}%>
                </select>
                <button type="submit" name="b1" class="b1">Done</button>
            </form>


            <%
            if(request.getParameter("b1")!=null){
            %>

            <script>document.getElementById("f").hidden = true;
            </script>

            <form action="StudentMarks.jsp" method="post">
                <select name="Subject" id="sub">
                    <option value="">Select Subject</option>

                    <%
                    try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                                        Statement s = c.createStatement();
                    sc = request.getParameter("cls");

                                session.setAttribute("select",sc);
                                        ResultSet r = s.executeQuery("SELECT * FROM subinfo where tid = '"+session.getAttribute("teachId")
                                        +"' and cid = '"+sc+"'");
                                        while(r.next()){
                                        String sub = r.getString(1);
                    %>               
                    <option value="<%=sub%>"><%=sub%></option>
                    <%    }     
            c.close();
            s.close();
        }catch(Exception e){out.println("<script>");
                    out.println("alert('DB Connect Error 1!');");
                    out.println("location='StudentAttendence.jsp'DB Error;");
                    out.println("</script>");}
                    %>
                </select>

                <select name="Student" id="student">
                    <option value="">Select Student</option>
                    <%
                    try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                                        Statement s = c.createStatement();
                                        ResultSet r = 
                                s.executeQuery("select * from stuinfo where cid = '"+request.getParameter("cls")+"'");
                                while(r.next()){
                                String name = r.getString(2);
                                String roll = r.getString(1);
                                std.put(roll, name);
                                String stud = "["+roll+"]"+name;
                    %>  <option value="<%=roll%>"><%=stud%></option>
                    <%
                    }
                session.setAttribute("list",std);
                    c.close();
                    s.close();
                }catch(Exception e){out.println("<script>");
                            out.println("alert('DB Connect Error 1!');");
                            out.println("location='StudentAttendence.jsp'DB Error;");
                            out.println("</script>");}
                    %>
                </select>
                <button type="submit" name="b2" class="b2">Done</button>
            </form>
            <% 
            }
            if(request.getParameter("b2")!=null){
            String r =request.getParameter("Student");
            session.setAttribute("rn",r);
            String sub = request.getParameter("Subject");
            session.setAttribute("subjects",sub);
            std=(HashMap<String, String>)session.getAttribute("list");
            %>
            <script>document.getElementById("f").hidden = true;
            </script>
            <table>
                <tr>
                    <th>Roll No : </th>
                    <td><%=r%></td>
                </tr>
                <tr>
                    <th>Name : </th>
                    <td><%=std.get(r)%></td>
                </tr>
                <tr>
                    <th>Class : </th>
                    <td><%=session.getAttribute("select")%></td>
                </tr>
                <tr>
                    <th>Subject : </th>
                    <td><%=sub%></td>
                </tr>
                <tr>
                    <th>Teacher : </th>
                        <%String t = "("+session.getAttribute("teachId")+")"+" "+session.getAttribute("teachName");%>
                    <td><%=t%></td>
                </tr>
            </table>
            <br>

            <form method="post" action="StudentMarks.jsp">
                <table>
                    <th>-</th>
                    <th>Test 1</th>
                    <th>Mid</th>
                    <th>Test 2</th>
                    <th>Final</th>
                    <tr>
                        <th>Obtained</th>
                        <td><input type="number" name="t1o" id="t1o" value="0"></td>
                        <td><input type="number" name="mo" id="mo" value="0"></td>
                        <td><input type="number" name="t2o" id="t2o" value="0"></td>
                        <td><input type="number" name="fo" id="fo" value="0"></td>
                    </tr>
                    <tr>
                        <th>Total</th>
                        <td><input type="number" name="t1t" id="t1t" value="0"></td>
                        <td><input type="number" name="mt" id="mt" value="0"></td>
                        <td><input type="number" name="t2t" id="t2t" value="0"></td>
                        <td><input type="number" name="ft" id="ft" value="0"></td>
                    </tr>
                </table>

                <label for="obtained">Obtained :</label>
                <input type="text" name="obtained" id="obtained" value="0"><br>


                <label for="total">Total :</label>
                <input type="text" name="total" id="total" value="0"><br>

                <input type="Submit" name="b3" value="Add / Edit" class="b3">
            </form>

            <script>
                document.getElementById("t1o").onchange = function () {
                    myFunction()
                };
                document.getElementById("mo").onchange = function () {
                    myFunction()
                };
                document.getElementById("t2o").onchange = function () {
                    myFunction()
                };
                document.getElementById("fo").onchange = function () {
                    myFunction()
                };
                document.getElementById("t1t").onchange = function () {
                    myFunction()
                };
                document.getElementById("mt").onchange = function () {
                    myFunction()
                };
                document.getElementById("t2t").onchange = function () {
                    myFunction()
                };
                document.getElementById("ft").onchange = function () {
                    myFunction()
                };
                function myFunction() {
                    let o1 = parseInt(document.getElementById("t1o").value);
                    let  o2 = parseInt(document.getElementById("mo").value);
                    let  o3 = parseInt(document.getElementById("t2o").value);
                    let  o4 = parseInt(document.getElementById("fo").value);
                    let  t1 = parseInt(document.getElementById("t1t").value);
                    let  t2 = parseInt(document.getElementById("mt").value);
                    let  t3 = parseInt(document.getElementById("t2t").value);
                    let  t4 = parseInt(document.getElementById("ft").value);
                    let  o = o1 + o2 + o3 + o4;
                    let  t = t1 + t2 + t3 + t4;
                    document.getElementById("obtained").value = o;
                    document.getElementById("total").value = t;
                }
            </script>            


            <% 
                }
if(request.getParameter("b3")!=null){

try{
        int ot1 = Integer.parseInt(request.getParameter("t1o"));
        int om = Integer.parseInt(request.getParameter("mo"));
        int ot2 = Integer.parseInt(request.getParameter("t2o"));
        int of = Integer.parseInt(request.getParameter("fo"));
        int tt1 = Integer.parseInt(request.getParameter("t1t"));
        int tm = Integer.parseInt(request.getParameter("mt"));
        int tt2 = Integer.parseInt(request.getParameter("t2t"));
        int tf = Integer.parseInt(request.getParameter("ft"));
        String subject = (session.getAttribute("subjects")).toString();
        String rollno = (session.getAttribute("rn")).toString();

Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                    Statement s = c.createStatement();
s.executeUpdate("insert into stumarks(roll,subject,type,obtained,total)"
+ "values('"+rollno+"','"+subject+"','"+"Test1"+"','"+ot1+"','"+tt1+"')");
s.executeUpdate("insert into stumarks(roll,subject,type,obtained,total)"
+ "values('"+rollno+"','"+subject+"','"+"MID"+"','"+om+"','"+tm+"')");
s.executeUpdate("insert into stumarks(roll,subject,type,obtained,total)"
+ "values('"+rollno+"','"+subject+"','"+"Test2"+"','"+ot2+"','"+tt2+"')");
s.executeUpdate("insert into stumarks(roll,subject,type,obtained,total)"
+ "values('"+rollno+"','"+subject+"','"+"FINAL"+"','"+of+"','"+tf+"')");
                    
            %> <script>alert('Marks Added!');
                location = 'StudentMarks.jsp';</script><%
}catch(Exception e){
                %> <script>
                    alert('Error Adding Marks, May Have Already Been Marked!');
                    location = 'StudentMarks.jsp';
            </script><%
                    }   }        %>
        
    </div>


    <div class="view">
        <h1>YOUR CLASS REPORT</h1>
        
        <a href="">
            <input type="button" value="Clear" class="c">
        </a>
        <a href="">
            <input type="button" value="Generate Report" class="g">
        </a>
        <br>

        <form method="post" action="StudentMarks.jsp">
            <input type="submit" name="b4" class="v" value="View">
            <br>
            <label class="cls">Class : <%=cls%> {<%=cid%>}
            </label>
            <br>
            <select name="std" id="students">
                <option value="">Select Student</option>
                <%

    try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
        
                        Statement s = c.createStatement();
                        ResultSet r = 
                s.executeQuery("select * from stuinfo where cid = '"+cid+"'");
                while(r.next()){
                String name = r.getString(2);
                String roll = r.getString(1);
                std.put(roll, name);
                String stud = "["+roll+"]"+name;
                %>  <option value="<%=roll%>"><%=stud%></option>
                <%
                }
            session.setAttribute("list",std);
                c.close();
                s.close();
            }catch(Exception e){out.println("<script>");
                        out.println("alert('DB Connect Error 1!');");
                        out.println("location='StudentAttendence.jsp'DB Error;");
                        out.println("</script>");}

                %>
        <%
if(request.getParameter("b4")!=null){
if(request.getParameter("std")==""){
            out.println("<script>");
            out.println("alert('Please select a student!');");
            out.println("location='StudentMarks.jsp';");
            out.println("</script>");
            }else{
String rno = request.getParameter("std").toString();
        %>
    </select>


    <table>
        <tr>
            <th>Roll No : </th>
            <td><%=rno%></td>
        </tr>
        <tr>
            <th>Name : </th>
            <td><%=std.get(rno)%></td>
        </tr>
    </table>
    <table style="font-size: small;" class="vt">
        <th rowspan="2">Subject</th>
            <%    
    ArrayList<String> types = new ArrayList<String>();
    ArrayList<String> subjects = new ArrayList<String>();
     try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb?useSSL=false","root","");
                        Statement s = c.createStatement();
                        ResultSet r = s.executeQuery("select distinct type from stumarks");
                         while(r.next()){
                String type = r.getString(1);
                types.add(type);
            %>        <th colspan="2"><%=type%></th>            <%
                }

            %><tr><%
    for(String i : types){
            %>      <th>O</th>
            <th>T</th>
            <% } %></tr><%
r = s.executeQuery("select distinct subject from stumarks where roll = '"+rno+"' order by type desc");
while(r.next()){
String subject = r.getString(1);
            subjects.add(subject);
}

for(String i : subjects){                
r = s.executeQuery("select obtained,total from stumarks where roll = '"+rno+"' and subject = '"+i+"'");
            %><tr>
            <td><%=i%></td><%
while(r.next()){
            %><td><%=r.getInt("obtained")%></td>
            <td><%=r.getInt("total")%></td><%
                }
            %></tr><%
                }



c.close();
    s.close();
}catch(Exception e){out.println("<script>");
            out.println("alert('DB Connect Error 1!');");
            out.println("location='StudentMarks.jsp';");
            out.println("</script>");}
            %>

    </table>
    <br>
    <%
        }}
    %>
</form></div>

</body>

</html>