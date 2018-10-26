<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%">
		<div style="width:70%;heigth:100%;float:left;">
			<form id="id_user_form" class="layui-form" style="padding-top:10px">
				<div class="layui-form-item col-sm-8">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input " id="userName" name="userName">
					</div>
				</div>
				<div class="layui-form-item col-sm-8">
					<label class="layui-form-label">登录名</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input " id="loginName" name="loginName">
					</div>
				</div>
				<div class="layui-form-item col-sm-8">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input " id="password" name="password">
					</div>
				</div>
				<div class="layui-form-item col-sm-8">
					<label class="layui-form-label">身份</label>
					<div class="layui-input-block" id="role">
						<select id="roleId" name="roleId">
							<option value=""></option>
							<option value="1">个人</option>
							<option value="2">医院</option>
							<option value="3">血库</option>
							<option value="4">公安局</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item col-sm-8">
					<label class="layui-form-label">电话</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" id="tel" name="tel">
					</div>
				</div>
				<div class="layui-form-item col-sm-8">
					<label class="layui-form-label">地址</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" id="address" name="address" >
					</div>
				</div>
				<div class="layui-form-item col-sm-8">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" id="email" name="email">
					</div>
				</div>
			</form>
		</div>
		<div style="width:100px;height:100%;float:right;margin-top: 10px">
			<div id="id_div_reset"style="height:70px;width:100px;">
				<button type="button" id="reset" style="width:90%;height:60%;padding: 5px,5px,0px,5px;" class="layui-btn  layui-btn-radius" >清空</button>
			</div>
			<div id="id_div_save"style="height:70px;width:100px;">
				<button type="button" id="save" style="width:90%;height:60%;padding: 5px,5px,0px,5px;" class="layui-btn  layui-btn-radius" >保存</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var layer;
var form;
layui.use(['form','layer'],function(){
	layer=layui.layer;
})

function renderForm(){
	form.render();
}

//点击清空
$('#reset').click(function(){
	$('div input').val("");
});

//点击保存
$('#save').click(function(){
	var username=$('#userName').val();
	var loginName=$('#userName').val();
	var password=$('#password').val();
	var address=$('#address').val();
	var roleId=$('#roleId').val()
	var tel=$('#tel').val();
	var email=$('#email').val();
	if(username==""){
		layer.tips('用户名不能为空','#userName');
		return ;
	}
	if(tel==""){
		layer.tips('联系电话不能为空','#tel');
		return ;
	}
	var data={
			userName:username,
			loginName:loginName,
			password:password,
			roleId:roleId,
			homeAddress:address,
			tel:tel,
			email:email	
	}
	//先请求保存再重新获取数据
	$.when($.post('${pageContext.request.contextPath}/app/regist/doregist',data)
			).done(function(data){
				if(data.success=="true"){
					layer.msg(data.msg,{
						time:1600,
						icon:1
					});
				}else{
					layer.msg(data.msg,{
						time:1600,
						icon:2
					});
				}
				location.reload();
			});
});
</script>
</html>