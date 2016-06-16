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
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
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
				<a class="navbar-brand" href="index.jsp"><b>主页</b></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="datalist.jsp">资料库</a></li>
					<li><a href="message.jsp">留言板</a></li>
					<li><a href="articlelist.jsp">文章中心</a></li>
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

	<div class="container">
		<h1>上传资料</h1>
		<form action="upload.jsp" method="post" enctype="multipart/form-data" class="form-horizontal">
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<input name="massagename" type="text" maxlength="15" required="required" class="form-control" id="data-name" placeholder="您上传资料的题目">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<textarea name="massageintroduce" maxlength="100" required="required" class="form-control"  id="" cols="48" rows="8" placeholder="您上传资料的简介(100字以内)"></textarea>
				</div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-4 col-sm-4">
				    <label for="exampleInputFile">选择文件</label>
				    <input required="required" type="file" id="exampleInputFile" name="file">
				    <p class="help-block">只支持.zip/.rar后缀名文件</p>
			    </div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<label class="radio-inline">
					<input name="uploadtype" type="radio" required="required" id="inlineRadio1" value="阅读"> 阅读
					</label>
					<label class="radio-inline">
					<input name="uploadtype" type="radio" required="required" id="inlineRadio2" value="听力"> 听力
					</label>
					<label class="radio-inline">
					<input name="uploadtype" type="radio" required="required" id="inlineRadio3" value="写作"> 写作
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
					<input type="submit" class="col-sm-8 btn btn-info"  value="上传"/>
				</div>
				<br />
				<div class="col-sm-offset-4 col-sm-6 btn1">
					<button type="reset" class="col-sm-8 btn btn-success">重设</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
<%
	stmt.close();
	con.close();
		if(username== null){
		%>
			<script type="text/javascript">
			 alert("请先登录再进行操作哦！");
			  </script>
			<meta http-equiv="refresh" content="2; url=login.jsp">
		<%
		 }   
%>