<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="Bean.*,java.util.*,java.sql.*,java.text.*"%>
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
	<title>文章</title>
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
	<%
						//获取数据，并显示
						String article_sql = "select * from article order by time DESC";
						ResultSet rs = stmt.executeQuery(article_sql);
						List<ArticleListBean> list = new ArrayList<ArticleListBean>();
						
						while (rs.next()) {
							ArticleListBean article = new ArticleListBean();
							article.setUserid(rs.getString("useid"));
							article.setTitle(rs.getString("title"));
							article.setArticle(rs.getString("article"));
							article.setType(rs.getString("type"));
							article.setTime(rs.getTimestamp("time"));
							list.add(article); 
							   
						}
					%>
					
					
	<div class="container">
		<div class="row" id="#">
			<div class="col-sm-9">
			<%
						if (list == null || list.size() < 1) {
							out.print("<tr bgcolor='#FFFFFF' colspan='5'>没有任何文章哦！</tr>");
						} else {
							for (ArticleListBean article : list) {
							
							String photo_path="";
						    String photo_sql="select * from user where useid='"+article.getUserid()+"'";
						    ResultSet rs_photo = null;
							rs_photo = stmt.executeQuery(photo_sql);
							if(rs_photo.next()){
							photo_path=rs_photo.getString("photopath");
						}
						
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
							
					%>
				<div class="media panel panel-border body">
					<div class="media-left topic-list">
					    <img class="media-object avatar-img" src="photo/<%=photo_path%>" alt="...">
					</div>
					<div class="media-body topic-list">
					    <h4 class="media-heading">
					    
					    	<a href="articlecontent.jsp?title=<%=article.getTitle()%>
					    	&time=<%=formatter.format(article.getTime())%>
					    	&type=<%=article.getType()%>
					    	&content=<%=article.getArticle()%>
					    	&img=<%=photo_path%>
					    	&author=<%=article.getUserid()%>"><%=article.getTitle() %></a>
					    </h4>
					    <p>作者：<%=article.getUserid()%>&nbsp &nbsp分组：<%=article.getType()%></p>
					    <p><font color="gray"><%=formatter.format(article.getTime())%></font></p>
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
					<a href="writearticle.jsp" class="btn btn-info btn-block">发布文章</a>
				</div>
			</div>
			
		</div>
	</div>
	<% 
	if(((String) session.getAttribute("tip_articlesuccessful")) != null){
   	        %>
  	         	<script type="text/javascript">
  	   	  		 alert("发表成功！");
  	       	    </script>
  	   	    <%
   	       }
		session.removeAttribute("tip_articlesuccessful");
		
		if(((String) session.getAttribute("tip_alogin")) != null){
   	        %>
  	         	<script type="text/javascript">
  	   	  		 alert("请先登录再进行操作哦！");
  	       	    </script>
  	   	    <%
   	       } 
   	    
	      session.removeAttribute("tip_alogin");
	%>
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