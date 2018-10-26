<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码———医院</title>
<%@ include file="../../common/include.jsp" %>
<style type="text/css">
.navbar-default{
	color :#FFFFFF;
	background-color :#B328A5;
	border-color: none ;
	border-radius: 0px 0px 50px 50px;
}
tr{
	height:30px;
}
h3{
	color:#000000;
}
h4{
	color:#000000;
}
.blank-side{
	width: 15%;
	height: 100%;
	float: left;
	background-color: #DDDDDE;
}
.btn-circle {
  	background-color: #B328A5;
  	width: 80px;
  	height: 60px;
  	padding: 5px 5px;
  	font-size: 12px;
  	line-height: 1.428571429;
  	
/*  text-align: bootom; 
	border-radius: 25px;
  	-moz-border-radius: 25px;
   	-webkit-border-radius:25px; */
}
/* td{
	width: 40%;
} */
td>div{
	padding:5px 5px 5px 5px;
}
.data_td{
	width:40%;
}
</style>
</head>
<body style="width:100%;height:300%">
	<div style="width:100%;height:100%;position: absolute;">
		<div style="width:100%;height:50px;background-color: #DDDDDE" align="center">
			<nav style="width:100%;height:50px;padding:3px 10% 3px 5%" class="navbar-default navbar-fixed-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<!--  <a class="navbar-brand" href="#" style="background-color: #0A1A49">用户名</a> -->
						<div class="btn-group" style="padding-top: 5px">
  							<button type="button"  style="height:100%" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
  							 ${sessionScope.userName}
  							    <span class="caret"></span>
  							</button>
  							<ul class="dropdown-menu" style="background-color: #d9534f">
  								<li><a href="#" id="id_a_userinfo">个人信息</a></li>
    							<li><a href="#" id="id_a_updatepass">修改密码</a></li>
    							<li><a href="#" id="id_a_newmsg">新消息</a></li>
    							<li role="separator" class="divider"></li>
    							<li><a href="#" id="id_a_loginout">退出登陆</a></li>
  							</ul>
						</div>
					</div>
					<div>
						<ul class="nav navbar-nav navbar-right">
						  <li><a href="#" id="id_nav_firstpage"><h4 style="color: #FFFFFF;font-size: 16px;">首页</h4></a></li>
						  <li><a href="#" id="id_nav_nb"><h4 style="color: #FFFFFF;font-size: 16px;">发布新的信息</h4></a></li>
						  <li><a href="#" id="id_nav_nblist"><h4 style="color: #FFFFFF;font-size: 16px;">已发布的信息</h4></a></li>
						  <li><a href="#" id="id_nav_mybs"><h4 style="color: #FFFFFF;font-size: 16px;">本库血量库存量</h4></a></li>
						   <li ><a href="#" id="id_nav_nearhospital"><h4 style="color: #FFFFFF;font-size: 16px;">附近的医院 / 血库</h4></a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div><!-- 顶部导航栏div结束 -->
		<!-- 中间主体 -->
		<div style="width:100%;height:85%;">
			<!-- 左侧空白 -->
			<div style="width:15%;height:100%;float:left;background-color: #DDDDDE"></div>
			<div style="width:70%;height:100%;float:left;">
				<form>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4"></div>
						<div class="col-md-4"></div>
					</div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">旧密码</span>
									<input type="password" class="form-control" id="old_password" name="old_password"/>
								</div>
							</div>
						</div>
						<div class="col-md-4"></div>
					</div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">新密码</span>
									<input type="password" class="form-control" id="new_password" name="new_password"/>
								</div>
							</div>
						</div>
						<div class="col-md-4"></div>
					</div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">确认密码</span>
									<input type="password" class="form-control" id="new_password2" name="new_password2"/>
								</div>
							</div>
						</div>
						<div class="col-md-4"></div>
					</div>
					<div class="row">
						<div>
							<div class="col-md-5"></div>
							<div class="col-md-3">
								<button type="button" class="btn btn-primary" id="id_btn_save">确认修改</button>
								<button type="button" class="btn btn-primary" id="id_btn_back">取消</button>
							</div>
							<div class="col-md-4"></div>
						</div>
					</div>
				</form>
			</div>
			<!-- 右侧空白 -->
			<div style="width:15%;height:100%;float:left;background-color: #DDDDDE"></div>
		</div><!-- 中间主体div结束 -->
		<!-- 底部版权信息 -->
		<div style="width:100%;height:10%;background-color: #393132">
			<div style="width:20%;height:100%;float: left"></div>
			<div style="width:60%;height:100%;float: left;">
				<table style="text-align: left;width:100%">
					<tr>
						<td><font size="1px" color="#837C7D">作者:孔维邦</font></td>
						<td><font size="1px" color="#837C7D">联系电话:15397147949</font></td>
						<td><font size="1px" color="#837C7D">版权:孔维邦</font></td>
						<td><font size="1px" color="#837C7D">邮箱:weibangkong@outlook.com</font></td>
					</tr>
				</table>
			</div>
			<div style="width:20%;height:100%;float: left"></div>
		</div><!-- 底部版权div结束 -->
	</div>
</body>
<script type="text/javascript">
//确认修改
$('#id_btn_save').click(function(){
	var old_password=$('#old_password').val();
	var new_password=$('#new_password').val();
	var new_password2=$('#new_password2').val();
	
	data={
			old_password:old_password,
			new_password:new_password
	}
	$.when($.post('${pageContext.request.contextPath}/app/user/updatepassforuser',data)).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else{
			alert(data.msg);
			//跳转到登录界面
			//window.location.href=""
		}
	});
});
//取消
$('#id_btn_back').click(function(){
	window.location.href="${pageContext.request.contextPath}/app/fgnavi/hospital/index";
});

</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>