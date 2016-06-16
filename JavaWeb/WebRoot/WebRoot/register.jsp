<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>注册</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="login.css">
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
				<a class="navbar-brand" href="index.jsp"><b>主页</b></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="datalist.jsp">资料库</a></li>
					<li><a href="message.jsp">留言板</a></li>
					<li><a href="articlelist.jsp">文章中心</a></li>
				</ul>
			</div>
		</div>
	</nav>
	</head>


	<div class="container">
		<h1>加入我们 分享知识</h1>

		<form action="forlogins.jsp" class="form-horizontal">
			<div class="form-group">
				<!--<label for="inputname" class="col-sm-2 control-label">
					名字
				</label>-->
				<div class="col-sm-offset-4 col-sm-4">
					<input name="username" maxlength="15" required="required" type="text" class="form-control" id="inputname" placeholder="请输入4-15位的用户名" >
				</div>
			</div>
			<div class="form-group">
				<!--<label for="inputpasswoed" class="col-sm-2 control-label">密码</label>-->
				<div class="col-sm-offset-4 col-sm-4">
					<input name="password" maxlength="15" required="required" type="password" class="form-control" id="inputpassword" placeholder="请输入6-20位的密码" >
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<input name="useremail" required="required" type="email" class="form-control" id="inputemail" placeholder="请输入你的邮箱地址，如xxx@xxx.com">
				</div>
			</div>
			<!--<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<div class="checkbox">
						<label for="#">
							<input type="checkbox">记住我
						</label>
					</div>
				</div>
			</div>-->
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
				    <input type="text" value="register" name="registerorlogin" hidden="true" />
					<button onclick="checktext();" type="submit" class="col-sm-8 btn btn-success">注册	
					</button>
				</div>
				<!--<div class="">
				  
					<button type="reset" class="btn btn-default">重设</button>
				</div>-->
			</div>
		</form>
		<h3>
			<a href="login.jsp">已有账号？请登录</a>
		</h3>
	</div>
	<% 
	if(((String) session.getAttribute("tip_registerdefeat")) != null){
   	        %>
  	         	<script type="text/javascript">
  	   	  		 alert("注册失败，请重试·_·");
  	       	    </script>
  	   	    <%
   	       } 
   	       session.removeAttribute("tip_registerdefeat");
   	       
   	%>
	
</body>
</html>