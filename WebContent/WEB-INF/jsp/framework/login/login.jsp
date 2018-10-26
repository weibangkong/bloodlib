<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人体血库系统-登陆</title>
<%@include file="../../common/include.jsp" %>
</head>
<body>
<div>
	<div style="width:100%;height:100%;margin-top: 15%;" align="center">
		<div style="width:30%;height:20%;">
			<form>
				<div class="from-group">
					<label for="#loginname"></label>
						<div class="input-group">
							<div class="input-group-addon">登录名:</div>
							<input type="text" class="form-control" id="loginname" placeholder="登录名">
						</div>
				</div>
				<div class="from-group">
					<label for="#password"></label>
					<div class="input-group">
						<div class="input-group-addon"> 密&nbsp&nbsp&nbsp码:</div>
						<input type="password" class="form-control" id="password" placeholder="密码">
					</div>
				</div>
				<div class="form-group" style="margin-top: 10px">
					<a href="javascript:void(0)" class="btn btn-success" id="id_login_button">登录</a>
					<a href="javascript:void(0)" class="btn btn-info" id="id_regist_button">新用户注册</a>
				</div>
			</form>
		</div>
	</div>
		
</div>
</body>
<script type="text/javascript">
	$("#id_login_button").click(function(){
		
		var loginname=$("#loginname").val();
		var password=$("#password").val();		
			$.ajax({
				url : '${pageContext.request.contextPath}/app/login/checklogin',
				type : 'GET',
				async : false,
				data : {
					loginname : loginname,
					password : password
					},
				 success : function(data){
					var data=data;
					if(data =="false"){
						alert("账户密码错误，请重新输入");
					}else{
						window.location.href="${pageContext.request.contextPath}"+data;
					}
					//window.location.href="${pageContext.request.contextPath}"+data;
					/* if(data=="true"){
						alert("login success");
						
					}else{
						alert("登陆失败");
					}  */
				} 
			});
	})
	$("#id_regist_button").click(function(){
		window.location.href="${pageContext.request.contextPath}/app/regist/index"
	})
</script>
</html>
