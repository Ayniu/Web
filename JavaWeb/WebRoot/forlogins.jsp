<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
  
  <body>
   
   <% //连接数据库
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/text","root","kun161"); %>
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
         out.print("注册成功！3秒后跳转到登录界面"); }
      catch(Exception e){
         out.print("注册失败！3秒后跳转到登录界面");}
         %>
     <meta http-equiv="refresh" content="3; url=login.html">
    <%  
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
  		 	   out.print("登录成功！\n");
               session.setAttribute("name",loginname);
               response.sendRedirect("zone.jsp");
  		  }else{
 		   out.print("您输入的密码不正确，请重新输入！");
 		  }
		  }else{
		out.print("您输入的用户名不正确，请重新输入！");
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
