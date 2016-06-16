<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="Bean.*,com.jspsmart.upload.*,java.util.*,java.sql.*,java.text.*"%>
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
	<title>资料</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="footer.css">
	<link rel="stylesheet" href="datalist.css">
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
			<div class="col-sm-9">
				
				<%-- <% Boolean ischoose =false;
				   session.setAttribute("ischoose",ischoose); %> --%>
				
					<%
						
						List<DataListBean> list =(ArrayList<DataListBean>)session.getAttribute("datalist");
						
					%>

					<%
					     int i=0;
					     String photo_path;
						 if (list == null || list.size() < 1) {
				
							out.print("<tr bgcolor='#FFFFFF' colspan='5'><b><center>没有相关的资料哦~</center></b></tr>");
						 
						} else {
							for (DataListBean note : list) {
							
						    //头像图片载入
						    String photopath="";
							String photo_sql="select * from user where useid='"+note.getUsername()+"'";
							ResultSet rs2 = null;
							rs2= stmt.executeQuery(photo_sql);
							while(rs2.next()){
							  photopath=(rs2.getString("photopath"));
							}
							
					   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");  
					%>


			<div class="media panel panel-border body">
				<div class="media-left">
					<img class="media-object avatar-img" src="photo/<%=photopath%>">
				</div>

				<div class="media-body">
					<h4 class="media-heading">
						<span class="type label label-round label-round-orange"><%=note.getDatatype()%></span>
						<%=note.getDataname()%>
					</h4>
					<p><%=note.getDataintroduce()%></p>
					   <%-- <button type="button" class="btn btn-primary btn-sm">
							<a style="text-decoration:none; color:#ffffff"
								href="file/<%=note.getDatapath()%>">下载</a></button> --%>
					   <form action="dodatalistdelete.jsp" class="form-horizontal">
					   <input type="text" value="<%=note.getDataname()%>" name="dataname" hidden="true" />
					   <button type="submit" class="btn btn-danger btn-sm" 
						    data-toggle="modal" data-target="#detail">删除</button>
					   </form>
		           <div align="right"><font color="gray"><%=formatter.format(note.getDatadate())%></font></div>
						
				</div>
			</div>
			<%
				}
			 }
			%>
		</div>
       
			<div class="col-sm-3">
				<div class="sidebar">
					<!--通过给按钮添加 .btn-block 类可以将其拉伸至父元素100%的宽度，而且按钮也变为了块级（block）元素-->
					<a href="uploadface.jsp" class="btn btn-info btn-block">上传文件</a>
					
				</div>
				<div class="sidebar-column" id="tags">
					<h4 class="header">热门标签</h4>
					<p><form action="choosedatalist.jsp" class="form-horizontal">
					    <input type="text" value="true" name="ischoose" hidden="true" />
						<button name="choose" value="阅读" type="submit" class="label label-default">阅读</button>
						<button name="choose" value="听力" type="submit" class="label label-default">听力</button>
						<button name="choose" value="写作" type="submit" class="label label-default">写作</button>
						<button name="choose" value="all" type="submit" class="label label-default">所有</button>
					</p></form>
				</div>
				<div>
			    <form action="searchdata.jsp" class="form-horizontal">
				  <div class="side-search col-sm-8">
					<input name="searchtext" type="text" class="form-control" id="data-name" placeholder="请输入资料题目">
				  </div>
				  <div class="col-sm-4"></div><button type="submit" class="btn btn-danger btn-sm">搜索</button>
				  </div>
				  </form>
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