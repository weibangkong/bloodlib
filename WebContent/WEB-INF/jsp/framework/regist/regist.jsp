<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<%@include file="../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%;position: absolute;">
		<!-- 图片 -->
		<div style="width:60%;height:100%;float:left;"></div>
		<!-- 表单区域 -->
		<div style="width:40%;height:100%;float: left;" >
			<div style="width:100%;height:10%;" >	
				<h1 style="padding-left:10%"></h1>
			</div>
			<div style="width:100%;height:75%">
				<form id="id_regist_form" action="${pageContext.request.contextPath}/app/regist/doregist" method="POST" style="width:65%;padding-left :10%">
					<div class="form-group">
						<label for="#username">姓名</label>
						<input type="text" class="form-control input-lg" placeholder="姓名" id="username" name="username">
					</div>
					<div class="form-group">
						<label for="loginname">登录名</label>
						<input type="text" class="form-control input-lg" placeholder="登录名" id="loginname" name="loginname">
					</div>
					<div class="form-group">
						<label for="#password">密码</label>
						<input type="text" class="form-control input-lg" placeholder="密码" id="password" name="password">
					</div>
					<div class="form-group">
						<label for="#password2">确认密码</label>
						<input type="text" class="form-control input-lg" placeholder="确认密码" id="password2" name="password2">
					</div>
					<div class="form-group">
<!-- 						<div class="input-group-btn input-group-lg">
							<select class="form-control" id="beforetel">
								<option value="0">+86</option>
								<option value="1">+865</option>
							</select>
						</div> -->
						<label for="#tel">联系电话</label>
						<input type="text" class="form-control input-lg" placeholder="联系电话" id="tel" name="tel">
					</div>
					<div class="form-group">
						<label for="#role">身份</label>
						<select class="form-control input-lg" id="role" name="role" required>
							<option value="0">请选择您的身份</option>
							<option value="1">个人</option>
							<option value="2">医院</option>
							<option value="3">血库</option>
							<option value="4">公安局</option>
						</select>
					</div>
					<div class="form-group">
						<a href="javascript:void(0)"  style="width:100%" class="btn btn-success btn-lg" id="id_btn_regist">注册</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$("#role").change(function(){
	/* 当角色发生变化时想页面动态添加的代码 */
	 /* alert($("#role").val());  */
});
 $("#id_btn_regist").click(function(){
	var username=cutData($("#username").val());
	var loginname=cutData($("#loginname").val());
	var password=cutData($("#password").val());
	var password2=cutData($("#password2").val());
	var tel=cutData($("#tel").val());
	var role=cutData($("#role").val());

	if(username.length<=0){
		alert("姓名不能为空");
		return ;
	}
	if(loginname.length<=0){
		alert("登录名不能为空");
		return ;
	}
	if(password.length<6||password.length>16){
		alert("请输入长度为6~16位的密码");
		return ;
	}
	if(password!=password2){
		alert("两次输入的密码不一致，请重新填写");
		return ;
	}
	if(tel.length<=0){
		alert("联系电话不能为空");
		return ;
	}
	if(role=="0"){
		alert("请选择身份");
		return ;
	}
	$.when($.post('${pageContext.request.contextPath}/app/regist/doregist',{username:username,loginname:loginname,password:password,tel:tel,role:role})
	).done(function(data){
		var data=data;
		var msg=data.msg;
		var success=data.success;
		alert(msg+success);
	});
});
function cutData(data){
	if(data==""||data=="undefined"){
		return "";
	}else{
		return data;
	}
}
/* $("#id_btn_regist").click(function(){
	alert("111");
	$("#id_regist_form").data('bootstrapValidator').validate();
	if(!$("#id_regist_form").data('bootstrapValidator').isValid()){
		alert('222');
		return ;
	}
}); */
//bootstrap表单验证，因调试尚未通过，暂不添加该功能
/* $("#id_regist_form").bootstrapValidator({
	message:'该项未验证',
	excluded:[':disabled',':hidden'],
	feedbackIcon:{
		valid:'glyphicon glyphicon-ok',
		invalid:'glyphicon glyphicon-remove',
		validating:'glyphicon glyphicon-refresh'
	},
	fields:{
		username:{
			message:'姓名验证失败',
			validators:{
				noEmpty:{
					message:'姓名不能为空'
				},
				stringLength:{
					min:16,
					max:32,
					message:'姓名长度不正确'
				}
			}
		}
	}
	}).on('success.form.bv',function(e){
	e.preventDefault();	
}); */
</script>
</html>