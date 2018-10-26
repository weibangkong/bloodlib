<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血液存量</title>
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
		<div style="width:100%;height:150%;">
			<!-- 左侧空白 -->
			<div style="width:15%;height:100%;float:left;background-color: #DDDDDE"></div>
			<div style="width:70%;height:100%;float:left;">
				<form class="layui-form" style="width:100%;padding: 10px 5px">
					<!-- A Rh+ title-->
					<div class="row">
						<div class="col-md-2"><h3>A Rh+</h3></div>
						<div class="col-md-7"><input type="hidden" id="a_yang_id"/></div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<div class="progress">
 								<div class="progress-bar progress-bar-success progress-bar-striped" id="id_a_yang_quantity">
   									
  								</div>
  								<div class="progress-bar progress-bar-danger" id="id_a_yang_safe">
   									
  								</div>
  								<div class="progress-bar" id="id_a_yang_max">
   							 		
  								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="button-group" style="float:left">
								<button type="button" class="btn btn-primary btn-xs" name="edit" id="a_yang_edit" onclick="startEdit('a_yang')">编辑</button>
								<button type="button" class="btn btn-success btn-xs" name="save" id="a_yang_save" onclick="saveEdit('a_yang')">保存</button>
								<button type="button" class="btn btn-xs" name="back" id="a_yang_back" onclick="backEdit('a_yang')">取消</button>
								<button type="button" class="btn btn-warning btn-xs" name="create" id="a_yang_create" onclick="createStock('a_yang')">创建</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">当前库存</span>
									<input class="form-control" id="a_yang_quantity"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">安全库存</span>
									<input class="form-control" id="a_yang_safe"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">最大库存</span>
									<input class="form-control" id="a_yang_max"/>
								</div>
							</div>
						</div>
					</div>
					
					<!-- A Rh--->
					<div class="row">
						<div class="col-md-2"><h3>A Rh-</h3></div>
						<div class="col-md-7"><input type="hidden" id="a_yin_id"/></div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<div class="progress">
 								<div class="progress-bar progress-bar-success progress-bar-striped" id="id_a_yin_quantity">
   									
  								</div>
  								<div class="progress-bar progress-bar-danger" id="id_a_yin_safe">
   									
  								</div>
  								<div class="progress-bar" id="id_a_yin_max">
   							 		
  								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="button-group" style="float:left">
								<button type="button" class="btn btn-primary btn-xs" name="edit" id="a_yin_edit" onclick="startEdit('a_yin')">编辑</button>
								<button type="button" class="btn btn-success btn-xs" name="save" id="a_yin_save" onclick="saveEdit('a_yin')">保存</button>
								<button type="button" class="btn btn-xs" name="back" id="a_yin_back" onclick="backEdit('a_yin')">取消</button>
								<button type="button" class="btn btn-warning btn-xs" name="create" id="a_yin_create" onclick="createStock('a_yin')">创建</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">当前库存</span>
									<input class="form-control" id="a_yin_quantity"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">安全库存</span>
									<input class="form-control" id="a_yin_safe"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">最大库存</span>
									<input class="form-control" id="a_yin_max"/>
								</div>
							</div>
						</div>
					</div>
					
					<!-- B Rh+  -->
					<div class="row">
						<div class="col-md-2"><h3>B Rh+</h3></div>
						<div class="col-md-7"><input type="hidden" id="b_yang_id"/></div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<div class="progress">
 								<div class="progress-bar progress-bar-success progress-bar-striped" id="id_b_yang_quantity">
   									
  								</div>
  								<div class="progress-bar progress-bar-danger" id="id_b_yang_safe">
   									
  								</div>
  								<div class="progress-bar" id="id_b_yang_max">
   							 		
  								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="button-group" style="float:left">
								<button type="button" class="btn btn-primary btn-xs" name="edit" id="b_yang_edit" onclick="startEdit('b_yang')">编辑</button>
								<button type="button" class="btn btn-success btn-xs" name="save" id="b_yang_save" onclick="saveEdit('b_yang')">保存</button>
								<button type="button" class="btn btn-xs" name="back" id="b_yang_back" onclick="backEdit('b_yang')">取消</button>
								<button type="button" class="btn btn-warning btn-xs" name="create" id="b_yang_create" onclick="createStock('b_yang')">创建</button>
							</div>
						</div>
					</div>
					<div class="row"><!-- B Rh+ container -->
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">当前库存</span>
									<input class="form-control" id="b_yang_quantity"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">安全库存</span>
									<input class="form-control" id="b_yang_safe"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">最大库存</span>
									<input class="form-control" id="b_yang_max"/>
								</div>
							</div>
						</div>
					</div>
					
					<!-- B Rh- -->
					<div class="row">
						<div class="col-md-2"><h3>B Rh-</h3></div>
						<div class="col-md-7"><input type="hidden" id="b_yin_id"/></div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<div class="progress">
 								<div class="progress-bar progress-bar-success progress-bar-striped" id="id_b_yin_quantity">
   									
  								</div>
  								<div class="progress-bar progress-bar-danger" id="id_b_yin_safe">
   									
  								</div>
  								<div class="progress-bar" id="id_b_yin_max">
   							 		
  								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="button-group" style="float:left">
								<button type="button" class="btn btn-primary btn-xs" name="edit" id="b_yin_edit" onclick="startEdit('b_yin')">编辑</button>
								<button type="button" class="btn btn-success btn-xs" name="save" id="b_yin_save" onclick="saveEdit('b_yin')">保存</button>
								<button type="button" class="btn btn-xs" name="back" id="b_yin_back" onclick="backEdit('b_yin')">取消</button>
								<button type="button" class="btn btn-warning btn-xs" name="create" id="b_yin_create" onclick="createStock('b_yin')">创建</button>
							</div>
						</div>
					</div>
					<div class="row"><!-- B Rh- container -->
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">当前库存</span>
									<input class="form-control" id="b_yin_quantity"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">安全库存</span>
									<input class="form-control" id="b_yin_safe"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">最大库存</span>
									<input class="form-control" id="b_yin_max"/>
								</div>
							</div>
						</div>
					</div>
					
					<!-- AB Rh+ -->
					<div class="row">
						<div class="col-md-2"><h3>AB Rh+</h3></div>
						<div class="col-md-7"><input type="hidden" id="ab_yang_id"/></div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<div class="progress">
 								<div class="progress-bar progress-bar-success progress-bar-striped" id="id_ab_yang_quantity">
   									
  								</div>
  								<div class="progress-bar progress-bar-danger" id="id_ab_yang_safe">
   									
  								</div>
  								<div class="progress-bar" id="id_ab_yang_max">
   							 		
  								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="button-group" style="float:left">
								<button type="button" class="btn btn-primary btn-xs" name="edit" id="ab_yang_edit" onclick="startEdit('ab_yang')">编辑</button>
								<button type="button" class="btn btn-success btn-xs" name="save" id="ab_yang_save" onclick="saveEdit('ab_yang')">保存</button>
								<button type="button" class="btn btn-xs" name="back" id="ab_yang_back" onclick="backEdit('ab_yang')">取消</button>
								<button type="button" class="btn btn-warning btn-xs" name="create" id="ab_yang_create" onclick="createStock('ab_yang')">创建</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">当前库存</span>
									<input class="form-control" id="ab_yang_quantity"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">安全库存</span>
									<input class="form-control" id="ab_yang_safe"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">最大库存</span>
									<input class="form-control" id="ab_yang_max"/>
								</div>
							</div>
						</div>
					</div>
					
					<!-- AB Rh- -->
					<div class="row">
						<div class="col-md-2"><h3>AB Rh-</h3></div>
						<div class="col-md-7"><input type="hidden" id="ab_yin_id"/></div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<div class="progress">
 								<div class="progress-bar progress-bar-success progress-bar-striped" id="id_ab_yin_quantity">
   									
  								</div>
  								<div class="progress-bar progress-bar-danger" id="id_ab_yin_safe">
   									
  								</div>
  								<div class="progress-bar" id="id_abyin_max">
   							 		
  								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="button-group" style="float:left">
								<button type="button" class="btn btn-primary btn-xs" name="edit" id="ab_yin_edit" onclick="startEdit('ab_yin')">编辑</button>
								<button type="button" class="btn btn-success btn-xs" name="save" id="ab_yin_save" onclick="saveEdit('ab_yin')">保存</button>
								<button type="button" class="btn btn-xs" name="back" id="ab_yin_back" onclick="backEdit('ab_yin')">取消</button>
								<button type="button" class="btn btn-warning btn-xs" name="create" id="ab_yin_create" onclick="createStock('ab_yin')">创建</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">当前库存</span>
									<input class="form-control" id="ab_yin_quantity"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">安全库存</span>
									<input class="form-control" id="ab_yin_safe"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">最大库存</span>
									<input class="form-control" id="ab_yin_max"/>
								</div>
							</div>
						</div>
					</div>
					
					<!-- O Rh+ -->
					<div class="row">
						<div class="col-md-2"><h3>O Rh+</h3></div>
						<div class="col-md-7"><input type="hidden" id="o_yang_id"/></div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<div class="progress">
 								<div class="progress-bar progress-bar-success progress-bar-striped" id="id_o_yang_quantity">
   									
  								</div>
  								<div class="progress-bar progress-bar-danger" id="id_o_yang_safe">
   									
  								</div>
  								<div class="progress-bar" id="id_o_yang_max">
   							 		
  								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="button-group" style="float:left">
								<button type="button" class="btn btn-primary btn-xs" name="edit" id="o_yang_edit" onclick="startEdit('o_yang')">编辑</button>
								<button type="button" class="btn btn-success btn-xs" name="save" id="o_yang_save" onclick="saveEdit('o_yang')">保存</button>
								<button type="button" class="btn btn-xs" name="back" id="o_yang_back" onclick="backEdit('o_yang')">取消</button>
								<button type="button" class="btn btn-warning btn-xs" name="create" id="o_yang_create" onclick="createStock('o_yang')">创建</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">当前库存</span>
									<input class="form-control" id="o_yang_quantity"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">安全库存</span>
									<input class="form-control" id="o_yang_safe"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">最大库存</span>
									<input class="form-control" id="o_yang_max"/>
								</div>
							</div>
						</div>
					</div>
					
					<!-- O Rh- -->
					<div class="row">
						<div class="col-md-2"><h3>O Rh-</h3></div>
						<div class="col-md-7"><input type="hidden" id="o_yin_id"/></div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<div class="progress">
 								<div class="progress-bar progress-bar-success progress-bar-striped" id="id_o_yin_quantity">
   									
  								</div>
  								<div class="progress-bar progress-bar-danger" id="id_o_yin_safe">
   									
  								</div>
  								<div class="progress-bar" id="id_o_yin_max">
   							 		
  								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="button-group" style="float:left">
								<button type="button" class="btn btn-primary btn-xs" name="edit" id="o_yin_edit" onclick="startEdit('o_yin')">编辑</button>
								<button type="button" class="btn btn-success btn-xs" name="save" id="o_yin_save" onclick="saveEdit('o_yin')">保存</button>
								<button type="button" class="btn btn-xs" name="back" id="o_yin_back" onclick="backEdit('o_yin')">取消</button>
								<button type="button" class="btn btn-warning btn-xs" name="create" id="o_yin_create" onclick="createStock('o_yin')">创建</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">当前库存</span>
									<input class="form-control" id="o_yin_quantity"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">安全库存</span>
									<input class="form-control" id="o_yin_safe"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label></label>
								<div class="input-group">
									<span class="input-group-addon">最大库存</span>
									<input class="form-control" id="o_yin_max"/>
								</div>
							</div>
						</div>
					</div>
				</form>
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
//默认页面加载出是数据不可被修改
$(function(){
	loadData();
})
$('input').attr('readonly','readonly');
$('[name=edit]').css({"display":"none"})
$('[name=save]').css({"display":"none"});
$('[name=back]').css({"display":"none"});
//$('[name=create]').css({"display":"none"});
function loadData(){
	$.when($.get('${pageContext.request.contextPath}/app/bloodstock/getlist')).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else{
			rows=data.rows;
			for(var i=0;i<rows.length;i++){
				if("A"==rows[i].type1){
					if("Rh+"==rows[i].type2){
						$('#a_yang_quantity').val(rows[i].stockQuantity);
						$('#a_yang_safe').val(rows[i].safeStock);
						$('#a_yang_max').val(rows[i].maxStock);
						$('#a_yang_id').val(rows[i].bloodStockId);
						calPro(rows[i],'a_yang');
						$('#a_yang_edit').css({"display":"inline"});
						$('#a_yang_create').css({"display":"none"});
					}
					if("Rh-"==rows[i].type2){
						$('#a_yin_quantity').val(rows[i].stockQuantity);
						$('#a_yin_safe').val(rows[i].safeStock);
						$('#a_yin_max').val(rows[i].maxStock);
						$('#a_yin_id').val(rows[i].bloodStockId);
						calPro(rows[i],'a_yin');
						$('#a_yin_edit').css({"display":"inline"});
						$('#a_yin_create').css({"display":"none"});
					}
				}
				if("B"==rows[i].type1){
					if("Rh+"==rows[i].type2){
						$('#b_yang_quantity').val(rows[i].stockQuantity);
						$('#b_yang_safe').val(rows[i].safeStock);
						$('#b_yang_max').val(rows[i].maxStock);
						$('#b_yang_id').val(rows[i].bloodStockId);
						calPro(rows[i],'b_yang');
						$('#b_yang_edit').css({"display":"inline"});
						$('#b_yang_create').css({"display":"none"});
					}
					if("Rh-"==rows[i].type2){
						$('#b_yin_quantity').val(rows[i].stockQuantity);
						$('#b_yin_safe').val(rows[i].safeStock);
						$('#b_yin_max').val(rows[i].maxStock);
						$('#b_yin_id').val(rows[i].bloodStockId);
						calPro(rows[i],'b_yin');
						$('#b_yin_edit').css({"display":"inline"});
						$('#b_yin_create').css({"display":"none"});
					}
				}
				if("AB"==rows[i].type1){
					if("Rh+"==rows[i].type2){
						$('#ab_yang_quantity').val(rows[i].stockQuantity);
						$('#ab_yang_safe').val(rows[i].safeStock);
						$('#ab_yang_max').val(rows[i].maxStock);
						$('#ab_yang_id').val(rows[i].bloodStockId);
						calPro(rows[i],'ab_yang');
						$('#ab_yang_edit').css({"display":"inline"});
						$('#ab_yang_create').css({"display":"none"});
					}
					if("Rh-"==rows[i].type2){
						$('#ab_yin_quantity').val(rows[i].stockQuantity);
						$('#ab_yin_safe').val(rows[i].safeStock);
						$('#ab_yin_max').val(rows[i].maxStock);
						$('#ab_yin_id').val(rows[i].bloodStockId);
						calPro(rows[i],'ab_yin');
						$('#ab_yin_edit').css({"display":"inline"});
						$('#ab_yin_create').css({"display":"none"});
					}
				}
				if("O"==rows[i].type1){
					if("Rh+"==rows[i].type2){
						$('#o_yang_quantity').val(rows[i].stockQuantity);
						$('#o_yang_safe').val(rows[i].safeStock);
						$('#o_yang_max').val(rows[i].maxStock);
						$('#o_yang_id').val(rows[i].bloodStockId);
						calPro(rows[i],'o_yang');
						$('#o_yang_edit').css({"display":"inline"});
						$('#o_yang_create').css({"display":"none"});
					}
					if("Rh-"==rows[i].type2){
						$('#o_yin_quantity').val(rows[i].stockQuantity);
						$('#o_yin_safe').val(rows[i].safeStock);
						$('#o_yin_max').val(rows[i].maxStock);
						$('#o_yin_id').val(rows[i].bloodStockId);
						calPro(rows[i],'o_yin');
						$('#o_yin_edit').css({"display":"inline"});
						$('#o_yin_create').css({"display":"none"});
					}
				}
			}
			
		}
	});
}
//启用编辑
function startEdit(type){
	$('#'+type+'_quantity').attr("readonly",false);
	$('#'+type+'_safe').attr("readonly",false);
	$('#'+type+'_max').attr("readonly",false);
	$('#'+type+'_edit').css({"display":"none"});
	$('#'+type+'_save').css({"display":"inline"});
	$('#'+type+'_back').css({"display":"inline"});
}
//保存编辑
function saveEdit(type){
	var bloodStockId=$('#'+type+"_id").val();
	var stockQuantity=$('#'+type+'_quantity').val();
	var safeStock=$('#'+type+'_safe').val();
	var maxStock=$('#'+type+'_max').val();
	var data={
			bloodStockId:bloodStockId,
			stockQuantity:stockQuantity,
			safeStock:safeStock,
			maxStock:maxStock
	}
	$.when($.post('${pageContext.request.contextPath}/app/bloodstock/update',data)).done(function(data){
		if(data.success=="false"){
			alert(data.msg);
		}else{
			alert(data.msg);
			//进度条变化
			var quantity=stockQuantity/maxStock;
			var safe=safeStock/maxStock-quantity;
			$('#id_'+type+'_quantity').css({'width':quantity*100+'%'});
			$('#id_'+type+'_safe').css({'width':safe*100+'%'});
			//按钮变化
			$('#'+type+'_edit').css({"display":"inline"});
			$('#'+type+'_save').css({"display":"none"});
			$('#'+type+'_back').css({"display":"none"});
			//文本框不可编辑
			$('#'+type+'_quantity').attr("readonly",true);
			$('#'+type+'_safe').attr("readonly",true);
			$('#'+type+'_max').attr("readonly",true);
		}
	})
}
//取消方法
function backEdit(type){
	var bloodStockId=$('#'+type+"_id").val();
	$.when($.get('${pageContext.request.contextPath}/app/bloodstock/getinfobybsid',{bloodStockId:bloodStockId})).done(function(data){
		if(data.success=="false"){
			alert(data.msg);
		}else{
			row=data.rows[0];
			//值
			$('#'+type+'_quantity').val(row.stockQuantity);
			$('#'+type+'_safe').val(row.safeStock);
			$('#'+type+'_max').val(row.maxStock);
			//按钮
			$('#'+type+'_edit').css({"display":"inline"});
			$('#'+type+'_save').css({"display":"none"});
			$('#'+type+'_back').css({"display":"none"});
			//文本
			$('#'+type+'_quantity').attr("readonly",true);
			$('#'+type+'_safe').attr("readonly",true);
			$('#'+type+'_max').attr("readonly",true);
		}
	})
}

function createStock(type){
	var type1;
	var type2;
	if("a_yang"==type){
		type1="A";
		type2="Rh+"
	}
	if("a_yin"==type){
		type1="A";
		type2="Rh-"
	}
	if("b_yang"==type){
		type1="B";
		type2="Rh+"	
	}
	if("b_yin"==type){
		type1="B";
		type2="Rh-"
	}
	if("ab_yang"==type){
		type1="AB";
		type2="Rh+"
	}
	if("ab_yin"==type){
		type1="AB";
		type2="Rh-"
	}
	if("o_yang"==type){
		type1="O";
		type2="Rh+"
	}
	if("o_yin"==type){
		type1="O";
		type2="Rh-"
	}
	
	data={
			type1:type1,
			type2:type2
	}
	
	$.when($.post('${pageContext.request.contextPath}/app/bloodstock/createstockforuser',data)).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else{
			alert(data.msg);
			location.reload();
		}
	});
}
//装载进度条进度
function calPro(data,type){
	var stockQuantity=data.stockQuantity;
	var maxStock=data.maxStock;
	var safeStock=data.safeStock;
	var quantity=stockQuantity/maxStock;
	var safe=safeStock/maxStock-quantity;
	$('#id_'+type+'_quantity').html((quantity*100).toFixed(2)+'%');
	$('#id_'+type+'_quantity').css({'width':(quantity*100).toFixed(2)+'%'});
	$('#id_'+type+'_safe').html(((safeStock/maxStock)*100).toFixed(2)+'%');
	$('#id_'+type+'_safe').css({'width':(safe*100).toFixed(2)+'%'});
	//$('#id_pro_a_max').css({'width':'10%'});
}
</script>
<jsp:include page="../common/clickfunction.jsp"></jsp:include>
</html>