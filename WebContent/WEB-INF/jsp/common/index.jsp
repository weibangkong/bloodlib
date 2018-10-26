<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<%@ include file="include.jsp" %>
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
  							<%-- <button type="button"  style="height:100%" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
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
  							</ul> --%>
						</div>
					</div>
					<div>
						<ul class="nav navbar-nav navbar-right">
						  <li><a href="#" id="id_nav_mypage"><h4 style="color: #FFFFFF;font-size: 16px;">个人主页</h4></a></li>
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
				<div style="width:100%;height:40%;padding :10px" aling="center">
					<jsp:include page="news.jsp"></jsp:include>
				</div>
				<div style="width:100%;height:75%;padding:10px">
					<div class="panel" style="width:57%;height: 60%;float:left;">
						<div class="panel-heading" style="height:50px;"><span class="panel-title" style="float:left"><h3>需血信息:</h3></span><span style="float:right;padding-bottom: 10px"><a>更多+<a></a></span></div>
						<div class="panel-body" style="height:310px;border: none">
							<table id="id_table_infoforuser" title="需血信息">
								<thead></thead>
								<tbody id="info_list"></tbody>
							</table>
						</div>
					</div>
					<div style="width:3%;height:60%;float:left" align="center">
						<div style="width:100%;height:10%;"></div>
						<hr style="width:1px;height:90%;background-color: #000000"/>
					</div>
					<div class="panel" style="width:40%;height: 60%;float:left;">
						<div class="panel-heading" style="height:50px;"><span class="panel-title" style="float:left"><h3>献血致谢:</h3></span><span style="float:right;padding-bottom: 10px"><a>更多+<a></a></span></div>
						<div class="panel-body" style="height:310px;border: none">
							<table id="" title="献血感谢">
								<thead></thead>
								<tbody id="info_list2"></tbody>
							</table>
						</div>
					</div>
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
//var aimId='${aimId}';
$(function(){
//	loadAimData();
	loadNBTable();
	loadthanksTable();
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
	$('#info_list').empty();
	$.when($.get('${pageContext.request.contextPath}/app/needblood/getlist',{page:1,limit:20,isReceived:0})).done(function(resultdata){
		var rows=resultdata.data;
		var li='';
		for(var i=0;i<rows.length;i++){
			if("0"==rows[i].isreceived){
				li+='<tr>';
				li+='<td>'+rows[i].needBloodPerson+'缺少'+rows[i].type1+' '+rows[i].type2+' 血型的血液'+rows[i].quantity+'cc，现向社会寻求帮助，广大市民踊跃献血。</td>';
				li+='<td>'+simpleDate(rows[i].createDate)+'</td>';
				li+='<tr/>';
			}
		}
		$('#info_list').append(li);
	})
}

function loadthanksTable(){
	$('#info_list2').empty();
	$.when($.get('${pageContext.request.contextPath}/app/donate/getdetaillist',{page:1,limit:20})).done(function(resultdata){
		var rows=resultdata.data;
		var li='';
		for(var i=0;i<rows.length;i++){
			if(rows[i].isaccepted!="0"&&null!=rows[i].isaccepted&&"null"!=rows[i].isaccepted&&"undefined"!=rows[i].isaccepted){
				li+='<tr>';
				li+='<td>感谢'+rows[i].donateer+'在'+rows[i].hosName+'捐献'+rows[i].type1+' '+rows[i].type2+'型血'+rows[i].quantity+'cc</td>';
				li+='<td>'+simpleDate(rows[i].donateDate)+'</td>';
				li+='<tr/>';
			}	
		}
		$('#info_list2').append(li);
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