<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
        String comedians = request.getParameter("comedian");
        String joke = request.getParameter("joke");
        String punchline = request.getParameter("punchline");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/jokess","root","");
        pst = con.prepareStatement("insert into records(stcomedians,joke,punchline)values(?,?,?)");
        pst.setString(1, comedians);
        pst.setString(2, joke);
        pst.setString(3, punchline);
        pst.executeUpdate();  
        
        %>
    <script>  
        alert("Record Added");    
    </script>
    <%            
    }
   %>
 
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Jokes Webpage-JSP</h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <div alight="left">
                        <label class="form-label">Comedian Name</label>
                        <input type="text" class="form-control" placeholder="Insert your comedian name here" comedians="comedian" id="comedian" required >
                     </div>
                        
                    <div alight="left">
                        <label class="form-label">Jokes</label>
                        <input type="text" class="form-control" placeholder="Insert your joke here" comedians="joke" id="joke" required >
                     </div>
                        
                     <div alight="left">
                        <label class="form-label">Punchline</label>
                        <input type="text" class="form-control" placeholder="Insert your punchline here" comedians="punchline" id="punchline" required >
                     </div>
                         </br>
                        
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" comedians="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" comedians="reset" class="btn btn-warning">
                     </div>  
                        
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-comedy" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Comedian</th>
                                    <th>Jokes</th>
                                    <th>The Punchline</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/jokess","root","");
                                
                                  String query = "select * from records";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr>
                                 <td><%=rs.getString("comedians") %></td>
                                 <td><%=rs.getString("joke") %></td>
                                 <td><%=rs.getString("punchline") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr>
                            
                            
                                <%
                                
                                 }
                               %>
                            
                     </table>    
                 </div>
 
            </div>  
        </div>
 
    </body>
</html>