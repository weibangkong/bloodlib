<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>献血详细信息页</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%;padding: 10px 10px 10px 10px;position: absolute;">
		<!-- 表单 -->
		<div style="width:100%;height:80%;">
			<form style="width:100%" class="layui-form" id="donate_form">
				<table style="width:100%;"cellspacing="20">
					<tr>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="donateer">姓名:</label>
								<div class="layui-input-block">
									<input type="text" class="form-control" id="donateer" name="donateer" placeholder="请输入献血者姓名"/>
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="certificateCode">身份证号:</label>
								<div class="layui-input-block">
									<input type="text" id="certificateCode" class="form-control" name="certificateCode" placeholder="请输入身份证号"/>
								</div>
							</div>
						</td>
						<!-- <td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="donateDate">献血时间:</label>
								<div class="layui-input-block">
									<input type="text" id="donateDate" class="form-control" name="donateDate" placeholder="请输入或选择日期"/>
								</div>
							</div>
						</td> -->
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="isaccepted">状态:</label>
								<div class="layui-input-block" id="id_isaccepted_div">
								</div>
							</div>
							<input type="hidden" id="donateId" name="donateId">
							<input type="hidden"  id="userId" name="userId"/>
							<input type="hidden" id="donateHos" name="donateHos"/>
						</td>
					</tr>
					<tr>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="type1">血型类别1:</label>
								<div class="layui-input-block">
									<select id="type1" name="type1"></select>
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="type2">血型类别2:</label>
								<div class="layui-input-block">
									<select id="type2" name="type2"></select>
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="quantity">献血量:</label>
								<div class="layui-input-block">
									<input type="text" id="quantity" class="form-control" name="quantity" placeholder="请输入献血量"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="provincial">省份:</label>
								<div class="layui-input-block">
									<select id="provincial" name="provincial" lay-filter="provincial"></select>
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item" id="div_area" display="display">
								<label style="width:100px" class="layui-form-label" for="areaId">城市:</label>
								<div class="layui-input-block">
									<select id="areaId" name="areaId" lay-filter="areaId"></select>
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="hosName">献血地点:</label>
								<div class="layui-input-block">
									<input type="text" id="hosName" class="form-control" name="hosName" placeholder="请输入献血地点">
								</div>
							</div>
						</td>
					</tr>
					<tr>

						
					</tr>
					<!-- <tr>
						<td colspan="2">
							<div class="layui-form-item">
								<label class="layui-form-label" for="remark">备注:</label>
								<div class="layui-input-block">
									<textarea class="form-control" rows="4" placeholder="请输入备注" id="remark" name="remark"></textarea>
								</div>
							</div>
						</td>
					</tr> -->
				</table>
			</form>
		</div>
		<!-- 按钮 -->
		<div style="width:100%;height:20%;">
			<button id="id_btn_edit" class="layui-btn" style="width:90px;display:none"><i class="layui-icon">&#xe642;</i>编辑</button>
			<button id="id_btn_back" class="layui-btn" style="width:90px;display:none"><i class="layui-icon"></i>取消</button>
			<!-- <button id="id_btn_reset" class="layui-btn" style="width:90px;"><i class="layui-icon">&#x1002;</i>清空</button> -->
			<button id="id_btn_save" class="layui-btn" style="width:90px;display:none"><i class="layui-icon">&#xe618;</i>保存</button>
			<button id="id_btn_accept" class="layui-btn layui-btn-normal" style="float:right;display: none"><i class="layui-icon">&#xe618;</i>入库</button>
			<button id="id_btn_notaccept" class="layui-btn layui-btn-danger" style="float:right;display: none"><i class="layui-icon">&#x1006;</i>销毁</button>
		</div>	
	</div>
</body>
<script type="text/javascript">
var form;
var layer;
var laydate;
var opera = '${opera}';
var donateId;
var area;
layui.use([ 'form', 'layer','laydate'], function() {
	form = layui.form;
	layer = layui.layer;
	laydate=layui.laydate;
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
	/* ,on('select(areaId)',function(obj){
		var areaId=(obj.value);
		alert(areaId);
	}); */
	/* form.on('select(areaId)',function(obj){
		var areaId=(obj.value);
		alert(areaId);
		/* $('#hospital').empty();
		var li_city='<option value=""></option>';
		for(var i=0;i<citys.length;i++){
			li_city+='<option value="'+citys[i].cid+'">'+citys[i].city+'</option>';
		}
		$('#areaId').append(li_city);
		renderForm(); 
	}); */
	laydate.render({
		elem:'#donateDate'
	});
});
$(function(){
	extendForm();
	if("edit"==opera){
		donateId='${donateId}';
		loadData();
		$('input').attr('readonly','readonly');
		$('#id_btn_edit').css({'display':'inline'});
	}else if("add"==opera){
		$('#id_btn_save').css({'display':'inline'});
		var has_not_isaccepted='<button type="button" class="layui-btn layui-btn-normal layui-btn-xs">未入库</button>';
		$('#id_isaccepted_div').append(has_not_isaccepted);
	}
})
function renderForm() {
	layui.use(['form','laydate'], function() {
		form = layui.form;
		laydate=layui.laydate;
		form.render();
	});
}
function extendForm() {
	//加载血型
	$.when($.get('${pageContext.request.contextPath}/app/bloodtype/getBT'))
			.done(
					function(bt_data) {
						var type1s = bt_data[0];
						var type2s = bt_data[1];

						var li_1 = '<option value=""></option>';
						var li_2 = '<option value=""></option>';

						for (var i = 0; i < type1s.length; i++) {
							li_1 += '<option value="'+type1s[i]+'">'
									+ type1s[i] + '</option>';
						}

						for (var j = 0; j < type2s.length; j++) {
							li_2 += '<option value="'+type2s[j]+'">'
									+ type2s[j] + '</option>';
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
	})
}
function loadData(){
	var can_not_isaccepted='<button type="button" class="layui-btn layui-btn-danger layui-btn-xs" disabled="disabled">不能入库</button>'
	var has_not_isaccepted='<button type="button" class="layui-btn layui-btn-normal layui-btn-xs">未入库</button>'
	var has_isaccepted='<button type="button" class="layui-btn layui-btn-xs">已入库</button>'
	if("edit"==opera){
		$.when($.get('${pageContext.request.contextPath}/app/donate/getinfo',{'donateId':donateId})).done(function(data){
			$("#donate_form").form('load',data);
			if("1"==data.isaccepted){//已入库
				$('#id_isaccepted_div').append(has_isaccepted);
			}else if("2"==data.isaccepted){//血液检验存在异常，不可入库
				$('#id_isaccepted_div').append(can_not_isaccepted);
			}else{//未入库
				$('#id_isaccepted_div').append(has_not_isaccepted);
				$('#id_btn_notaccept').css({'display':'inline'});
				$('#id_btn_accept').css({'display':'inline'});
			}
		});
	}
}
$('#id_btn_accept').click(function(){
	$.when($.get('${pageContext.request.contextPath}/app/donate/setaccepted',{'donateId':donateId})).done(function(data){
		alert(data.msg);
		$('#id_btn_accept').css({'display':'none'});
	})
})
//点击编辑按钮时
$('#id_btn_edit').click(function(){
	$('#id_btn_edit').css({"display":"none"});
	$('#id_btn_back').css({"display":"inline"});
	$('#id_btn_reset').css({"display":"inline"});
	$('#id_btn_save').css({"display":"inline"});
	$('#id_btn_accept').css({'display':'none'});
	$('#id_btn_notaccept').css({'display':'none'});
	$('div input').attr("readonly",false);
});

//取消
$('#id_btn_back').click(function(){
	window.location.reload();
});
//保存
$('#id_btn_save').click(function(){
	var url;
	var data=$('#donate_form').serialize();
	if(opera=="edit"){
		url='${pageContext.request.contextPath}/app/donate/editforadmin';
	}else if(opera=="add"){
		url='${pageContext.request.contextPath}/app/donate/applydonate';
	}
	$.when($.post(url,data)).done(function(data){
		if(data.success=="true"){
			alert(data.msg);
			$('#id_btn_edit').css({"display":"inline"});
			$('#id_btn_back').css({"display":"none"});
			$('#id_btn_reset').css({"display":"none"});
			$('#id_btn_save').css({"display":"none"});
			$('#id_btn_accept').css({'display':'inline'});
			$('#id_btn_notaccept').css({'display':'inline'});
			$('div input').attr("readonly",true);
		}else if(data.success=="false"){
			alert(data.msg);
		}
	});

});
</script>
</html>