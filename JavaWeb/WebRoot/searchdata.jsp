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
  <%     
         String searchtext=request.getParameter("searchtext");
         if(searchtext!=null){
				String message_sql = "select * from upload where massagename like '%"+searchtext+"%' order by uploaddate DESC";
				ResultSet rs = stmt.executeQuery(message_sql);
				List<DataListBean> list = new ArrayList<DataListBean>();
						while (rs.next()) {
							DataListBean data = new DataListBean();
							data.setUsername(rs.getString("useid"));
							data.setDataname(rs.getString("massagename"));
							data.setDataintroduce(rs.getString("massageintroduce"));
							data.setDatapath(rs.getString("massagepath"));
							data.setDatatype(rs.getString("uploadtype"));
							data.setDatadate(rs.getTimestamp("uploaddate"));
							
							list.add(data);
							
						}
						session.setAttribute("datalist",list);
					
				try {
					response.sendRedirect("datalist2.jsp");
				} catch (Exception e) {
					out.print("请重试！");
				}
			 }else{out.print("输入不可为空");} 
			 
			%>
