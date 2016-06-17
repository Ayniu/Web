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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
	<title>原题库</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="css/test.css">
	
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
	
	<div class="container">
		<div class="row">
			<div class="col-sm-9 ">
				<div class="panel-group read" id="accordion" role="tablist" aria-multiselectable="true">
				  	<div class="panel panel-default">
				    	<div class="panel-heading" role="tab" id="headingOne">
				      		<h4 class="panel-title">
					       		<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					          		英语四级阅读模拟题一
					        	</a>
				      		</h4>
				    	</div>
					    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
					      	<div class="panel-body">
						        <p>Could you reproduce Silicon Valley elsewhere, or is there something unique about it?</p>	
								<p>It wouldn’t besurprising if it were hard to reproduce in other countries, because youcouldn’t reproduce it in most of the US either. What does it take to make aSilicon Valley? </p>
								<p>It’s the rightpeople. If you could get the right ten thousand people to move from SiliconValley to Buffalo, Buffalo would become Silicon Valley.</p>
								<p>You only needtwo kinds of people to create a technology hub （中心）:rich people and nerds （痴迷科研的人）. </p>
								<p>Observationbears this out. Within the US, towns have become startup hubs if and only ifthey have both rich people and nerds. Few startups happen in Miami, forexample, because although it’s full of rich people, it has few nerds. It’s notthe kind of place nerds like. </p>
								<p>WhereasPittsburg has the opposite problem: plenty of nerds, but no rich people. Thetop US Computer Science departments are said to be MIT, Stanford, Berkeley, andCarnegie-Mellon. MIT yielded Route 128.Stanford and Berkeley yielded SiliconValley. But what did Carnegie-Mellon yield in Pittsburgh? And whathappened in Ithaca, home of Cornell University, which is also high on the list. </p>
								<p>I grew up inPittsburgh and went to college at Cornell, so I can answer for both. Theweather is terrible, particularly in winter, and there’s no interesting oldcity to make up for it, as there is in Boston. Rich people don’t want to livein Pittsburgh or Ithaca. So while there are plenty of hackers （电脑迷）who could start startups, there’s no one to invest in them. </p>
								<p>Do you reallyneed the rich people? Wouldn’t it work to have the government invest the nerds?No, it would not. Startup investors are a distinct type of rich people. Theytend to have a lot of experience themselves in the technology business. Thishelps them pick the right startups, and means they can supply advice andconnections as well as money. And the fact that they have a personal stake inthe outcome makes them really pay attention. </p>

								<div class="topic">
									<h4>
									    1.What do welearn about Silicon Valley from the passage? 
									</h4>
										<p>A) Its success is hard to copy any where else.</p>
										<p>B) It is the biggest technology hub in the US.</p>
										<p>C) Its fame in high technology is incomparable.</p>
										<p>D) It leads the world in information technology.</p>

									<div class="topic">
										<h4>You answer:</h4>
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#aaa" aria-expanded="false" aria-controls="collapseExample">
											A
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#bbb" aria-expanded="false" aria-controls="collapseExample">
											B
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#ccc" aria-expanded="false" aria-controls="collapseExample">
											C
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#ddd" aria-expanded="false" aria-controls="collapseExample">
											D
										</button>
										

										<button class="btn btn-danger col-sm-offset-8" type="button" data-toggle="collapse" data-target="#eee" aria-expanded="false" aria-controls="collapseExample">
											Explanation
										</button>
										<div class="collapse" id="eee">
										  	<div class="well">
										    	此题难度不大，根据题干中的“Silicon Valley”可定位第一段，第一段尾句“is there something unique about it?”直接把答案引向第二段。精读第二段“it wouldn’t be surprising if it were hard to reproduce in othercountries”，可知该句与A选项“Its success is hard to copy anywhere else.”为同义替换关系，故选A，其他三项均为无中生有。
										  	</div>
										</div>
										<div class="collapse" id="aaa">
										  	<div class="well">
										    	You are right!
										  	</div>
										</div>
										<div class="collapse" id="bbb">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>
										<div class="collapse" id="ccc">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>
										<div class="collapse" id="ddd">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>

									</div>
								</div>
								<div class="topic">
									<h4>
									    2.What makesMiami unfit to produce a Silicon Valley?
									</h4>
										<p>A) Lack of incentive for investments. </p>
										<p>B) Lack of the right kind of talents.</p>
										<p>C) Lack of government support. </p>
										<p>D) Lack of famous universities.</p>

									<div class="topic">
										<h4>You answer:</h4>
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#2a" aria-expanded="false" aria-controls="collapseExample">
											A
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#2b" aria-expanded="false" aria-controls="collapseExample">
											B
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#2c" aria-expanded="false" aria-controls="collapseExample">
											C
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#2d" aria-expanded="false" aria-controls="collapseExample">
											D
										</button>
										<button class="btn btn-danger col-sm-offset-8" type="button" data-toggle="collapse" data-target="#2e" aria-expanded="false" aria-controls="collapseExample">
											Explanation
										</button>
										<div class="collapse" id="2e">
										  	<div class="well">
										    	此题难度不大，根据题干中“Miami”可定位至原文第五段，该段表明迈阿密只有有钱人，而缺少“痴迷于技术的人”，所以无法成为科技中心，该含义对应B选项，为统一替换关系，选项中的“the right kind oftalents”替换了原文的“nerds”。
										  	</div>
										</div>

										<div class="collapse" id="2a">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>
										<div class="collapse" id="2b">
										  	<div class="well">
										    	You are right!
										  	</div>
										</div>
										<div class="collapse" id="2c">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>
										<div class="collapse" id="2d">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>
									</div>
								</div>
								<div class="topic">
									<h4>
									    3.In that wayis Carnegie-Mellon different from Stanford, Berkeley and MIT? 
									</h4>
										<p>A) Its location is not as attractive to rich people. </p>
										<p>B) Its science department are not nearly as good. </p>
										<p>C) It does not produce computer hackers and nerds.</p>
										<p>D) It does not pay much attention to business startups.</p>

									<div class="topic">
										<h4>You answer:</h4>
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#3a" aria-expanded="false" aria-controls="collapseExample">
											A
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#3b" aria-expanded="false" aria-controls="collapseExample">
											B
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#3c" aria-expanded="false" aria-controls="collapseExample">
											C
										</button>
										
										<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#3d" aria-expanded="false" aria-controls="collapseExample">
											D
										</button>
										<button class="btn btn-danger col-sm-offset-8" type="button" data-toggle="collapse" data-target="#3e" aria-expanded="false" aria-controls="collapseExample">
											Explanation
										</button>
										<div class="collapse" id="3e">
										  	<div class="well">
										    	此题难度不高，根据题干中的“Carnegie-Mellon”和“Stanford”，“Berkeley”，“MIT”容易定位到原文第六段，第六段段位抛出问题，所以顺势往第七段找答案。第七段中详细描述了卡内基梅隆大学所在的匹兹堡的不同之处：“The weather is terrible”，“rich people don’t want to live in Pittsburgh or Ithaca”，这些信息都指向了A选项，为高度概括关系。
										  	</div>
										</div>

										<div class="collapse" id="3a">
										  	<div class="well">
										    	You are right!
										  	</div>
										</div>
										<div class="collapse" id="3b">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>
										<div class="collapse" id="3c">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>
										<div class="collapse" id="3d">
										  	<div class="well">
										    	Sorry,you are wrong!
										  	</div>
										</div>
									</div>
								</div>
								<div class="topic">
									<h4>
									    4.What doesthe author imply about Boston?
									</h4>
										<p>A) It has pleasant weather all year round.</p>
										<p>B) It produces wealth as well as high-tech.</p>
										<p>C) It is not likely to attract lots of investor and nerds.</p>
										<p>D) It is an old city with many sites of historical interest.</p>

										<div class="topic">
											<h4>You answer:</h4>
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#4a" aria-expanded="false" aria-controls="collapseExample">
												A
											</button>
											
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#4b" aria-expanded="false" aria-controls="collapseExample">
												B
											</button>
											
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#4c" aria-expanded="false" aria-controls="collapseExample">
												C
											</button>
											
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#4d" aria-expanded="false" aria-controls="collapseExample">
												D
											</button>
											<button class="btn btn-danger col-sm-offset-8" type="button" data-toggle="collapse" data-target="#4e" aria-expanded="false" aria-controls="collapseExample">
												Explanation
											</button>
											<div class="collapse" id="4e">
											  	<div class="well">
											    	该题难度较高，根据题干中的“Boston”可定位至原文的第七段。原文提到Boston的句子为“as there is in Boston”，as在这里表对比，意为“波士顿却有”，那么前文一定指出了匹兹堡没有某物，所以关键句在于具体是什么，故往前文查找，发现前文提到的是“and there’s no interesting old city to make up for it”，意思是匹兹堡不仅天气恶劣，而且也没有有趣的老城区，但是波士顿却与之相反，固选择D，表示“波士顿有着很多历史古迹”。
											  	</div>
											</div>

											<div class="collapse" id="4a">
											  	<div class="well">
											    	Sorry,you are wrong!
											  	</div>
											</div>
											<div class="collapse" id="4b">
											  	<div class="well">
											    	Sorry,you are wrong!
											  	</div>
											</div>
											<div class="collapse" id="4c">
											  	<div class="well">
											    	Sorry,you are wrong!
											  	</div>
											</div>
											<div class="collapse" id="4d">
											  	<div class="well">
											    	You are right!
											  	</div>
											</div>
										</div>
								</div>
								<div class="topic">
									<h4>
									    5.What doesthe author say about startup investors? 
									</h4>
										<p>A) They are especially wise in making investments.  </p>
										<p>B) They have good connections in the government. </p>
										<p>C) They can do more than providing money. </p>
										<p>D) They are enough to invest in nerds. </p>

										<div class="topic">
											<h4>You answer:</h4>
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#5a" aria-expanded="false" aria-controls="collapseExample">
												A
											</button>
											
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#5b" aria-expanded="false" aria-controls="collapseExample">
												B
											</button>
											
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#5c" aria-expanded="false" aria-controls="collapseExample">
												C
											</button>
											
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#5d" aria-expanded="false" aria-controls="collapseExample">
												D
											</button>
											<button class="btn btn-danger col-sm-offset-8" type="button" data-toggle="collapse" data-target="#5e" aria-expanded="false" aria-controls="collapseExample">
												Explanation
											</button>
											<div class="collapse" id="5e">
											  	<div class="well">
											    	本题难度不高，根据核心名词概念“startup investors”可定位到原文最后一段，原文清晰地表述了，startup investors不仅能够提供资金帮助，还能提供很多建议，所以C选项“他们不仅能提供资金”是最好的答案，和原文关系为高度概括。
											  	</div>
											</div>

											<div class="collapse" id="5a">
											  	<div class="well">
											    	Sorry,you are wrong!
											  	</div>
											</div>
											<div class="collapse" id="5b">
											  	<div class="well">
											    	Sorry,you are wrong!
											  	</div>
											</div>
											<div class="collapse" id="5c">
											  	<div class="well">
											    	You are right!
											  	</div>
											</div>
											<div class="collapse" id="5d">
											  	<div class="well">
											    	Sorry,you are wrong!
											  	</div>
											</div>
										</div>
								</div>


					      	</div>
					    </div>
					</div>
				 	<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingTwo">
					      	<h4 class="panel-title">
					        	<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					          		英语六级阅读模拟题一
					        	</a>
					     	</h4>
					    </div>
					    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					      	<div class="panel-body">
					        试题正在运送中，敬请期待...
					      	</div>
					    </div>
					  	
					</div>
				</div>


			</div>
		</div>
	</div>
	
</body>
</html>