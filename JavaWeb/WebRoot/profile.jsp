<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*,java.util.*,java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<title>修改结果</title>
</head>

<body>
    <%  //连接数据库
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/text", "root", "admin");
	    Statement stmtul = con.createStatement();
	%>

	<%
		SmartUpload smart = new SmartUpload();
		smart.initialize(pageContext);
		smart.upload();
		String s = smart.getFiles().getFile(0).getFileName();
		System.out.print(s);
		if (s.substring(s.length() - 3).equals("jpg")
				| s.substring(s.length() - 3).equals("png")
				| s.substring(s.length() - 4).equals("jpeg")) {
		smart.save("/photo"); //保存文件的路径
	%>

   <% //获取上传信息
       String username=(String)session.getAttribute("name");
       String photopath=smart.getFiles().getFile(0).getFileName();
       String password=smart.getRequest().getParameter("password");
       String email=smart.getRequest().getParameter("email");
    %>

	<%  //文件名保存到数据库
		String sql ="update user set password='"+password+"',photopath='"+photopath+"',email='"+email+"' where useid='"+username+"'";
			try {
				stmtul.executeUpdate(sql);
				session.setAttribute("tip_profilesuccessful", "successful");
		        response.sendRedirect("zone.jsp");
			} catch (Exception e) {
				
				session.setAttribute("tip_profiledefeat", "defeat");
		        response.sendRedirect("zone.jsp");
			}
	
			stmtul.close();
			}else{
			    session.setAttribute("tip_profileerror", "error");
			    response.sendRedirect("zone.jsp");
			}
			con.close();
		
%>
</body>
</html>