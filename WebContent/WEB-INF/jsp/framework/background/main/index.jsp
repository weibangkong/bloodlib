<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台界面</title>
<%@include file="../../../common/include.jsp" %>
<style type="text/css">
/* a{
text-decoration:none;
} */
</style>
</head>
<body>
	<!-- 总页面大小 -->
	<div style="width:100%;height:100%;position: absolute;">
		 
		<div style="width:100%;height:8%;background-color: yellow;">
			<h1 style="float:left">人体血库系统后台管理————主界面</h1>
				<div class="btn-group" style="float:right;margin-top: 10px;margin-right: 30px;">
  					<button type="button" class="btn btn-default dropdown-toggle" style="width:100px"data-toggle="dropdown" >
    				${sessionScope.userName} <span class="caret"></span>
  					</button>
  					<ul class="dropdown-menu" style="min-width:100px">
    					<li><a href="#" >修改密码</a></li>
    					<li><a href="#" id="id_a_loginout">退出</a></li>
  					</ul>
				</div>
		</div>
		<!-- 页面内容 -->
		<div style="width:100%;height:92%;background-color: back">
			<!-- 左侧导航栏 -->
			<div style="width:12%;height:100%;float: left;">
				<ul class="layui-nav layui-nav-tree" style="width:100%;height:100%">
					<li class="layui-nav-item">
						<a href="javascript:;" style="text-decoration: none">管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${pageContext.request.contextPath}/app/bgnavi/user/index" target="showFrame" style="text-decoration: none">用户管理</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/app/bgnavi/needblood/index" target="showFrame" style="text-decoration: none">发布消息管理</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/app/bgnavi/bloodtype/index" target="showFrame" style="text-decoration: none">血型及匹配原则管理</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/app/bgnavi/bloodstock/index" target="showFrame" style="text-decoration: none">血液存量管理</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/app/bgnavi/tempuser" target="showFrame" style="text-decoration: none">临时用户查询</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/app/bgnavi/donateblood/index" target="showFrame" style="text-decoration: none">献血信息管理</a>
							</dd>
							<%-- <dd>
								<a href="${pageContext.request.contextPath}/app/bgnavi/news/index" target="showFrame" style="text-decoration: none">新闻管理</a>
							</dd> --%>
						</dl>
					</li>
					<%-- <li class="layui-nav-item">
						<a href="javascript:;" style="text-decoration: none">查询</a>
						<dl class="layui-nav-child">
							<dd><a href="${pageContext.request.contextPath}/app/main/index/true/1" target="showFrame" style="text-decoration: none">全局查询</a></dd>
						</dl>
					</li> --%>
				</ul>
			</div>
			<!-- 右侧正式内容 -->
			<div style="width:88%;height:100%;float:left;">
				<iframe id="showFrame " name="showFrame" style="width:100%;height:100%"></iframe>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var element;
	layui.use('element',function(){
		element=layui.element;
	})
	$('#id_btn_user').click(function(){
		window.location.href="${pageContext.request.contextPath}/app/bgnavi/user/index"
	});
	$('#id_btn_hospital').click(function(){
		window.location.href="${pageContext.request.contextPath}/app/bgnavi/hospital/index"
	});
	$('#id_btn_bloodlib').click(function(){
		window.location.href="${pageContext.request.contextPath}/app/bgnavi/bloodlib/index"	
	});
	$('#id_btn_police').click(function(){
		window.location.href="${pageContext.request.contextPath}/app/bgnavi/police/index"
	});
	
	//退出
	$('#id_a_loginout').click(function(){
		
		$.when($.post('${pageContext.request.contextPath}/app/login/loginout')).done(function(data){
			if(data.success=="false"){
				alert(data.msg);
				window.location.href="${pageContext.request.contextPath}/app/login/index";
			}else{
				alert(data.msg);
				window.location.href="${pageContext.request.contextPath}/app/login/index";
			}
		});		
	})
</script>
</html>