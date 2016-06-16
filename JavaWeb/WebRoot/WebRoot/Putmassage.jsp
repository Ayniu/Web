<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="Bean.*,com.jspsmart.upload.*,java.util.*,java.sql.*"%>
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
     <% String username=(String)session.getAttribute("name");%>
     <!-- 保存留言，插入留言数据 -->
			<%
			   if(username!=null){
				String context = request.getParameter("Context");
				String insert_sql = "INSERT INTO note(useid,context,date1) VALUES ('"
						+ username
						+ "','"
						+ context
						+ "',"
						+ "now())";
				try {
					stmt.executeUpdate(insert_sql);
					response.sendRedirect("message.jsp");
				} catch (Exception e) {
					out.print("留言失败！请重试！");
				}
				
				stmt.close();
				con.close();
			   }else{
				   session.setAttribute("tip_mlogin","successful");
				   response.sendRedirect("message.jsp");
			   }
			%>
  


  </body>
</html>
