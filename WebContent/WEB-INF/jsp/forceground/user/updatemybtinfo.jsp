<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的血型信息</title>
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
						<!--   <li ><a href="#" id="id_nav_nearbloodlib"><h4 style="color: #FFFFFF;font-size: 16px;">附近的血库</h4></a></li> -->
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
				<form id="id_form" class="layui-form" style="padding: 20px 5px">
					<div class="row" style="padding-top: 15%">
						<div class="col-md-1"></div>
						<div class="col-md-4">
							<div class="layui-form-item">
								<label class="layui-form-label" style="width:100px" for="type1">血液类型1</label>
								<div class="layui-input-block">
									<select id="type1" name="type1"></select>
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-4">
							<div class="layui-form-item">
								<label class="layui-form-label" style="width:100px" for="type2">血液类型2</label>
								<div class="layui-input-block">
									<select id="type2" name="type2"></select>
								</div>
							</div>
						</div>
						<div class="col-md-2"></div>
					</div>
				</form>
				<div align="center">
					<button class="btn btn-primary" id="id_btn_save">保存</button>
					<button class="btn btn-primary" id="id_btn_back">取消</button>
				
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
});

$(function(){
	extendForm();
	autoLoadData();
});

$('#id_btn_save').click(function(){
	var type1=$('#type1').val();
	var type2=$('#type2').val();
	if(type1==""){
		layer.tips('血液类型1不能为空','#type1',{
			tips:[3,'red']
		});
		return ;
	}
	var data={
			type1:type1,
			type2:type2,
	}
	$.when($.post('${pageContext.request.contextPath}/app/user/updatebtinfoforuser',data)).done(function(data){
		if(data.success=="true"){
			alert(data.msg);
		}else{
			alert(data.msg);
		}
	});
});
$('#id_btn_back').click(function(){
	location.reload();
});

function renderForm(){
	layui.use('form',function(){
		form=layui.form;
		form.render();
	});
}

function extendForm(){
	//加载血型下拉框内容
	$.when($.get('${pageContext.request.contextPath}/app/bloodtype/getBT')).done(function (bt_data){
		var type1s=bt_data[0];
		var type2s=bt_data[1];
		
		var li_1='<option value=""></option>';
		var li_2='<option value=""></option>';
		
		for(var i=0;i<type1s.length;i++){
			li_1+='<option value="'+type1s[i]+'">'+type1s[i]+'</option>';
		}
		
		for(var j=0;j<type2s.length;j++){
			li_2+='<option value="'+type2s[j]+'">'+type2s[j]+'</option>';
		}
		$("#type1").append(li_1);
		$("#type2").append(li_2);
		renderForm();
	});
	//加载城市下拉框内容
	/* $.when($.get('${pageContext.request.contextPath}/app/area/getlist')).done(function(area_data){
		area=area_data.rows;
		//alert(area.length);
		var li_pro='<option value=""></option>'
		for(var i=0;i<area.length;i++){
			li_pro+='<option value="'+area[i].pid+'">'+area[i].provincial+'</option>';
		}
		$('#provincial').append(li_pro);
		renderForm();
	}) */
}
function autoLoadData(){
	$.when($.get('${pageContext.request.contextPath}/app/user/getmydetailinfo')).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else{
			row=data.rows[0];
			$('#type1').val(row.type1);
			$('#type2').val(row.type2);
			renderForm();
		}
	})
}

</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>