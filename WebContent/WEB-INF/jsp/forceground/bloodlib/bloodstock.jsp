<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血液存量———血库</title>
</head>
<body style="width: 100%; height: 100%">
	<div style="padding:10px">
		<div style="width:80%;float:left">
			<div class="row">
		<div class="col-md-2">
			<label>A :</label>
		</div>
		<div class="col-md-8">
			<div class="progress">
				<div class="progress-bar progress-bar-success progress-bar-striped"
					id="id_pro_a_yang">
					
				</div>
				<div class="progress-bar progress-bar-info progress-bar-striped"
					id="id_pro_a_yin">
					
				</div>
				<div class="progress-bar progress-bar-danger" id="id_pro_a_safe">
					
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<label>B :</label>
		</div>
		<div class="col-md-8">
			<div class="progress">
				<div class="progress-bar progress-bar-success progress-bar-striped"
					id="id_pro_b_yang">
					
				</div>
				<div class="progress-bar progress-bar-info progress-bar-striped"
					id="id_pro_b_yin">
					
				</div>
				<div class="progress-bar progress-bar-danger" id="id_pro_b_safe">
					
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<label>AB :</label>
		</div>
		<div class="col-md-8">
			<div class="progress">
				<div class="progress-bar progress-bar-success progress-bar-striped"
					id="id_pro_ab_yang">
					
				</div>
				<div class="progress-bar progress-bar-info progress-bar-striped"
					id="id_pro_ab_yin">
					
				</div>
				<div class="progress-bar progress-bar-danger" id="id_pro_ab_safe">
					
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<label>O :</label>
		</div>
		<div class="col-md-8">
			<div class="progress">
				<div class="progress-bar progress-bar-success progress-bar-striped"
					id="id_pro_o_yang">
					
				</div>
				<div class="progress-bar progress-bar-info progress-bar-striped"
					id="id_pro_o_yin">
					
				</div>
				<div class="progress-bar progress-bar-danger" id="id_pro_o_safe">
					
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
		</div>
		<div style="width:20%;float:left">
			<div class="row">
				<div class="col-md-4">
					<div class="progress">
						<div class="progress-bar progress-bar-success progress-bar-striped" style="width:100%"></div>
					</div>
				</div>
				<div class="col-md-8">已有阳性血</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="progress">
						<div class="progress-bar progress-bar-info progress-bar-striped" style="width:100%"></div>
					</div>
				</div>
				<div class="col-md-8">已有阴性血</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="progress">
						<div class="progress-bar progress-bar-danger" style="width:100%"></div>
					</div>
				</div>
				<div class="col-md-8">安全库存量</div>

			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="progress">
						<div style="width:100%"></div>
					</div>
				</div>
				<div class="col-md-8">最大库存量</div>

			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	$(function() {
		loadData();
	})
	function loadData() {
		$
				.when(
						$
								.get('${pageContext.request.contextPath}/app/bloodstock/getsimplestock'))
				.done(function(data) {
					if ("false" == data.success) {
						alert(data.msg);
					} else {
						rows = data.rows;
						for (var i = 0; i < rows.length; i++) {
							if ("A" == rows[i].type) {
								calPro(rows[i], 'a');
							}
							if ("B" == rows[i].type) {
								calPro(rows[i], 'b')
							}
							if ("AB" == rows[i].type) {
								calPro(rows[i], 'ab')
							}
							if ("O" == rows[i].type) {
								calPro(rows[i], 'o')
							}
						}

					}
				});

	}

	function calPro(data, type) {
		var yin = data.yin / data.max;
		var yang = data.yang / data.max;
		var safe = data.safe / data.max - yang - yin;
		$('#id_pro_' + type + '_yang').html(data.yang);
		$('#id_pro_' + type + '_yang').css({
			'width' : yang * 100 + '%'
		});
		$('#id_pro_' + type + '_yin').html(data.yin);
		$('#id_pro_' + type + '_yin').css({
			'width' : yin * 100 + '%'
		});
		$('#id_pro_' + type + '_safe').html(data.safe);
		$('#id_pro_' + type + '_safe').css({
			'width' : safe * 100 + '%'
		});
	}
</script>
</html>