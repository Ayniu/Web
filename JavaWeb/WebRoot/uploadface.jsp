<%@ page contentType="text/html;"%>
<%@ page language="java" import="com.jspsmart.upload.*,java.util.*,java.sql.*" pageEncoding="utf-8"%>
<% response.setCharacterEncoding("UTF-8");%>

<%  //连接数据库
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/text", "root", "admin");
	    Statement stmt = con.createStatement();
	%>

<!DOCTYPE html>
<html lang="zh">
<head>
	<meta  http-equiv="Content-Type" content="text/html charset=UTF-8"> 
	<title>上传资料</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="upload.css">
	
</head>
<body>
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
				<a class="navbar-brand" href="#">这是标题</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">功能1</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">功能2<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">花卉</li>
								<li><a href="#">紫荆花</a></li>
								<li><a href="#">其他品种</a></li>

								<li class="divider"></li>

								<li class="dropdown-header">功能</li>
								<li><a href="#">校史馆</a></li>
								<li><a href="#">行政楼</a></li>
							</ul>
					</li>
					<li><a href="#">功能3</a></li>
				</ul>
				
				<div class="aw-user-nav navbar-form navbar-right">
				<!-- 登陆&注册栏 -->
				<% String username=(String)session.getAttribute("name");%>
				<span>
				<%if(username==null){%>
				<a class="register btn btn-normal btn-success" href="register.html">注册</a>
				<a class="login btn btn-normal btn-primary" href="login.html">登录</a>
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
					<a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="photo/<%=photopath%>" alt="#" class="img-circle" height="30" width="30"><span class="caret"></span>
      				</a>
      				<ul class="dropdown-menu">
         				<li><a href="zone.jsp">个人中心</a></li>
         				<li class="divider"></li>
         				<li><a href="login.html">退出</a></li>
				<%}%>
				</span>
				<!-- end 登陆&注册栏 -->
				</div>
			</div>
		</div>
	</nav>

	<div class="container">
		<h1>上传资料</h1>
		<form action="upload.jsp" method="post" enctype="multipart/form-data" class="form-horizontal">
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<input name="massagename" type="text" class="form-control" id="data-name" placeholder="您上传资料的题目">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<textarea name="massageintroduce" class="form-control"  id="" cols="48" rows="8" placeholder="您上传资料的简介"></textarea>
				</div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-4 col-sm-4">
				    <label for="exampleInputFile">选择文件</label>
				    <input type="file" id="exampleInputFile" name="file">
				    <p class="help-block">只支持.zip/.rar后缀名文件</p>
			    </div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<label class="radio-inline">
					<input name="uploadtype" type="radio" id="inlineRadio1" value="阅读"> 阅读
					</label>
					<label class="radio-inline">
					<input name="uploadtype" type="radio" id="inlineRadio2" value="听力"> 听力
					</label>
					<label class="radio-inline">
					<input name="uploadtype" type="radio" id="inlineRadio3" value="写作"> 写作
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
					<input type="submit" class="col-sm-8 btn btn-success"  value="上传文件"/>
				</div>
				<br />
				<div class="col-sm-offset-4 col-sm-6 btn1">
					<button type="reset" class="col-sm-8 btn btn-danger">重设</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>