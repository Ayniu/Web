<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% //连接数据库
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/text","root","admin"); %>
   <% Statement stmt = con.createStatement(); %>
<% 
	String username=(String)session.getAttribute("name");
	String title=request.getParameter("title");
	String article = request.getParameter("content1") != null ? request.getParameter("content1") : "";
	String type=request.getParameter("type");
%>

<%
	if(username!=null){
	String sql1="insert into article(useid,title,article,type,time) values ('"+username+"','" +title+"','"+article+"','"+type+"',now())";
	try {
			stmt.executeUpdate(sql1);
			session.setAttribute("tip_articlesuccessful","successful！");
			response.sendRedirect("articlelist.jsp"); 
				
		} catch (Exception e) {
			session.setAttribute("tip_articledefeat","defeat！");
			response.sendRedirect("writearticle.jsp");
		}

	stmt.close();
	con.close();
	}else{
		session.setAttribute("tip_alogin","successful");
		response.sendRedirect("articlelist.jsp");
	}
%>