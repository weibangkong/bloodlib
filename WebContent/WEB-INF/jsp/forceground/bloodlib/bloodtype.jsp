<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血型及匹配原则</title>
<%@ include file="../../common/include.jsp" %>
<style type="text/css">
.navbar-default{
	color :#FFFFFF;
	background-color :#B328A5;
	border-color: none ;
	border-radius: 0px 0px 50px 50px;
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
						  <li><a href="#" id="id_nav_mybs"><h4 style="color: #FFFFFF;font-size: 16px;">本库血量库存量</h4></a></li>
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
				<div style="width:60%;height:100%;float:left;padding :10px" aling="center">
					<h3>血型列表:</h3>
					<div>
						<table class="table table-bordered" style="padding-top:5px">
							<thead>
								<tr>
									<td style="width:15%">血型</td>
									<td style="width:30%">可接收血型</td>
									<td style="width:30%">可输出血型</td>
									<td style="width:20%">操作</td>
								</tr>
							</thead>
							<tbody id="id_tbody_list"></tbody>
						</table>
					</div>
				</div>
				<div style="width:1%;height:100%;float:left"><div style="height:4%"></div><hr style="width:1px;height:85%;background-color:black;"></hr></div>
				<div style="width:39%;height:100%;padding:10px;float:left">
					<h3>血型详细信息:</h3>
					<form>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="#type1"></label>
									<div class="input-group">
										<span class="input-group-addon">血液类型1</span>
										<input type="text" class="form-control" id="type1" name="type1"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="#type2"></label>
									<div class="input-group">
										<span class="input-group-addon">血液类型2</span>
										<input type="text" class="form-control" id="type2" name="type2"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="#inputType"></label>
									<div class="input-group">
										<span class="input-group-addon">可接受血型</span>
										<input type="text" class="form-control" id="inputType" name="inputType"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="#outputType"></label>
									<div class="input-group">
										<span class="input-group-addon">可输出血型</span>
										<input type="text" class="form-control" id="outputType" name="outputType"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="#reamrk"></label>
									<div class="input-group">
										<span class="input-group-addon">备注</span>
										<textarea  rows="6" class="form-control" id="reamrk" name="reamrk"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" align="center">
								<hr style="width:80%;height:1px;">
							</div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-2">
								<button type="button" class="btn btn-warning btn-sm" id="edit">编辑</button>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-2">
								<button type="button" class="btn btn-primary btn-sm" id="save">保存</button>
							</div>
							<div class="col-md-2">
								<button type="button" class="btn btn-sm" id="back">取消</button>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-2">
								<!-- <button type="button" class="btn btn-success btn-sm" id="add">新增</button> -->
							</div>
							<div class="col-md-1"></div>
						</div>
					</form>
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
var old_bloodTypeId;

$(function(){
	loadBTTable();
	setReadonly();
})


$('#edit').click(function(){
	removeReadonly();
});

$('#save').click(function(){
	var bloodTypeId=old_bloodTypeId;
	var type1=$('#type1').val();
	var type2=$('#type2').val();
	var inputType=$('#inputType').val();
	var outputType=$('#outputType').val();
	var remark=$('#remark').val();
	
	data={
			bloodTypeId:bloodTypeId,
			type1:type1,
			type2:type2,
			inputType:inputType,
			outputType:outputType,
			remark:remark
	}
	
	$.when($.post('${pageContext.request.contextPath}/app/bloodtype/update',data)).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else{
			alert(data.msg);
			//执行完毕重新默认禁用
			setReadonly();
			loadBTTable();
		}
	})
});

$('#back').click(function(){
	//执行完毕重新默认禁用
	$.when($.get('${pageContext.request.contextPath}/app/bloodtype/getinfo',{btid:old_bloodTypeId})).done(function(data){
		$('#type1').val(data.type1);
		$('#type2').val(data.type2);
		$('#inputType').val(data.inputType);
		$('#outputType').val(data.outputType);
		$('#remark').val(data.remark);
	});
	setReadonly();
});

$('#add').click(function(){
	
});
//设置禁用
function setReadonly(){
	$('input').attr("readonly","readonly");
	$('textarea').attr("readonly","readonly");
}
//取消禁用
function removeReadonly(){
	$('input').removeAttr("readonly");
	$('textarea').removeAttr("readonly");
}

function loadBTTable(){
	$('#id_tbody_list').empty();
	$.when($.get('${pageContext.request.contextPath}/app/bloodtype/getlistforfg')).done(function(data){
		rows=data.rows;
		var li='';
		for(var i=0;i<rows.length;i++){
		li+='<tr>';
		li+='<td>'+rows[i].type1+" "+rows[i].type2+'</td>';
		li+='<td>'+rows[i].inputType+'</td>';
		li+='<td>'+rows[i].outputType+'</td>';
		li+='<td>'+'<button type="button" class="btn btn-info" onclick="showdetail('+rows[i].bloodTypeId+')">选择</button>  <button type="button" class="btn btn-danger btn-xs" onclick="deletebt('+rows[i].bloodTypeId+')">删除</button>'+'</td>';
		li+='<tr/>';
		}
		$('#id_tbody_list').append(li);
	})
}

function showdetail(btid){
	$.when($.get('${pageContext.request.contextPath}/app/bloodtype/getinfo',{btid:btid})).done(function(data){
		old_bloodTypeId=data.bloodTypeId;
		$('#type1').val(data.type1);
		$('#type2').val(data.type2);
		$('#inputType').val(data.inputType);
		$('#outputType').val(data.outputType);
		$('#remark').val(data.remark);
	});
}

function deletebt(btid){
	$.when($.post('${pageContext.request.contextPath}/app/bloodtype/delete',{btid:btid})).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else{
			alert(data.msg);
			loadBTTable();
		}
	})
}

</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>