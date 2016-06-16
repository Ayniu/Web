<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="Bean.*,com.jspsmart.upload.*,java.util.*,java.sql.*,java.text.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  //连接数据库
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/text", "root", "admin");
	    Statement stmt = con.createStatement();
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
  <%       String dataname;
           dataname=request.getParameter("dataname");
           String username=(String)session.getAttribute("name");
				String delete_sql = "delete from upload where useid='"+username+"' and massagename='"+dataname+"'";
				ResultSet rs;
				stmt.executeUpdate(delete_sql); 
				
				try {
					response.sendRedirect("datalistfindmine.jsp");
				} catch (Exception e) {
					out.print("请重试！");
				}
			 
         
     	stmt.close();
     	con.close();
    
			%>
