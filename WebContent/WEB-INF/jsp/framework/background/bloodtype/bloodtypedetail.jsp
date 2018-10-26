<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血型详细信息</title>
<style type="text/css">
</style>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:90%;height:90%;padding: 10px 10px 10px 10px">
		<!-- 表单 -->
		<div style="width:85%;height:100%;float: left;">
			<form style="width:100%" class="layui-form">
				<table style="width:100%;"cellspacing="20">
					<tr>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="type1">血型类别1:</label>
								<div class="layui-input-block">
									<input type="text" id="type1" class="form-control" name="type1" placeholder="请输入第一种血型类别">
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="type2">血型类别2:</label>
								<div class="layui-input-block">
									<input type="text"  id="type2" class="form-control" name="type2" placeholder="请输入第二种血型类别">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="inputType">输入血型:</label>
								<div class="layui-input-block">
									<input type="text" id="inputType" class="form-control" name="inputType" placeholder="请输入可输入血型">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="layui-form-item">
								<label style="width:100px" class="layui-form-label" for="outputType">输出血型:</label>
								<div class="layui-input-block">
									<input type="text" id="outputType" class="form-control" name="outputType" placeholder="请输入可输出血型">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="layui-form-item">
								<label class="layui-form-label" for="remark">备注:</label>
								<div class="layui-input-block">
									<textarea class="form-control" rows="4" placeholder="请输入备注" id="remark" name="remark"></textarea>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 按钮 -->
		<div style="width:15%;height:100%;float: left;">
			<button id="id_btn_edit" class="layui-btn" style="position: absolute; top: 30px;right:60px;width:90px;display: none"><i class="layui-icon">&#xe642;</i>编辑</button>
			<button id="id_btn_back" class="layui-btn" style="position: absolute; top: 80px;right:60px;width:90px;display: none"><i class="layui-icon"></i>取消</button>
			<button id="id_btn_reset" class="layui-btn" style="position: absolute; bottom: 60px;right:60px;width:90px;display: none"><i class="layui-icon">&#x1002;</i>清空</button>
			<button id="id_btn_save" class="layui-btn" style="position: absolute; bottom: 10px;right:60px;width:90px;display: none"><i class="layui-icon">&#xe618;</i>保存</button>
		</div>	
	</div>
</body>
<script type="text/javascript">
var operation='${opera}';
var bloodTypeId;
var layer;
var form;
layui.use(['form','layer'],function(){
	form=layui.form;
	layer=layui.layer;
});
$(function(){
	if(operation=="edit"){
		bloodTypeId='${bloodTypeId}';
		loadForm();
		editDefaultCSS();
	}
	if(operation=="add"){
		addDefaultCSS();
	}
})
//修改时页面初始样式
	function editDefaultCSS(){
	$('#id_btn_edit').css({"display":"inline"});
	$('#id_btn_back').css({"display":"none"});
	$('#id_btn_reset').css({"display":"none"});
	$('#id_btn_save').css({"display":"none"});
	$('div input').attr("readonly",true);
	}
//添加时按钮初始样式
	function addDefaultCSS(){
		$('#id_btn_edit').css({"display":"none"});
		$('#id_btn_back').css({"display":"none"});
		$('#id_btn_reset').css({"display":"inline"});
		$('#id_btn_save').css({"display":"inline"});
	}
	//点击编辑按钮时
	$('#id_btn_edit').click(function(){
		$('#id_btn_edit').css({"display":"none"});
		$('#id_btn_back').css({"display":"inline"});
		$('#id_btn_reset').css({"display":"inline"});
		$('#id_btn_save').css({"display":"inline"});
		$('div input').attr("readonly",false);
	});
	//点击取消按钮时
	$('#id_btn_back').click(function(){
		/* $('id_btn_edit').css({'display':'inline'});
		$('id_btn_back').css({'display':'none'});
		$('id_btn_reset').css({'display':'none'});
		$('id_btn_save').css({'display':'none'}); */
		location.reload();
	});
	//清空按钮
	$('#id_btn_reset').click(function(){
		$("input").val("");
		$("textarea").val("");
	});
	
	//保存按钮
	$('#id_btn_save').click(function(){
		var data;
		if($('#type1').val()==""){
			layer.tips('血型类别1不能为空','#type1');
			return ;
		}
		if(operation=="add"){
			 data={
					type1:$('#type1').val(),
					type2:$('#type2').val(),
					outputType:$('#outputType').val(),
					inputType:$('#inputType').val(),
					remark:$('#remark').val()
			}
			 $.when($.post('${pageContext.request.contextPath}/app/bloodtype/insert',data)
					 ).done(function(data){
						 if(data.success=="false"){
							 layer.msg(data.msg,{
				  					time:1600,
				  					icon:2
				  					});
						 }else{
							 layer.msg(data.msg,{
				  					time:1600,
				  					icon:1,
				  					end:function(){
				  						var index=parent.layer.getFrameIndex(window.name);
				  						parent.layer.close(index);
				  					}
				  					});
						 }
			 });
			
		}
		if(operation=="edit"){
			 data={
					bloodTypeId:bloodTypeId,
					type1:$('#type1').val(),
					type2:$('#type2').val(),
					outputType:$('#outputType').val(),
					inputType:$('#inputType').val(),
					remark:$('#remark').val()
			}
			 $.when($.post('${pageContext.request.contextPath}/app/bloodtype/update',data)
					 ).done(function(data){
						if(data.success="false"){
							layer.msg(data.msg,{
			  					time:1600,
			  					icon:2
			  					});
						}else{
							layer.msg(data.msg,{
			  					time:1600,
			  					icon:1,
			  					end:function(){
			  						var index=parent.layer.getFrameIndex(window.name);
			  						parent.layer.close(index);
			  						
			  					}
			  					});
						}
						
					 });
			
		};
	});
	
	function loadForm(){
		$.when($.get('${pageContext.request.contextPath}/app/bloodtype/getinfo',{btid:bloodTypeId})
				).done(function(data){
					loadDataAndExForm(data);
				});
	}
	
	function loadDataAndExForm(data){
		$('#type1').val(data.type1);
		$('#type2').val(data.type2);
		$('#inputType').val(data.inputType);
		$('#outputType').val(data.outputType);
		//inputtypes=(data.inputType).split(",");
		//for(var i=0;i<inputtypes.length;i++){
			//$('#inputtype1').val(inputtypes[i]);
		//}
	}
</script>
</html>