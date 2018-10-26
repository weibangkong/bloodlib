<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医院首页</title>
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
		<!-- 顶部导航栏 -->
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
						 <!--  <li><a href="#" id="id_nav_firstpage"><h4 style="color: #FFFFFF;font-size: 16px;">首页</h4></a></li> -->
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
		<div style="width:100%;height:150%;">
			<!-- 左侧空白 -->
			<div style="width:15%;height:100%;float:left;background-color: #DDDDDE"></div>
			<div style="width:70%;height:100%;float:left;">
				<!-- 上部新闻展示区 -->	
				<div style="width:100%;height:40%;">
					<jsp:include page="../common/news.jsp"></jsp:include>
				</div>
				<!-- 中部信息 -->
				<div style="width:75%;height:60%;float:left;">
					<div class="panel" style="width:100%;height: 60%;">
						<div class="panel-heading" style="height:50px;"><span class="panel-title" style="float:left"><h3>本院需血信息:</h3></span><span style="float:right;padding-bottom: 10px"><a>更多+<a></a></span></div>
						<div class="panel-body" style="height:310px;border: none">
							<table id="id_table_infoforuser" title="需血信息">
								<thead></thead>
								<tbody id="info_list"></tbody>
							</table>
						</div>
					</div>
					<div class="panel" style="width:100%;height: 40%;">
						<div class="panel-heading" style="height:50px;"><span class="panel-title" style="float:left"><h3>本院血液存余血量:</h3></span></div>
						<div class="panel-body" style="height:310px;border: none">
							<jsp:include page="bloodstock.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<div style="width:5%;height:60%;float:left" align="center"><div style="height:10%"></div><hr style="width:1px;height:85%" color="black"></div>
				<div style="width:20%;height:60%;float:left">
					<div class="panel" style="width:100;height:100%">
						<div class="panel-heading" style="height:50px;"><span class="panel-title" style="float:left"><h3>快捷入口:</h3></span></div>
						<div class="panel-body" style="height:310px;border: none">
							<!-- 第一排按钮 -->
							<div style="width:100%;height:70px">
								<div style="padding: 5px">
									<div style="width:50%;float: left">
										<button class="btn btn-circle" id="id_nb_new"><h6 style="color:#FFFFFF">发部新的<br>需血信息</h6></button>
									</div>
									<div style="width:50%;float: left">
										<button class="btn btn-circle" id="id_nb_my"><h6 style="color:#FFFFFF">我发布的<br>需血信息</h6></button>
									</div>
								</div>
							</div>
							<!-- 第二排按钮 -->
							<div style="width:100%;height:70px">
								<div style="padding: 5px">
									<div style="width:50%;float: left">
										<button class="btn btn-circle" id="id_bt_edit"><h6 style="color:#FFFFFF">修改血型<br>及匹配原则</h6></button>
									</div>
									<div style="width:50%;float: left">
										
										<button class="btn btn-circle" id="id_bs_edit"><h6 style="color:#FFFFFF">修改血量存余</h6></button>
									</div>
								</div>
							</div>
							<!-- 第三排按钮 -->
							<div style="width:100%;height:70px">
								<div style="padding: 5px">
									<div style="width:50%;float: left">
										<button class="btn btn-circle" id="id_donate_manage"><h6 style="color:#FFFFFF">预约处理</h6></button>
									</div>
									<div style="width:50%;float: left">
										<button class="btn btn-circle" id="id_bs_add"><h6 style="color:#FFFFFF">创建<br>血液存量</h6></button>
									</div>
								</div>
							</div>
							<!-- 第三排按钮 -->
							<div style="width:100%;height:70px">
								<div style="padding: 5px">
									<div style="width:100%;float: left">
										<button class="btn btn-circle" id="id_con_admin" style="width:95%"><h6 style="color:#FFFFFF">联系管理员</h6></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 右侧空白 -->
			<div style="width:15%;height:100%;float:left;background-color: #DDDDDE"></div>
		</div><!-- 中间主体div结束 -->
		<!-- 底部版权信息 -->
		<div style="width:100%;height:80px;background-color: #393132">
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
	getNeedBloodInfo();
});

function getNeedBloodInfo(){
	$.when($.get(basePath+"needblood/getmylist",{isReceived:0})).done(function(data){
		var rows=data.rows;
		var li="";
		if(rows.length<10){
			for(var i=0;i<rows.length;i++){
				li+="<tr><td><h4>";
				li+=rows[i].needBloodPerson+" 缺少 "+rows[i].type1+" "+rows[i].type2+" 血型的血液"+rows[i].quantity+"cc，现向社会寻求帮助，广大市民踊跃献血。";
				li+= "</h4></td></tr>"
			}
		}else{
			for(var i=0;i<10;i++){
				li+="<tr><td><h4>";
				li+=rows[i].needBloodPerson+" 缺少 "+rows[i].type1+" "+rows[i].type2+" 血型的血液"+rows[i].quantity+"cc，现向社会寻求帮助，广大市民踊跃献血。";
				li+= "</h4></td></tr>"
			}
		}
		$('#info_list').append(li);
	});
}

</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>