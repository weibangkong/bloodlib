<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户详细信息</title>
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
					<label class="layui-form-label">身份</label>
					<div class="layui-input-block" id="role">
						<!-- 动态添加身份 -->
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
			<div id="id_div_isedit" style="height:70px;width:100px;">
				<button type="button" id="isedit" style="width:90%;height:60%;padding: 5px,5px,0px,5px" class="layui-btn  layui-btn-radius">编辑</button>
			</div>
			<div id="id_div_back" style="height:70px;width:100px;">
				<button type="button" id="back" style="width:90%;height:60%;padding: 5px,5px,0px,5px;display: none;" class="layui-btn  layui-btn-radius" >取消</button>
			</div>
			<div id="id_div_reset"style="height:70px;width:100px;">
				<button type="button" id="reset" style="width:90%;height:60%;padding: 5px,5px,0px,5px;display: none;" class="layui-btn  layui-btn-radius" >清空</button>
			</div>
			<div id="id_div_save"style="height:70px;width:100px;">
				<button type="button" id="save" style="width:90%;height:60%;padding: 5px,5px,0px,5px;display: none;" class="layui-btn  layui-btn-radius" >保存</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var userId='${userId}';
var layer;
layui.use('layer',function(){
	layer=layui.layer;
})
$(loadForm());

//加载页面form表单
function loadForm(){
	$('#role').empty();
	$('div input').attr('readonly',true);
	$.when($.get('${pageContext.request.contextPath}/app/user/getuserinfo/'+userId)).done(
			function(data){
				loadDataAndEXForm(data);
			}
	);
}

//点击编辑
$('#isedit').click(function(){
	clickEdit();
});

//点击编辑时按钮更改按钮样式
function clickEdit(){
	$('#back').css({"display":"inline"});
	$('#reset').css({"display":"inline"});
	$('#save').css({"display":"inline"});
	$('#isedit').css({"display":"none"});
	$('div input').attr('readonly',false);
}

//不点击编辑按钮更改按钮样式
function unClickEdit(){
	$('#back').css({"display":"none"});
	$('#reset').css({"display":"none"});
	$('#save').css({"display":"none"});
	$('#isedit').css({"display":"inline"});
	$('div input').attr('readonly',true);
}

//点击取消
$('#back').click(function(){
	location.reload();
});

//点击清空
$('#reset').click(function(){
	$('div input').val("");
});

//点击保存
$('#save').click(function(){
	var username=$('#userName').val();
	var address=$('#address').val();
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
			userId:userId,
			userName:username,
			homeAddress:address,
			tel:tel,
			email:email	
	}
	//先请求保存再重新获取数据
	$.when($.post('${pageContext.request.contextPath}/app/user/updatainfo',data)
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

//加载数据
function loadDataAndEXForm(data){
	$('#userName').val(data.userName);
	$('#address').val(data.homeAddress);
	$('#tel').val(data.tel);
	$('#email').val(data.email);
	if(data.roleId=="1")//个人
	{
		$('#role').append('<button type="button" class="layui-btn layui-btn-xs" disable="disable">个人</button>');
	}
	if(data.roleId=="2")//医院
	{
		$('#role').append('<button type="button" class="layui-btn layui-btn-xs" disable="disable">医院</button>');
	}
	if(data.roleId=="3")//血库
	{
		$('#role').append('<button type="button" class="layui-btn layui-btn-xs" disable="disable">血库</button>');
	}
	if(data.roleId=="4")//公安局
	{
		$('#role').append('<button type="button" class="layui-btn layui-btn-xs" disable="disable">公安局</button>');
	}
	if(data.roleId=="99")//系统管理员
	{
		$('#role').append('<button type="button" class="layui-btn layui-btn-xs" disable="disable">系统管理员</button>');
	}
}
</script>
</html>