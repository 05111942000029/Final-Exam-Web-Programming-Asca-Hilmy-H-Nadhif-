<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 
<%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String comedians = request.getParameter("comedian");
        String joke = request.getParameter("joke");
        String punchline = request.getParameter("punchline");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/jokess","root","");
        pst = con.prepareStatement("update records set comedians = ?,joke =?,punchline= ? where id = ?");
        pst.setString(1, comedians);
        pst.setString(2, joke);
        pst.setString(3, punchline);
         pst.setString(4, id);
        pst.executeUpdate();  
        
        %>
        
        <script>  
            alert("Record Updated");          
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
        <h1>Comedian and Jokes Update</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/jokess","root","");
                          
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from records where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Comedian Name</label>
                        <input type="text" class="form-control" placeholder="Comedian Name" value="<%= rs.getString("comedians")%>" name="comedian" id="comedian" required >
                     </div>
                        
                    <div alight="left">
                        <label class="form-label">Jokes</label>
                        <input type="text" class="form-control" placeholder="Insert your joke here" name="joke" value="<%= rs.getString("joke")%>" id="joke" required >
                     </div>
                        
                     <div alight="left">
                        <label class="form-label">Punchline</label>
                        <input type="text" class="form-control" placeholder="Insert your punchline " name="punchline" id="punchline" value="<%= rs.getString("punchline")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                        
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                        
                         <div align="right">
                            
                             <p><a href="index.jsp">Click Back</a></p>
                            
                            
                         </div>
  
                </form>
            </div>          
        </div>
  
    </body>
</html>