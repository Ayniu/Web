<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
   <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
  <body>
   
   <% //连接数据库
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/text","root","admin"); %>
   <% Statement stmt = con.createStatement(); %>
   
   <% //判断是登录操作还是注册操作
      String registerorlogin;
      registerorlogin=request.getParameter("registerorlogin");
      if(registerorlogin.equals("register")){
       %>
   
   <% //定义html注册表单的数据
      String useid;
      String password;
      String email;
      String photopath="default.jpg";
    %>
    
    <% //接收html注册表单数据
       useid=request.getParameter("username");
       password=request.getParameter("password");
       email=request.getParameter("useremail");
     %>
   
   <% String insert_sql = "INSERT INTO user(useid,password,email,photopath) VALUES ('"+useid+"','" +password+"','"+email+"','"+photopath+"')"; 
      try{
         stmt.executeUpdate(insert_sql);
         session.setAttribute("tip_registersuccessful","successful");
  		 response.sendRedirect("login.jsp");
         }
      catch(Exception e){
         session.setAttribute("tip_registerdefeat","defeat");
  		 response.sendRedirect("register.jsp");
  		 }
        
     } else if(registerorlogin.equals("login")){
   
     //定义并接收登录html数据
     String loginname;
     String loginpassword;
     loginname=request.getParameter("loginname");
     loginpassword=request.getParameter("loginpassword");
     if(loginname!=""){%>
		<%	ResultSet rs=stmt.executeQuery("select * from user where useid='"+loginname+"'");
 		 if (rs.next()){
 		   String rs_password=rs.getString("password");
  		  if(loginpassword.equals(rs_password)){
  		 	   
               session.setAttribute("name",loginname);
               response.sendRedirect("zone.jsp");
  		  }else{
  		  
  		     session.setAttribute("tip_password","您输入的密码不正确，请重新输入！");
  		     response.sendRedirect("login.jsp");
 		  }
		  }else{
		     
		     session.setAttribute("tip_username","您输入的用户名不正确，请重新输入！");
  		     response.sendRedirect("login.jsp");
		}
		}
	}	
	%>
    

   <% if(stmt!=null)
     {
       stmt.close();
     }
     if(con!=null)
     {
       con.close();
     } 
    %>
  
  </body>
</html>
