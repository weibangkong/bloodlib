<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医院详情</title>
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
				<div style="width:100%;height:20%;padding :10px" aling="center">
					<form>
						<div class="row">
							<div class="col-md-12"><h3>医院信息:</h3></div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label></label>
									<div class="input-group">
										<span class="input-group-addon">医院名</span>
										<input type="text" class="form-control" id="userName"/>
									</div>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<label></label>
									<div class="input-group">
										<span class="input-group-addon">证件号码</span>
										<input type="text" class="form-control" id="certificateCode"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label></label>
									<div class="input-group">
										<span class="input-group-addon">是否是三甲医院</span>
										<input type="text" class="form-control" id="is3a"/>
									</div>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<label></label>
									<div class="input-group">
										<span class="input-group-addon">是否具有输血科室</span>
										<input type="text" class="form-control" id="ishasbloodlib"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10">
								<div class="form-group">
									<label></label>
									<div class="input-group">
										<span class="input-group-addon">地址</span>
										<input type="text" class="form-control" id="homeAddress"/>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div style="width:3%;height:5%;"><hr style="width:1%;height:1px;background-color:black;"></hr></div>
				<div style="width:100%;height:75%;padding:10px">
					<form>
						<div class="row">
							<div class="col-md-12"><h3>需血信息:</h3></div>
						</div>
						<table>
							<thead>
								<tr>
									<th style="width:90%"></th>
									<th style="width:10%"></th>
								</tr>
							</thead>
							<tbody id="id_tbody_list"></tbody>
						</table>
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
var aimId='${aimId}';
$(function(){
	loadAimData();
	loadNBTable();
})
$('input').attr('disabled','disabled');

function loadAimData(){
	$.when($.get('${pageContext.request.contextPath}/app/user/getaimdetailinfo',{aimId:aimId})).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else{
			row=data.rows[0];
			$('#userName').val(row.userName);
			$('#homeAddress').val(row.homeAddress);
			$('#certificateCode').val(row.homeAddress);
			if(row.is3a==1){
				$('#is3a').val("是");
			}else{
				$('#is3a').val("否");
			}
			if(row.ishasbloodlib==1){
				$('#ishasbloodlib').val("是");
			}else{
				$('#ishasbloodlib').val("否");
			}
		}
	});
}
function loadNBTable(){
	$('#id_tbody_list').empty();
	$.when($.get('${pageContext.request.contextPath}/app/needblood/getaimnblist',{aimId:aimId})).done(function(data){
		rows=data.rows;
		var li='';
		for(var i=0;i<rows.length;i++){
			if("0"==rows[i].isreceived){
				li+='<tr>';
				li+='<td>'+rows[i].needBloodPerson+'缺少'+rows[i].type1+' '+rows[i].type2+' 血型的血液'+rows[i].quantity+'cc，现向社会寻求帮助，广大市民踊跃献血。</td>';
				li+='<td>'+simpleDate(rows[i].createDate)+'</td>';
				li+='<tr/>';
			}
		}
		$('#id_tbody_list').append(li);
	})
}

//时间格式转换
function simpleDate(milliseconds) {
	if(milliseconds==null || milliseconds=="undefined"){
		return "";
	}
	var datetime = new Date();
	datetime.setTime(milliseconds);
	var year = datetime.getFullYear();
	var month = datetime.getMonth() + 1 < 10 ? "0"
			+ (datetime.getMonth() + 1) : datetime.getMonth() + 1;
	var date = datetime.getDate() < 10 ? "0" + datetime.getDate()
			: datetime.getDate();
	return year + "-" + month + "-" + date;
} 

</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>