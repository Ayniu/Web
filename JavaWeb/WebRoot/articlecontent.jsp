<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="Bean.*,com.jspsmart.upload.*,java.util.*,java.text.*,java.sql.*,java.security.*"%>
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
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title>文章内容</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="articlecontent.css">
	<link rel="shortcut icon" href="photo/myicon.ico" media="screen" />
	<style type="text/css">
		body {
		    background:#F2f2f2;
			/* background-image:url(photo/articlelist-bg.jpg); */
			background-repeat:no-repeat;
			background-attachment:fixed
		}
	</style>
</head>
<body>
	<head>
	<!--nav标签，导航栏-->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><b>学汇英语</b></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="datalist.jsp">资料汇</a></li>
					<li><a href="articlelist.jsp">文章汇</a></li>
					<li><a href="test.jsp">知识汇</a></li>
					<li><a href="message.jsp">留言板</a></li>
				</ul>
				
				<div class="aw-user-nav navbar-form navbar-right">
				<!-- 登陆&注册栏 -->
				<% String username=(String)session.getAttribute("name");%>
				<span>
				<%if(username==null){%>
				<a class="register btn btn-normal btn-success" href="register.jsp">注册</a>
				<a class="login btn btn-normal btn-primary" href="login.jsp">登录</a>
				<%}else{%>
				<% 
						String photopath="";
						String str="select * from user where useid='"+username+"'";
						ResultSet rs = null;
						rs=stmt.executeQuery(str);
						if(rs.next()){
							photopath = rs.getString("photopath");
						}
					%>
					<a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="photo/<%=photopath%>" alt="#" class="img-circle" height="32" width="32"><span class="caret"></span>
      				</a>
      				<ul class="dropdown-menu">
         				<li><a href="zone.jsp">个人中心</a></li>
         				<li class="divider"></li>
         				<li><a href="logout.jsp">退出</a></li>
				<%}%>
				</span>
				<!-- end 登陆&注册栏 -->
				</div>
			</div>
		</div>
	</nav>
	</head>
	
		<div class="container">
		<div class="row" id="#">
			<div class="col-sm-8">
				<div class="title">
				<%
					String title=request.getParameter("title"); 
					String time=request.getParameter("time"); 
					String type=request.getParameter("type"); 
					String article=request.getParameter("content");
					String img=request.getParameter("img");
					String author=request.getParameter("author");
				%>
					<h2><%=title%></h2>
					<p><font color="gray"><%=time%></font> 分组：<%=type %></p>
				</div>
				<div class="content">
					<p><%=article %></p>
				</div>
			</div>

			<div class="col-sm-offset-1 col-sm-3 side">
				<div>
					<img src="photo/<%=img%>" alt="用户头像" class="photo">
				</div>
				<div>
					<h4 class="writer">作者:<%=author%></h4>
				</div>
			</div>
		</div>
	</div>
	<!--页脚信息
	<footer>
		<div class="footer">
			<p>build by cjl-scau</p>
		</div>
	</footer>-->
</body>
</html>
<%
	stmt.close();
	con.close();
%>