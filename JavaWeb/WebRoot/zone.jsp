<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*,java.util.*,java.sql.*"%>
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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="zone.css">
<link rel="shortcut icon" href="photo/myicon.ico" media="screen" />
<!-- 背景图片 --> 
	<style type="text/css">
		body {
			background-image:url(photo/zone-bg.jpg);
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
			<button class="navbar-toggle collapsed" type="button"
				data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
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
		</div>
	</div>
</nav>
</head>

<div class="container">
<!-- <br><br> -->

	<div class="row">
		<!--加入jsp语句<% %>获得用户名-->
		<% String username=(String)session.getAttribute("name");%>
		<h2>
			欢迎您，<%=username%></h2>
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
				<img src="photo/<%=photopath%>" alt="#" class="img-circle"
					height="160" width="160">
			</div>
		</div>
		<div class="col-sm-offset-4 col-sm-4">
			<h3>您可以</h3>
		</div>

		<div class="btn-list col-sm-offset-4 col-sm-8">
			<div class="#">
				<button type="button" class="btn btn-info" data-toggle="modal"
					data-target="#user-img">修改信息</button>
				<!--Modal-->
				<div class="modal fade" id="user-img" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">修改信息</h4>
							</div>
							<div class="modal-body">
								<form action="profile.jsp" method="post"
									enctype="multipart/form-data" class="form-horizontal">
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-8">
											<label for="exampleInputFile">更换头像</label> <input type="file"
												required="required" id="exampleInputFile" name="photopath">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-8">
											<label for="">修改密码</label> <input type="password"
												maxlength="15" required="required" class="form-control" id="inputpassword" name="password"
												placeholder="您的新密码">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-8">
											<label for="">修改邮箱</label> <input type="email"
												required="required" class="form-control" id="inputemail" name="email"
												placeholder="您的新邮箱地址，如xxx@xxx.com">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="reset" class="btn btn-primary">重设</button>
										<button type="submit" class="btn btn-info">保存</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<button type="button" class="btn btn-success" data-toggle="modal"
					data-target="#user-upload">上传资料</button>

				<div class="modal fade" id="user-upload" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">上传资料
							</div>
							<div class="modal-body">
								<form action="upload.jsp" method="post"
									enctype="multipart/form-data" class="form-horizontal">
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-8">
											<input name="massagename" type="text" class="form-control"
												maxlength="15" required="required" id="data-name" placeholder="您上传资料的题目">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-8">
											<textarea name="massageintroduce" class="form-control"
												name="data-introduction" id="" cols="48" rows="8"
												maxlength="100" required="required" placeholder="您上传资料的简介(字数控制在100以内哦~)"></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-4">
											<label for="exampleInputFile">选择文件</label> <input type="file"
												required="required" id="exampleInputFile" name="file">
											<p class="help-block">只支持.zip/.rar后缀名文件</p>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-8">
											<label class="radio-inline"> <input  type="radio"
												required="required" name="uploadtype" id="inlineRadio1" value="阅读"> 阅读
											</label> <label class="radio-inline"> <input type="radio"
												required="required" name="uploadtype" id="inlineRadio2" value="听力"> 听力
											</label> <label class="radio-inline"> <input type="radio"
												required="required" name="uploadtype" id="inlineRadio3" value="写作"> 写作
											</label>
										</div>
									</div>
									<div class="modal-footer form-group">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="reset" class="btn btn-primary">重设</button>
										<button type="submit" class="btn btn-success">上传</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<a href="logout.jsp" role="button" class="btn btn-primary">退出登录</a>
			</div>
		</div>
	</div>
</div>
    <%
	   if (((String) session.getAttribute("tip_uploadsuccess")) != null) {
    %>
       	<script type="text/javascript">
	  		 alert("上传成功！可到资料库查看");
     	</script>
	<%
		}
       if (((String) session.getAttribute("tip_uploaddefeat")) != null) {
    %>
      	<script type="text/javascript">
	  		 alert("上传失败！请重试");
    	</script>
	<%
	
       }
       if(((String) session.getAttribute("tip_uploaderror")) != null){
     %>
         	<script type="text/javascript">
   	  		 alert("上传文件类型有误，请重试~");
       	    </script>
   	<%
       }
       if(((String) session.getAttribute("tip_profilesuccessful")) != null){
    	     %>
    	         	<script type="text/javascript">
    	   	  		 alert("个人信息修改成功！");
    	       	    </script>
    	   	<%
    	       } 

       if(((String) session.getAttribute("tip_profileerror")) != null){
   	        %>
  	         	<script type="text/javascript">
  	   	  		 alert("头像只能是图片哦，请重试！");
  	       	    </script>
  	   	    <%
   	       }
		session.removeAttribute("tip_uploadsuccess");
		session.removeAttribute("tip_uploaddefeat");
		session.removeAttribute("tip_uploaderror");
		session.removeAttribute("tip_profilesuccessful");
		session.removeAttribute("tip_profiledefeat");
		session.removeAttribute("tip_profileerror");
	%>
</body>
</html>
<%
	stmt.close();
	con.close();
%>