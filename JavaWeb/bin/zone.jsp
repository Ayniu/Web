<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="org.lxh.smart.*,java.util.*,java.sql.*"%>
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
	<title>个人空间</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="zone.css">
	
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
			</div>
		</div>
	</nav>

	<div class="container">
		
		<div class="row">
			<!--加入jsp语句<% %>获得用户名-->
			  <% String username=(String)session.getAttribute("name");%>	
			<h2>欢迎您，<%=username%></h2>
			<div class="#">				
				<div class="head-img col-sm-offset-5 col-sm-4">
					<!--用户头像-->
					<% 
						String photopath="";
						String str="select * from user where useid='"+username+"'";
						ResultSet rs = null;
						rs=stmt.executeQuery(str);
						if(rs.next()){
							photopath = rs.getString("photopath");
						}
					%>
					<img src="photo/<%=photopath%>" alt="#" class="img-circle" height="160" width="160">
				</div>
			</div>
			<div class="col-sm-offset-4 col-sm-4">
				<h3>您可以</h3>
			</div>
		
			<div class="btn-list col-sm-offset-4 col-sm-8">
				<div class="#">
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#user-img">修改信息</button>
					<!--Modal-->
					<div class="modal fade" id="user-img" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  	<div class="modal-dialog" role="document">
					    	<div class="modal-content">
					      		<div class="modal-header">
					        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        		<h4 class="modal-title" id="myModalLabel">修改信息</h4>
					     		</div>
						     	<div class="modal-body">
						        	<form action="profile.jsp" method="post" enctype="multipart/form-data" class="form-horizontal">
						        		<div class="form-group">
						        			<div class="col-sm-offset-2 col-sm-8">
						        				<label for="exampleInputFile">更换头像</label>
						        				<input type="file" id="exampleInputFile" name="photopath">
						        			</div>
						        		</div>
						        		<div class="form-group">
						        			<div class="col-sm-offset-2 col-sm-8">
						        				<label for="">修改密码</label>
						        				<input type="password" class="form-control" id="inputpassword" name="password" placeholder="您的新密码">
						        			</div>
						        		</div>
						        		<div class="form-group">
						        			<div class="col-sm-offset-2 col-sm-8">
						        				<label for="">修改邮箱</label>
						        				<input type="email" class="form-control" id="inputemail" name="email" placeholder="您的新邮箱地址，如xxx@xxx.com">
						        			</div>
						        		</div>
						        		<div class="modal-footer">
									        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									        <button type="reset" class="btn btn-primary">重设</button>
									        <button type="submit" class="btn btn-info">保存</button>
								      	</div>
						        	</form>
						    	</div>
					    	</div>
					 	</div>
					</div>

					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#user-upload">上传资料</button>
					<!--Modal-->
					<div class="modal fade" id="user-upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  	<div class="modal-dialog" role="document">
					    	<div class="modal-content">
					      		<div class="modal-header">
					        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        		<h4 class="modal-title" id="myModalLabel">上传资料
					     		</div>
						     	<div class="modal-body">
						        	<form action="upload.jsp" method="post" enctype="multipart/form-data" class="form-horizontal">
						        		<div class="form-group">
						        			<div class="col-sm-offset-2 col-sm-8">
												<input name="massagename" type="text" class="form-control" id="data-name" placeholder="您上传资料的题目">
											</div>
						        		</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-8">
												<textarea name="massageintroduce" class="form-control" name="data-introduction" id="" cols="48" rows="8" placeholder="您上传资料的简介"></textarea>
											</div>
										</div>
										<div class="form-group">
										    <div class="col-sm-offset-2 col-sm-4">
											    <label for="exampleInputFile">选择文件</label>
											    <input type="file" id="exampleInputFile" name="file">
											    <p class="help-block">只支持.zip/.rar后缀名文件</p>
										    </div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-8">
												<label class="radio-inline">
												<input type="radio" name="uploadtype" id="inlineRadio1" value="read"> 阅读
												</label>
												<label class="radio-inline">
												<input type="radio" name="uploadtype" id="inlineRadio2" value="listen"> 听力
												</label>
												<label class="radio-inline">
												<input type="radio" name="uploadtype" id="inlineRadio3" value="write"> 写作
												</label>
											</div>
										</div>
										<div class="modal-footer form-group">
									        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									        <button type="reset" class="btn btn-primary" >重设</button>
									        <button type="submit" class="btn btn-success">上传</button>
								      	</div>
						        	</form>
						        </div>
					    	</div>
					 	</div>
					</div>

					<a href="index.jsp" role="button" class="btn btn-primary">返回首页</a>
				</div>

			</div>

		</div>
		
	</div>

</body>
</html>