<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我发布的需血信息———血库</title>
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
				<div style="width:87%;height:100%;float:left;padding :10px" aling="center">
					<h3>本库已发布的需血信息</h3>
					<div>
						<table class="table table-hover" style="padding-top:5px">
							<thead>
								<tr>
									<td style="width:60%">内容</td>
									<td style="width:10%">发布时间</td>
									<td style="width:10%">状态</td>
									<td style="width:20%">操作</td>
								</tr>
							</thead>
							<tbody id="id_tbody_list"></tbody>
						</table>
					</div>
				</div>
				<div style="width:3%;height:100%;float:left"><div style="height:8%"></div><hr style="width:1px;height:85%;background-color:black;"></hr></div>
				<div style="width:10%;height:100%;float:left">放各种按钮</div>
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
$(function(){
	loadNBTable();
})


function loadNBTable(){
	$('#id_tbody_list').empty();
	$.when($.get('${pageContext.request.contextPath}/app/needblood/getmynblistwithorder')).done(function(data){
		rows=data.rows;
		var li='';
		for(var i=0;i<rows.length;i++){
		li+='<tr>';
		li+='<td>'+'本院缺少 '+rows[i].type1+' '+rows[i].type2+' 血型的血液'+rows[i].quantity+'cc，现向社会寻求帮助，广大市民踊跃献血。</td>';
		li+='<td>'+rows[i].createDate+'</td>';
		li+='<td>'+dealIsReceived(rows[i].isreceived)+'</td>';
		if("0"==rows[i].isreceived){
			li+='<td>'+'<button class="btn btn-warning" onclick="opendetail('+rows[i].needBloodId+')">修改</button>  <button class="btn btn-danger btn-sm" onclick="deleteNB('+rows[i].needBloodId+')">删除</button>'+'</td>';
		}else{
			li+='<td>'+'<button class="btn btn-danger btn-sm" onclick="deleteNB('+rows[i].needBloodId+')">删除</button>'+'</td>';
		}
		li+='<tr/>';
		}
		$('#id_tbody_list').append(li);
	})
}

function dealIsReceived(data){
	if("0"==data){
		return '<button class="layui-btn layui-btn-xs" disabled="disabled">未解决</button>'
	}else{
		return '<button class="layui-btn layui-btn-normal layui-btn-xs" disabled="disabled">已解决</button>'
	}
}

function opendetail(nbid){
	window.location.href="${pageContext.request.contextPath}/app/fgnavi/updateneedblood?nbid="+nbid;
}
</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>