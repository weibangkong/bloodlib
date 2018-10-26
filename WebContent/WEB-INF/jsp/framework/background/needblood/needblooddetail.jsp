<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增需血信息</title>
<%@ include file="../../../common/include.jsp"%>
</head>
<body>
	<div style="width: 100%; height: 100%; margin-top: 10px;">
		<div style="width: 80%; height: 100%; float: left">
			<form class="layui-form" id="id_form_edit">
				<table style="width: 100%">
					<tr>
						<td>
							<div class="layui-form-item">
								<label style="width: 100px" class="layui-form-label"
									for="userName">需血者姓名</label>
								<div class="layui-input-block">
									<input type="text" class="form-control" name="userName"
										id="userName">
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label style="width: 100px" class="layui-form-label" for="tel">联系电话</label>
								<div class="layui-input-block">
									<input type="text" class="form-control" id="tel" name="tel">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="layui-form-item">
								<label style="width: 100px" class="layui-form-label" for="type1">血液类型1</label>
								<div class="layui-input-block">
									<select name="type1" id="type1">
									</select>
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label style="width: 100px" class="layui-form-label" for="type2">血液类型2</label>
								<div class="layui-input-block">
									<select name="type2" id="type2">
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="layui-form-item">
								<label style="width: 100px" class="layui-form-label"
									for="quantity">需求量</label>
								<div class="layui-input-block">
									<input type="text" class="form-control" name="quantity"
										id="quantity">
								</div>
							</div>
						</td>
						<td>
							<div class="layui-form-item">
								<label style="width: 100px" class="layui-form-label" for="">所在地区</label>
								<div class="layui-input-block">
									<input type="text" class="form-control" name="areaId"
										id="areaId">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" rowspan="2">
							<div class="layui-form-item">
								<label style="width: 100px" class="layui-form-label"
									for="remark">备注</label>
								<div class="layui-input-block">
									<textarea rows="6" class="form-control" id="remark"
										name="remark"></textarea>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 按钮 -->
		<div style="width: 20%; height: 100%; float: left;">
			<button id="id_btn_edit" class="layui-btn"
				style="position: absolute; top: 30px; right: 40px; width: 90px; dispaly: none;">
				<i class="layui-icon">&#xe642;</i>编辑
			</button>
			<button id="id_btn_back" class="layui-btn"
				style="position: absolute; top: 80px; right: 40px; width: 90px; dispaly: none;">
				<i class="layui-icon"></i>取消
			</button>
			<button id="id_btn_reset" class="layui-btn"
				style="position: absolute; bottom: 60px; right: 40px; width: 90px; dispaly: none;">
				<i class="layui-icon">&#x1002;</i>清空
			</button>
			<button id="id_btn_save" class="layui-btn"
				style="position: absolute; bottom: 10px; right: 40px; width: 90px; dispaly: none;">
				<i class="layui-icon">&#xe618;</i>发布
			</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	var opera = '${opera}';
	var nbid;
	var userId;
	var form;
	var layer;
	layui.use([ 'form', 'layer' ], function() {
		form = layui.form;
		layer = layui.layer;
	});

	$(function() {
		if (opera == "edit") {
			editDefaultCSS();
		}
		if (opera == "add") {
			addDefaultCSS();
		}
		extendForm();
		loadForm();

	});

	//修改时页面初始样式
	function editDefaultCSS() {
		$('#id_btn_edit').css({
			"display" : "inline"
		});
		$('#id_btn_back').css({
			"display" : "none"
		});
		$('#id_btn_reset').css({
			"display" : "none"
		});
		$('#id_btn_save').css({
			"display" : "none"
		});
		$('div input').attr("readonly", true);
		$('div select').attr("disabled", "disabled");
	}
	//添加时按钮初始样式
	function addDefaultCSS() {
		$('#id_btn_edit').css({
			"display" : "none"
		});
		$('#id_btn_back').css({
			"display" : "none"
		});
		$('#id_btn_reset').css({
			"display" : "inline"
		});
		$('#id_btn_save').css({
			"display" : "inline"
		});
	}
	//点击编辑按钮时
	$('#id_btn_edit').click(function() {
		$('#id_btn_edit').css({
			"display" : "none"
		});
		$('#id_btn_back').css({
			"display" : "inline"
		});
		$('#id_btn_reset').css({
			"display" : "inline"
		});
		$('#id_btn_save').css({
			"display" : "inline"
		});
		$('div input').attr("readonly", false);
		//$('div select').removeAttr("readonly");
		$('div select').removeAttr("disabled");
		renderForm();
	});
	//点击取消按钮时
	$('#id_btn_back').click(function() {
		/* $('id_btn_edit').css({'display':'inline'});
		$('id_btn_back').css({'display':'none'});
		$('id_btn_reset').css({'display':'none'});
		$('id_btn_save').css({'display':'none'}); */
		location.reload();
	});
	//清空按钮
	$('#id_btn_reset').click(function() {
		$("input").val("");
		$("textarea").val("");
	});

	function renderForm() {
		layui.use('form', function() {
			form = layui.form;
			form.render();
		});
	}

	function extendForm() {
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
	}

	$('#id_btn_save')
			.click(
					function() {
						var userName = $('#userName').val();
						var tel = $('#tel').val();
						var type1 = $('#type1').val();
						var type2 = $('#type2').val();
						var quantity = $('#quantity').val();
						var areaId = $('#areaId').val();

						var remark = $('#remark').val();

						if (userName == "") {
							layer.tips('需血者姓名不能为空', '#userName', {
								tips : [ 3, 'red' ]
							});
							return;
						}
						if (tel == "") {
							layer.tips('联系电话不能为空', '#tel', {
								tips : [ 3, 'red' ]
							});
							return;
						}
						if (type1 == "") {
							layer.tips('血液类型1不能为空', '#type1', {
								tips : [ 3, 'red' ]
							});
							return;
						}
						if (quantity == "") {
							layer.tips('需求量不能为空', '#quantity', {
								tips : [ 3, 'red' ]
							});
							return;
						} else {
							if (isNaN(quantity)) {
								layer.tips('需求量只能为数字', '#quantity', {
									tips : [ 3, 'red' ]
								});
								return;
							}
						}
						if (areaId == "") {
							layer.tips('区域不能为空', '#areaId', {
								tips : [ 3, 'red' ]
							});
							return;
						}

						var data;
						var url;

						if (opera == "add") {
							data = {
								userName : userName,
								tel : tel,
								type1 : type1,
								type2 : type2,
								quantity : quantity,
								areaId : areaId,
								remark : remark,
								isreceived : 0
							};
							url = '${pageContext.request.contextPath}/app/needblood/insert/unformal'
						}
						if (opera == "edit") {
							data = {
								needBloodId : nbid,
								userId : userId,
								userName : userName,
								tel : tel,
								type1 : type1,
								type2 : type2,
								quantity : quantity,
								areaId : areaId,
								remark : remark,
								needBloodPerson:userName,
								isreceived : 0
							};
							url = '${pageContext.request.contextPath}/app/needblood/update';
						}
						$.when($.post(url, data)).done(function(data) {
							if (data.success == "true") {
								layer.confirm(data.msg, {
									btn : [ '好的,知道了', '重新填写' ]
								}, function() {
									layer.closeAll();
								}, function() {
									var index = parent.layer.getFrameIndex();
									parent.layer.close(index);
								})
							} else {
								layer.msg(data.msg, {
									time : 1600,
									icon : 2
								})
							}
						});
					})

	function loadForm() {
		if (opera == "edit") {
			nbid = '${nbid}';
			$
					.when(
							$
									.get(
											'${pageContext.request.contextPath}/app/needblood/getinfo',
											{
												nbid : nbid
											})).done(function(data) {
						userId = data.userId;
						$('#userName').val(data.needBloodPerson);
						$('#tel').val(data.tel);
						$('#type1').val(data.type1);
						$('#type2').val(data.type2);
						$('#quantity').val(data.quantity);
						$('#areaId').val(data.areaId);
						$('#remark').val(data.remark);
						renderForm();
					});
		}
	}
</script>
</html>