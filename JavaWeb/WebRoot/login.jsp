<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8"); %>
<html>

<head>

    <!-- 剑锋，到此一游~ -->
	<meta charset="UTF-8">
	<title>登录</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="login.css">
	<link rel="shortcut icon" href="photo/myicon.ico" media="screen" />
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
					<li><a href="test.jsp">原题库</a></li>
				</ul>
			</div>
		</div>
	</nav>
	</head>


	<div class="container">

		<h1>加入我们 分享知识</h1>
		<%  String tip_username="",tip_password="";
		    if((String)session.getAttribute("tip_username")!=null){
		    tip_username=(String)session.getAttribute("tip_username");} 
		    if((String)session.getAttribute("tip_password")!=null){
		    tip_password=(String)session.getAttribute("tip_password");} %>

		<form action="forlogins.jsp" class="form-horizontal">
			<div class="form-group">
				<!--<label for="inputname" class="col-sm-2 control-label">
					名字
				</label>-->
				<div class="col-sm-offset-4 col-sm-4">
					<input name="loginname" type="text" class="form-control" id="inputname" placeholder="你的名字" >
				<font color="#F08080"><%=tip_username %></font>
				<%-- <div class="alert alert-warning">
					<a href="#" class="close" data-dismiss="alert"> &times; </a> <strong><%=tip_username %></strong>
				</div> --%>
				</div>
			</div>
			<div class="form-group">
				<!--<label for="inputpasswoed" class="col-sm-2 control-label">密码</label>-->
				<div class="col-sm-offset-4 col-sm-4">
					<input name="loginpassword" type="password" class="form-control" id="inputpassword" placeholder="密码" >
					<font color="#F08080"><%=tip_password %></font>
					<%-- <div class="alert alert-warning">
					<a href="#" class="close" data-dismiss="alert"> &times; </a> <strong><%=tip_password %></strong>
				</div> --%>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<div class="checkbox">
						<label for="#">
							<input type="checkbox">记住我
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
				    <input type="text" value="login" name="registerorlogin" hidden="true" />
					<button type="submit" class="col-sm-8 btn btn-primary">登录	
					</button>
				</div>
				<!--<div class="">
					<button type="reset" class="btn btn-default">重设</button>
				</div>-->
			</div>
		</form>
		<h3>
			<a href="register.jsp">没有账号？请注册</a>
		</h3>
	</div>
	<% 
	   if(((String) session.getAttribute("tip_registersuccessful")) != null){
   	        %>
  	         	<script type="text/javascript">
  	   	  		 alert("恭喜你注册成功，可登录使用啦！");
  	       	    </script>
  	   	    <%
   	       } 
   	    
	      session.removeAttribute("tip_username");
	      session.removeAttribute("tip_password");
	      session.removeAttribute("tip_registersuccessful");
	 %>
</body>
</html>