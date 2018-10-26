<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增血液存量</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%">
		<div style="width:80%;height:100%;float:left">
			<form class="layui-form">
				<table>
					<tr>
						<td colspan="2" align="center"><input type="text" id="userName" name="userName" class="form-control" disabled="disabled"></td>
					</tr>
					<tr>
						<td>
							<div class="layui-form-item">
								<label class="layui-form-label">血液类型1</label>
								<div class="layui-input-block">
									<select id="type1" name="type1"></select>
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label class="layui-form-label">血液类型2</label>
								<div class="layui-input-block">
									<select id="type2" name="type2"></select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="layui-form-item">
								<label class="layui-form-label">当前库存量</label>
								<div class="layui-input-block">
									<input type="text" class="form-control" id="stockQuantity" name="stockQuantity"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="layui-form-item">
								<label class="layui-form-label">安全库存量</label>
								<div class="layui-input-block">
									<input type="text" class="form-control" id="safeStock" name="safeStock"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="layui-form-item">
								<label class="layui-form-label">最大库存量</label>
								<div class="layui-input-block">
									<input type="text" class="form-control" id="maxStock" name="maxStock"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><button type="button" class="layui-btn" id="id_btn_save">保存</button></td>
					</tr>
				</table>
			</form>
		</div>
		<div style="width:20%;height:100%;float:left">
		
		</div>
	</div>
</body>
<script type="text/javascript">
var userId='${userId}';
layui.use('form',function(){
	form=layui.form;
});

$(function(){
	setUserName();
	extendForm();
});
function setUserName(){
	$.when($.get('${pageContext.request.contextPath}/app/user/getuserinfo/'+userId)).done(function(data){
		$('#userName').val(data.userName);
	});
}

function renderForm(){
	layui.use('form',function(){
		form=layui.form;
		form.render();
	});
}

function extendForm(){
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
}
$('#id_btn_save').click(function(){
	var stockQuantity=$('#stockQuantity').val();
	var safeStock=$('#safeStock').val();
	var maxStock=$('#maxStock').val();
	var type1=$('#type1').val();
	var type2=$('#type2').val();
	
	var data={
			userId:userId,
			stockQuantity:stockQuantity,
			safeStock:safeStock,
			maxStock:maxStock,
			type1:type1,
			type2:type2
	}
	$.when($.post('${pageContext.request.contextPath}/app/bloodstock/addstock',data)).done(function(data){
		if("false"==data.success){
			alert(data.msg);
		}else{
			alert(data.msg);
			var index=parent.parent.layer.getFrameIndex();
			parent.layer.close(index);
		}
	})
})
</script>
</html>