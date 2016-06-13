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
	<title>首页</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="footer.css">
	<link rel="stylesheet" href="index.css">
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
					<!-- <li class="dropdown">
						<a href="message.jsp" class="dropdown-toggle" data-toggle="dropdown">留言板<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">花卉</li>
								<li><a href="#">紫荆花</a></li>
								<li><a href="#">其他品种</a></li>

								<li class="divider"></li>

								<li class="dropdown-header">功能</li>
								<li><a href="#">校史馆</a></li>
								<li><a href="#">行政楼</a></li>
							</ul> -->
					</li>
					<!-- <li><a href="zone.jsp">个人中心</a></li> -->
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
					<a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="photo/<%=photopath%>" alt="#" class="img-circle" height="32" width="32"><span class="caret"></span>
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
	</head>

	<!--返回顶部
		<div onclick="pageScroll()" id="backtop">
			<p>返回<br/>顶部</p>
		</div>-->

	
	<!--carousel组件，BootStrap的一个图片轮播组件-->
	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="#">
		<div class="carousel-inner">
			<div class="item active">
				<img src="img/首页红满堂.jpg" class="first-slide" alt="#.jpg">
					<div class="container">
						<div class="carousel-caption">
							<form action="#" class="col-md-8 col-md-offset-2" role="search" mether="get">
								<div class="form-group">
									<input type="text" class="form-control colxs-8" placeholder="请输入您要查询的内容" name="query">
									<!--
									<button type="submit" class="btn btn-custom col-lg-3 col-xs-3">Search</button>-->
								</div>
							</from>
						</div>
					</div>
			</div>
		</div>	
	</div>


	<!--一行排列3个图标
	<div class="container">
		<div class="row paper-list">
			<div class="col-sm-4 paper">
				<img src="#" alt="#" class="img-circle img-thumbnail" 
				style="width:140px;height:140px;max-width:140px;">
				<h2>LISTEN</h2>
				<p><a href="#">11111</a></p>
				
			</div>
			<div class="col-sm-4 paper">
				<img src="#" alt="#" class="img-circle img-thumbnail" style="width:140px;height:140px;max-width:140px;">
				<h2>READ</h2>
				<p><a href="#">11111</a></p>
				
			</div>
			<div class="col-sm-4 paper">
				<img src="#" alt="#" class="img-circle img-thumbnail" style="width:140px;height:140px;max-width:140px;">
				<h2>WRITE</h2>
				<p><a href="#">11111</a></p>
				
			</div>
		</div>
	</div>-->
	<!--阅读-->
	<section class="ad-features ad">
  		<div class="container">
    		<div class="row">
      			<h3 class="header">阅读</h3>

      			<p><a class="more" href="#">查看更多</a></p>

      			<div class="col-sm-6">
        			<div class="row">
         				<div class="col-sm-6 feature-list" align="center">
            				<div class="feature-icon">
            					<img src="img/1.jpg" alt="#" class="img-circle" width="100" height="100">
            				</div>
			            		<h4> 超级名师 </h4>
			            		<p>导师来自北京大学计算机专业的老师和业界一流的工程师，帮助你快速成长</p>
			            </div>
			            <div class="col-sm-6 feature-list">
				            <div class="feature-icon" align="center">
				            	<img src="img/1.jpg" alt="#" class="img-circle" width="100" height="100"></div>
					            <h4>求职必备</h4>
					            <p> 导师们最大的烦恼就是每天各路公司求他们推荐程序员，帮帮他们吧，快到碗里来 </p>
			            </div>
			        </div>
			        <div class="row">
			            <div class="col-sm-6 feature-list" align="center">
			            	<div class="feature-icon">
			            		<img src="img/1.jpg" alt="#" class="img-circle" width="100" height="100"></div>
						        <h4>实战导向</h4>
						       	<p>图文、代码与视频有机结合的实战课程内容，打造真实的项目，最佳实践一网打尽</p>
			            </div>

			            <div class="col-sm-6 feature-list">
				            <div class="feature-icon" align="center">
				            	<img src="img/1.jpg" alt="#" class="img-circle" width="100" height="100"></div>
				            	<h4>专业工具</h4>
				            	<p> 随时随地学习在线学习，记录完整的学习过程与轨迹，沉淀终生受益的代码和内容 </p>
			            </div>
			        </div>
			    </div>
      			<div class="col-sm-6 ">
      				<div class="bigimg fleft" id="bigerimg">
      					<img src="img/3.jpg" alt="#" width="455" height="380">
      					<a href="#">
      						<div id="bigimg2_detail">
      							<p>发现更多</p>
      						</div>
      					</a>
      				</div>
      			</div>
	</section>
	<!--听力-->
	<section class="ad-features ad">
  		<div class="container">
    		<div class="row">
      			<h3 class="header">听力</h3>

      			<p><a class="more" href="#">查看更多</a></p>

      			<div class="col-sm-6 ">
      				<div class="bigimg fleft" id="bigerimg">
      					<img src="img/3.jpg" alt="#" width="455" height="380">
      					<a href="#">
      						<div id="bigimg_detail">
      							<p>发现更多</p>
      						</div>
      					</a>
      				</div>
      			</div>
      			<div class="col-sm-6">
        			<div class="row">
         				<div class="col-sm-6 feature-list" align="center">
            				<div class="feature-icon">
            					<img src="img/1.jpg" alt="#" class="img-circle" width="100" height="100">
            				</div>
			            		<h4> 超级名师 </h4>
			            		<p>导师来自北京大学计算机专业的老师和业界一流的工程师，帮助你快速成长</p>
			            </div>
			            <div class="col-sm-6 feature-list">
				            <div class="feature-icon" align="center">
				            	<img src="img/1.jpg" alt="#" class="img-circle" width="100" height="100"></div>
					            <h4>求职必备</h4>
					            <p> 导师们最大的烦恼就是每天各路公司求他们推荐程序员，帮帮他们吧，快到碗里来 </p>
			            </div>
			        </div>
			        <div class="row">
			            <div class="col-sm-6 feature-list" align="center">
			            	<div class="feature-icon">
			            		<img src="img/1.jpg" alt="#" class="img-circle" width="100" height="100"></div>
						        <h4>实战导向</h4>
						       	<p>图文、代码与视频有机结合的实战课程内容，打造真实的项目，最佳实践一网打尽</p>
			            </div>

			            <div class="col-sm-6 feature-list">
				            <div class="feature-icon" align="center">
				            	<img src="img/1.jpg" alt="#" class="img-circle" width="100" height="100"></div>
				            	<h4>专业工具</h4>
				            	<p> 随时随地学习在线学习，记录完整的学习过程与轨迹，沉淀终生受益的代码和内容 </p>
			            </div>
			        </div>
			    </div>
	</section>
	<!--写作-->
	<section class="ad-features ad">
  		<div class="container">
    		<div class="row">
      			<h3 class="header">写作</h3>

      			<p><a class="more" href="#">查看更多</a></p>

      			<div class="row">
      				<div class="col-sm-4 smallimg">
      					<div class="fleft" id="lineleft">
	      					<img src="img/3.jpg" alt="#" width="310" height="200" class="center-block">
	      					<a href="#">
	      						<div id="line_detail">
	      							<p>发现更多</p>
	      						</div>
	      					</a>
      					</div>
      				</div>
      				<div class="col-sm-4 smallimg">
      					<div class="fleft" id="lineleft">
      						<img src="img/3.jpg" alt="#" width="310" height="200" class="center-block">
      						<a href="#">
      							<div id="line_detail">
      								<p>发现更多</p>
      							</div>
      						</a>
      					</div>
      				</div>
      				<div class="col-sm-4 smallimg">
      					<div class="fleft" id="lineleft">     					
      						<img src="img/3.jpg" alt="#" width="310" height="200" class="center-block">
      						<a href="#">
      							<div id="line_detail">
      								<p>发现更多</p>
      							</div>
      						</a>
      					</div>
      				</div>
      			</div>
	</section>

	<!--页脚信息-->
	<footer>
		<div class="footer">
			<p>build by cjl-scau</p>
		</div>
	</footer>

</body>
</html>