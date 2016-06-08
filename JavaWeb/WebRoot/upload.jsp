<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="org.lxh.smart.*,java.util.*,java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<title>上传结果</title>
</head>

<body>
    <%  //连接数据库
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/text", "root", "kun161");
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
		smart.save("D:\\Web\\Server"); }//保存文件的路径
	%>

   <% //获取上传信息
       String massagename=smart.getRequest().getParameter("massagename");
       String massageintroduce=smart.getRequest().getParameter("massageintroduce");
       String uploadtype=smart.getRequest().getParameter("uploadtype");
       String massagepath=smart.getFiles().getFile(0).getFileName();
       String useid="ayniu";
    %>

	<%  //文件名保存到数据库
		String insertfile_sql = "INSERT INTO upload(useid,massagename,massageintroduce,uploadtype,massagepath)"
		+" VALUES ('"+useid+"','"+ massagename + "','" + massageintroduce + "','"+uploadtype+"','" + massagepath + "')";
			try {
				stmtul.executeUpdate(insertfile_sql);
				out.print("上传成功！");
			} catch (Exception e) {
				out.print("上传失败！");
			}
     
%>
    <center>
		<a href="upload.html">继续上传</a>
	</center>
</body>
</html>