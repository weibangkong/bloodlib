<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改需血信息———医院</title>
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
  							 <%= session.getAttribute("userName") %>
  							 <input id="userId" hidden="hidden" value="${sessionScope.userId}"/>
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
						  <li><a href="#" id="id_nav_mybs"><h4 style="color: #FFFFFF;font-size: 16px;">本院血量库存量</h4></a></li>
						  <li ><a href="#" id="id_nav_nearhospital"><h4 style="color: #FFFFFF;font-size: 16px;">附近的医院 / 血库</h4></a></li>
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
									<label class="layui-form-label" style="width:100px" for="needBleedPerson">需血者姓名</label>
									<div class="layui-input-block">
										<input type="text" class="form-control" id="needBleedPerson" name="needBleedPerson" readonly="readonly">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="certificateType">证件类型</label>
									<div class="layui-input-block">
										<select id="certificateType" name="certificateType" disabled="disabled">
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
									<label class="layui-form-label"style="width:100px" for="certificateCode">证件号码</label>
									<div class="layui-input-block">
										<input type="text" class="form-control" id="certificateCode" name="certificateCode" readonly="readonly">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="type1">血液类型1</label>
									<div class="layui-input-block">
										<select id="type1" name="type1"></select>
									</div>
								</div>
							</td>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px">血液类型2</label>
									<div class="layui-input-block">
										<select id="type2" name="type2"></select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data_td">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="quantity">需求量</label>
									<div class="layui-input-block">
										<input type="text" id="quantity" name="quantity" class="form-control"/>
									</div>
								</div>
							</td>
						</tr>
						<!-- <tr>   //医院或血库自动填充所在区域
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
						</tr> -->
						<tr>
							<td colspan="2">
								<div class="layui-form-item">
									<label class="layui-form-label" style="width:100px" for="remark">备注</label>
									<div class="layui-input-block">
										<textarea class="form-control" rows="6" id="remark" name="remark"></textarea>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<div align="center">
					<button type="button" class="btn btn-primary" id="id_btn_save">保存</button>
					<button type="button" class="btn btn-primary" id="id_btn_back">取消</button>
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
var needBloodId='${needBloodId}';
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
	autoLoadData();
});

$('#id_btn_save').click(function(){
	var needBloodPerson=$('#needBleedPerson').val();
	var tel=$('#tel').val();
	var certificateType=$('#certificateType').val();
	var certificateCode=$('#certificateCode').val();
	var type1=$('#type1').val();
	var type2=$('#type2').val();
	var quantity=$('#quantity').val();
	var areaId=$('#areaId').val();
	var remark=$('#remark').val();
	
	if(needBloodPerson==""){
		layer.tips('需血者姓名不能为空','#needBloodPerson',{
			tips:[3,'red']
		});
		return ;
	}
	if(certificateCode==""){
		layer.tips('证件号码不能为空','#certificateCode',{
			tips:[3,'red']
		})
	}
	if(type1==""){
		layer.tips('血液类型1不能为空','#type1',{
			tips:[3,'red']
		});
		return ;
	}
	if(quantity==""){
		layer.tips('需求量不能为空','#quantity',{
			tips:[3,'red']
		});
		return ;
	}else{
		if(isNaN(quantity)){
			layer.tips('需求量只能为数字','#quantity',{
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
			needBloodId:needBloodId,
			needBloodPerson:needBloodPerson,
			//tel:tel,
			certificateType:certificateType,
			certificateCode:certificateCode,
			type1:type1,
			type2:type2,
			quantity:quantity,
			//areaId:areaId,
			remark:remark
	}
	$.when($.post('${pageContext.request.contextPath}/app/needblood/updateforuser',data)).done(function(data){
		if(data.success=="true"){
			alert(data.msg);
		}else{
			alert(data.msg);
		}
	});
});
//取消按钮
$('#id_btn_back').click(function(){
	location.reload();
});
//渲染表单
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
	$.when($.get('${pageContext.request.contextPath}/app/area/getlist')).done(function(area_data){
		area=area_data.rows;
		//alert(area.length);
		var li_pro='<option value=""></option>'
		for(var i=0;i<area.length;i++){
			li_pro+='<option value="'+area[i].pid+'">'+area[i].provincial+'</option>';
		}
		$('#provincial').append(li_pro);
		renderForm();
	});
}
function autoLoadData(){
	$.when($.get('${pageContext.request.contextPath}/app/needblood/getinfo',{nbid:needBloodId})).done(function(data){
		$('#needBleedPerson').val(data.needBloodPerson);
		//$('#loginName').val(user.loginName);
		//$('#areaId').val(user.areaId);
		$('#certificateType').val(data.certificateType);
		$('#certificateCode').val(data.certificateCode);
		$('#type1').val(data.type1);
		$('#type2').val(data.type2);
		$('#quantity').val(data.quantity);
		$('#remark').val(data.remark);
	});
}
</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>