<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*,java.util.*,java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
 %>
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
	<title>发布文章</title>
	<!--链接BootStrap的css文件-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="articlecontent.css">
	
	<script charset="utf-8" src="kindeditor.js"></script>
	<script charset="utf-8" src="lang/zh_CN.js"></script>
	<script charset="utf-8" src="plugins/code/prettify.js"></script>
	<script type="text/javascript" charset="utf-8" src="kindeditor.js"></script><!-- 添加kindeditor的引用 -->     
		<script type="text/javascript">     
				KindEditor.ready(function(K) {
				var editor1 = K.create('textarea[name="content1"]',{
					uploadJson : 'upload_json.jsp',
					fileManagerJson : 'file_manager_json.jsp',
					resizeType : 0,
					allowPreviewEmoticons : false,
					items : ['bold', 'italic', 'underline','|', 'fontname', 'fontsize', 'forecolor', 'hilitecolor', 
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'link'],
						autoHeightMode : true,
					afterCreate : function() {
						this.loadPlugin('autoheight');
					},
       				afterCreate : function() {
       				var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					}
				});
				prettyPrint();
			});  
	</script>    
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
			<div class="col-sm-8">
				<h2>新建文章</h2>
				<form action="Putarticle.jsp" method="post" class="form-horizontal">
					<div class="form-group">
						<div class="col-sm-12">
							<input required="required" type="text" class="form-control" name="title" id="paper-name" placeholder="文章题目">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<textarea required="required"  class="form-control" name="content1" cols="48" rows="10" placeholder="文章内容"><%=htmlspecialchars(htmlData)%></textarea>
						</div>
					</div>
			
					<div class="form-group">
						<div class="col-sm-4">
							<label class="radio-inline">
							<input required="required" type="radio" name="type" id="inlineRadio1" value="阅读"> 阅读
							</label>
							<label class="radio-inline">
							<input required="required" type="radio" name="type" id="inlineRadio2" value="听力"> 听力
							</label>
							<label class="radio-inline">
							<input required="required" type="radio" name="type" id="inlineRadio3" value="写作"> 写作
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-5">
							<button type="submit" name="button" class="col-sm-8 btn btn-success">发布文章	
							</button>
						</div>
					</div>
				</form>
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
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>
<%
	stmt.close();
	con.close();
%>