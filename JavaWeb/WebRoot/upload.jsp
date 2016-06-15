<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="com.jspsmart.upload.*,java.util.*,java.sql.*" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

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
		if (s.substring(s.length() - 3).equals("rar")
				| s.substring(s.length() - 3).equals("zip")) {
		smart.save("/file"); //保存文件的路径
	%>

   <% //获取上传信息
       String massagename=smart.getRequest().getParameter("massagename");
       String massageintroduce=smart.getRequest().getParameter("massageintroduce");
       String uploadtype=smart.getRequest().getParameter("uploadtype");
       String massagepath=smart.getFiles().getFile(0).getFileName();
       String username=(String)session.getAttribute("name");
       
    %>

	<%  //文件名保存到数据库
		String insertfile_sql = "INSERT INTO upload(useid,massagename,massageintroduce,uploadtype,massagepath,uploaddate)"
		+" VALUES ('"+username+"','"+ massagename + "','" + massageintroduce + "','"+uploadtype+"','" + massagepath +"'," +"now())";
			try {
				stmtul.executeUpdate(insertfile_sql);
				session.setAttribute("tip_uploadsuccess", "successful");
		        response.sendRedirect("zone.jsp");
		    } catch (Exception e) {
				session.setAttribute("tip_uploaddefeat", "defeat");
			    response.sendRedirect("zone.jsp");
			}
			stmtul.close();
			}else{
			    session.setAttribute("tip_uploaderror", "error");
			    response.sendRedirect("zone.jsp");
			}
			con.close();
	
      %>