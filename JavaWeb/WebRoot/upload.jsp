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
		smart.save("/file"); }//保存文件的路径
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
				out.print("上传成功！3秒后跳转到个人空间"); 
				%> <meta http-equiv="refresh" content="3; url=zone.jsp"> <%
			} catch (Exception e) {
				out.print("上传失败！介绍文字过多，请重试（3秒回退到个人空间）"); 
				%> <meta http-equiv="refresh" content="3; url=zone.jsp"> <%
			}
      %>
	
  </body>

</html>