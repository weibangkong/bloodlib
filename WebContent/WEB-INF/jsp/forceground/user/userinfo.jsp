<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息———个人</title>
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
						  <li ><a href="#" id="id_nav_nblist"><h4 style="color: #FFFFFF;font-size: 16px;">需血信息</h4></a></li>
						  <li ><a href="#" id="id_nav_mybt"><h4 style="color: #FFFFFF;font-size: 16px;">我的血型信息</h4></a></li>
						  <li ><a href="#" id="id_nav_nearhospital"><h4 style="color: #FFFFFF;font-size: 16px;">附近的医院 / 血库</h4></a></li>
						 <!--  <li ><a href="#" id="id_nav_nearbloodlib"><h4 style="color: #FFFFFF;font-size: 16px;">附近的血库</h4></a></li> -->
						</ul>
					</div>
				</div>
			</nav>
		</div><!-- 顶部导航栏div结束 -->
		<!-- 中间主体 -->
		<div style="width:100%;height:130%;">
			<!-- 左侧空白 -->
			<div style="width:15%;height:100%;float:left;background-color: #DDDDDE"></div>
			<div style="width:70%;height:100%;float:left;">
				<form id="id_form" class="layui-form" style="padding: 20px 5px">
					<table style="width:100%;">
						<tr>
							<td style="width:40%">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="userName">用户名</label>
									<div class="layui-input-block">
										<input type="text" class="form-control" id="userName" name="userName">
									</div>
								</div>
							</td>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="loginName">登录名</label>
									<div class="layui-input-block">
										<input type="text" class="form-control" id="loginName" name="loginName" readonly="readonly">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label"style="width:100px" for="tel">联系电话</label>
									<div class="layui-input-block">
										<input type="text" class="form-control" id="tel" name="tel">
									</div>
								</div>
							</td>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="email">邮箱</label>
									<div class="layui-input-block">
										<input type="text" class="form-control" id="email" name="email"/>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="sex">性别</label>
									<div class="layui-input-block">
										<select id="sex" name="sex">
											<option value=""></option>
											<option value="1">男</option>
											<option value="2">女</option>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td" colspan="2">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="homeAddress">家庭地址</label>
									<div class="layui-input-block">
										<input type="text" class="form-control" id="homeAddress" name="homeAddress">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="roleId">身份</label>
									<div class="layui-input-block">
										<button class="layui-btn layui-btn-success layui-btn-lg" disabled="disabled">个人</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="certificateType">证件类型</label>
									<div class="layui-input-block">
										<select id="certificateType" name="certificateType" lay-filter="certificateType">
											<option value=""></option>
											<option value="1">身份证</option>
											<option value="2">港澳台通行证</option>
											<option value="3">营业执照</option>
										</select>
									</div>
								</div>
							</td>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="certificateCode">证件号码</label>
									<div class="layui-input-block">
										<input type="text" class="form-control"id="certificateCode" name="certificateCode"/>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="provincial">省份</label>
									<div class="layui-input-block">
										<select id="provincial" name="provincial" lay-filter="provincial"></select>
									</div>
								</div>
							</td>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="areaId">城市</label>
									<div class="layui-input-block">
										<select id="areaId" name="areaId"></select>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<div align="center">
					<button class="btn btn-primary" id="id_btn_save">保存</button>
					<button class="btn btn-primary" id="id_btn_reset">重置</button>
				</div>
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
var form;
var layer;
var area;
layui.use(['form','layer'],function(){
	form=layui.form;
	layer=layui.layer;
	form.on('select(provincial)',function(obj){
		var proId=(obj.value);
		var citys=area[proId-1].citys;
		$('#areaId').empty();
		var li_city='<option value=""></option>';
		for(var i=0;i<citys.length;i++){
			li_city+='<option value="'+citys[i].cid+'">'+citys[i].city+'</option>';
		}
		$('#areaId').append(li_city);
		renderForm();
	});
});

$(function(){
	extendForm();
	loadData();
});

$('#id_btn_save').click(function(){
	var userName=$('#userName').val();
	var tel=$('#tel').val();
	var homeAddress=$('#homeAddress').val();
	var certificateType=$('#certificateType').val();
	var certificateCode=$('#certificateCode').val();
	var sex=$('#sex').val();
	var areaId=$('#areaId').val();
	var email=$('#email').val();
	
	if(userName==""){
		layer.tips('用户名不能为空','#userName',{
			tips:[3,'red']
		});
		return ;
	}
	if(tel==""){
		layer.tips('联系电话','#tel',{
			tips:[3,'red']
		});
		return ;
	}
	if(certificateCode==""){
		layer.tips('证件号码不能为空','#certificateCode',{
			tips:[3,'red']
		})
	}
	if(homeAddress==""){
		layer.tips('家庭地址不能为空','#homeAddress',{
			tips:[3,'red']
		});
		return ;
	}
	if(certificateType==""){
		layer.tips('证件类型不能为空','#certificateType',{
			tips:[3,'red']
		});
		return ;
	}else{
		if(isNaN(certificateType)){
			layer.tips('证件类型只能为数字','#certificateType',{
				tips:[3,'red']
			});
			return ;
		}
	}
	if(areaId==""){
		layer.tips('区域不能为空','#areaId',{
			tips:[3,'red']
		});
		return ;
	}
	
	var data={
			userName:userName,
			tel:tel,
			sex:sex,
			certificateType:certificateType,
			certificateCode:certificateCode,
			homeAddress:homeAddress,
			areaId:areaId,
			email:email
	}
	$.when($.post('${pageContext.request.contextPath}/app/user/updatemyuserinfo',data)).done(function(data){
		if(data.success=="true"){
			alert(data.msg);
		}else{
			alert(data.msg);
		}
	});
});
$('#id_btn_reset').click(function(){
	location.reload();
});

function renderForm(){
	layui.use('form',function(){
		form=layui.form;
		form.render();
	});
}

function extendForm(){
	//加载城市下拉框内容
	$.when($.get('${pageContext.request.contextPath}/app/area/getlist')).done(function(area_data){
		area=area_data.rows;
		//alert(area.length);
		var li_pro='<option value=""></option>'
		for(var i=0;i<area.length;i++){
			li_pro+='<option value="'+area[i].pid+'">'+area[i].provincial+'</option>';
		}
		$('#provincial').append(li_pro);
		renderForm();
	})
}

function loadData(){
	$.when($.get('${pageContext.request.contextPath}/app/user/getmyuserinfo')).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else if("true"==data.success){
			user=data.rows[0];
			$('#userName').val(user.userName);
			$('#loginName').val(user.loginName);
			$('#tel').val(user.tel);
			$('#email').val(user.email);
			$('#sex').val(user.sex);
			$('#homeAddress').val(user.homeAddress);
			$('#areaId').val(user.areaId);
			$('#certificateType').val(user.certificateType);
			$('#certificateCode').val(user.certificateCode);
		}
	});
}
</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>