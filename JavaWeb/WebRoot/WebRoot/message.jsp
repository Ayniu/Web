<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="Bean.*,com.jspsmart.upload.*,java.util.*,java.text.*,java.sql.*,java.security.*"%>
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
	<title>留言</title>
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
				<div class="panel panel-border">
					<form action="Putmassage.jsp" class="form-horizontal">
						<div class="form-group">
							<textarea maxlength="200" required="required" class="form-control" name="Context" id="#" cols="30" rows="6" placeholder="请留下您的建议（请控制在200字以内哦~_~）"></textarea>	
						</div>
						<div class="form-group">
							<button type="submit" class="col-sm-2 btn btn-info btn2" >提交</button>
						</div>
					</form>
				</div>
				
				
			<div class="media panel panel-border body">
				
				<%
						//获取数据，并显示
						String message_sql = "select * from note order by date1 DESC";
						ResultSet rs = stmt.executeQuery(message_sql);
						List<MessageListBean> list = new ArrayList<MessageListBean>();
						
						while (rs.next()) {
							MessageListBean message = new MessageListBean();
							message.setId(rs.getString("id"));
							message.setUserid(rs.getString("useid"));
							message.setContext(rs.getString("context"));
							message.setUsertimetamp(rs.getTimestamp("date1"));   
							message.setManageid(rs.getString("manageid"));
							message.setAnswer(rs.getString("answer")); 
							message.setManagetimetamp(rs.getTimestamp("date2"));
							list.add(message); 
							   
						}
					%>
					
					<%
						if (list == null || list.size() < 1) {
							out.print("<tr bgcolor='#FFFFFF' colspan='5'>没有任何留言哦！</tr>");
						} else {
							for (MessageListBean msn : list) {
							
							String photo_path="";
						    String photo_sql="select * from user where useid='"+msn.getUserid()+"'";
						    ResultSet rs_photo = null;
							rs_photo = stmt.executeQuery(photo_sql);
							if(rs_photo.next()){
							photo_path=rs_photo.getString("photopath");
						}
						
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
							
					%>
				
					<div>
						<div class="media-left topic-list">
						    <a href="#">
						      	<img class="media-object avatar-img" src="photo/<%=photo_path%>">
						    </a>
						</div>
						<div class="media-body topic-list">
						    <h4><%=msn.getUserid()%></h4>
						    <p><%=msn.getContext()%></p>
						    <p><font color="gray"><%=formatter.format(msn.getUsertimetamp())%></font></p>
						</div>
					</div>
					<%
				       }
				     }
			        %>
				</div>

			</div>

			<div class="col-sm-3">

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

 		if(((String) session.getAttribute("tip_mlogin")) != null){
   	        %>
  	         	<script type="text/javascript">
  	   	  		 alert("请先登录再进行操作哦！");
  	       	    </script>
  	   	    <%
   	       } 
	      session.removeAttribute("tip_mlogin");
%>