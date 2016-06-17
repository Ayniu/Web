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
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="footer.css">
	<link rel="stylesheet" href="index.css">
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

	<!--carousel组件，BootStrap的一个图片轮播组件-->
	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="#">
		<div class="carousel-inner">
			<div class="item active">
				<img src="photo/first-big.jpg" class="first-slide" alt="#.jpg">
					<div class="container">
						<div class="carousel-caption">
							<form action="searchdata.jsp" class="col-md-8 col-md-offset-2" role="search" mether="get">
								<div class="form-group">
									<input type="text" class="form-control colxs-8" placeholder="请输入您要查询的资料题目" name="searchtext">
								</div>
							</from>
						</div>
					</div>
			</div>
		</div>	
	</div>

	<!--阅读-->
	<section class="ad-features ad">
  		<div class="container">
    		<div class="row">
      			<div align="center">
      				<a href="datalist.jsp"><img src="photo/word-read.jpg" alt="" height="200"></a>
      			</div>
      			
      			<div class="col-sm-6">
        			<div class="row">
         				<div class="col-sm-6 feature-list" align="center">
            				<div class="feature-icon">
            					<img src="photo/333.jpg" alt="#" class="img-circle" width="100" height="100">
            				</div>
			            		<h4>阅读题目 </h4>
			            		<p>汇聚最新题目，让你体验最新的题型</p>
			            </div>
			            <div class="col-sm-6 feature-list">
				            <div class="feature-icon" align="center">
				            	<img src="photo/444.jpg" alt="#" class="img-circle" width="100" height="100"></div>
					            <h4>阅读练习</h4>
					            <p>神助攻练习题，助你攻陷阅读题 </p>
			            </div>
			        </div>
			        <div class="row">
			            <div class="col-sm-6 feature-list" align="center">
			            	<div class="feature-icon">
			            		<img src="photo/111.jpg" alt="#" class="img-circle" width="100" height="100"></div>
						        <h4>答案分析</h4>
						       	<p>答案专业分析，助你答题思路清晰</p>
			            </div>

			            <div class="col-sm-6 feature-list">
				            <div class="feature-icon" align="center">
				            	<img src="photo/222.jpg" alt="#" class="img-circle" width="100" height="100"></div>
				            	<h4>阅读资料</h4>
				            	<p>阅读资料共享，成就高分梦想 </p>
			            </div>
			        </div>
			    </div>
      			<div class="col-sm-6 ">
      				<div class="bigimg fleft" id="bigerimg">
      					<img src="photo/reading1.jpg" alt="#" width="455" height="380">
      					<a href="test.jsp">
      						<div id="bigimg2_detail">
      							<p>立即查看</p>
      						</div>
      					</a>
      				</div>
      			</div>
	</section>
	<!--听力-->
	<section class="ad-features ad">
  		<div class="container">
    		<div class="row">
      			<div align="center">
      				<a href="datalist.jsp"><img src="photo/word-listen.jpg" alt="" height="200"></a>
      			</div>

      			<div class="col-sm-6 ">
      				<div class="bigimg fleft" id="bigerimg">
      					<img src="photo/listening2.jpg" alt="#" width="455" height="380">
      					<a href="datalist.jsp">
      						<div id="bigimg_detail">
      							<p>立即查看</p>
      						</div>
      					</a>
      				</div>
      			</div>
      			<div class="col-sm-6">
        			<div class="row">
         				<div class="col-sm-6 feature-list" align="center">
            				<div class="feature-icon">
            					<img src="photo/333.jpg" alt="#" class="img-circle" width="100" height="100">
            				</div>
			            		<h4>听力题目 </h4>
			            		<p>拥有最新听力题型，给你考场般的体验 </p>
			            </div>
			            <div class="col-sm-6 feature-list">
				            <div class="feature-icon" align="center">
				            	<img src="photo/222.jpg" alt="#" class="img-circle" width="100" height="100"></div>
					            <h4>听力音效</h4>
					            <p>具备优质音效，带给你听觉上的盛宴</p>
			            </div>
			        </div>
			        <div class="row">
			            <div class="col-sm-6 feature-list" align="center">
			            	<div class="feature-icon">
			            		<img src="photo/111.jpg" alt="#" class="img-circle" width="100" height="100"></div>
						        <h4>答案解析</h4>
						       	<p>拥有英语全文及中文答案解释，想不懂都难</p>
			            </div>

			            <div class="col-sm-6 feature-list">
				            <div class="feature-icon" align="center">
				            	<img src="photo/444.jpg" alt="#" class="img-circle" width="100" height="100"></div>
				            	<h4>听力材料</h4>
				            	<p>汇聚大家的听力精华，百万资料随你下载，再也不怕没有听力资源啦 </p>
			            </div>
			        </div>
			    </div>
	</section>
	<!--写作-->
	<section class="ad-features ad">
  		<div class="container">
    		<div class="row">
      			<div align="center">
      				<a href="datalist.jsp"><img src="photo/word-write.jpg" alt="" height="200"></a>
      			</div>

      			<div class="row">
      				<div class="col-sm-4 smallimg">
      					<div class="fleft" id="lineleft">
	      					<img src="photo/skill.jpg" alt="#" width="310" height="200" class="center-block">
	      					<a href="datalist.jsp">
	      						<div id="line_detail">
	      							<p>立即查看</p>
	      						</div>
	      					</a>
      					</div>
      				</div>
      				<div class="col-sm-4 smallimg">
      					<div class="fleft" id="lineleft">
      						<img src="photo/composition-template.jpg" alt="#" width="310" height="200" class="center-block">
      						<a href="test.jsp">
      							<div id="line_detail">
      								<p>立即查看</p>
      							</div>
      						</a>
      					</div>
      				</div>
      				<div class="col-sm-4 smallimg">
      					<div class="fleft" id="lineleft">     					
      						<img src="photo/writing-more.jpg" alt="#" width="310" height="200" class="center-block">
      						<a href="articlelist.jsp">
      							<div id="line_detail">
      								<p>立即查看</p>
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
<%
	stmt.close();
	con.close();
%>