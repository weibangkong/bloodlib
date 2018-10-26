<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血液存量信息</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:50%;height:100%;float:left">
		<div style="width:100%;height:100%">
			<h3>血液存量列表</h3>
			<table class="layui-table" lay-size="sm">
				<thead>
					<tr>
						<th>血型</th>
						<th>当前库存</th>
						<th>安全库存</th>
						<th>最大库存</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="id_stock_list"></tbody>
			</table>
		</div>
	</div>
	<div style="width:45%;height:100%;float:left;">
		<div style="width:100%;height:90%;">
			<h3>血液存量详细信息</h3>
			<form style="height:90%;margin-top: 20px">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2"><label>血型</label></div>
					<div class="col-md-2"><span id="type1" name="type1" style="font-size: 30px"></span></div>
					<div class="col-md-2"><span id="type2" name="type2" style="font-size: 30px"></span></div>
					<div class="col-md-2"></div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-2"><input type="hidden" id="bloodStockId" name="bloodStockId"/></div>
					<div class="col-md-10"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2"><label>当前库存量</label></div>
					<div class="col-md-6"><input type="text" name="stockQuantity" id="stockQuantity" class="layui-input"/></div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2"><label>安全库存量</label></div>
					<div class="col-md-6"><input type="text" name="safeStock" id="safeStock" class="layui-input"/></div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2"><label>最大库存量</label></div>
					<div class="col-md-6"><input type="text" name="maxStock" id="maxStock" class="layui-input"/></div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-2"><button type="button" class="layui-btn layui-btn-xs" onclick="saveEdit()">保存</button></div>
					<div class="col-md-8"></div>
				</div>
			</form>
		</div>
		<div style="width:100%;height:10%">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8"></div>
				<div class="col-md-2">
					<button type="button" class="layui-btn" id="id_btn_add">新增</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var layer;
	var userId='${userId}';
	layui.use('layer',function(){
		layer=layui.layer;
	});
	$(function(){
		loadTable();
	});
	function loadTable(){
		$('#id_stock_list').empty();
		$.when($.get('${pageContext.request.contextPath}/app/bloodstock/getuserstocklistforadmin',{userId:userId})).done(function(data){
			var rows=data.rows;
			var li='';
			for( var i=0;i<rows.length;i++){
				li+='<tr>';
				li+='<td>'+rows[i].type1+" "+rows[i].type2+'</td>';
				li+='<td>'+rows[i].stockQuantity+'</td>';
				li+='<td>'+rows[i].safeStock+'</td>';
				li+='<td>'+rows[i].maxStock+'</td>';
				li+='<td><button type="button" class="layui-btn layui-btn-normal layui-btn-xs" onclick=loadData('+rows[i].bloodStockId+')>选择</button></td>';
				li+='</tr>';
			}
			$('#id_stock_list').append(li);
		});
	}
	
	function loadData(bloodStockId){
		$.when($.get('${pageContext.request.contextPath}/app/bloodstock/getstockinfo/'+bloodStockId)).done(function(data){
			//$('#type1').html('<h3>'+data.type1+'<h3>');
			$('#type1').html(data.type1);
			//$('#type2').html('<h3>'+data.type2+'<h3>');
			$('#type2').html(data.type2);
			$('#stockQuantity').val(data.stockQuantity);
			$('#safeStock').val(data.safeStock);
			$('#maxStock').val(data.maxStock);
			$('#bloodStockId').val(data.bloodStockId);
		});
	}
	
	function saveEdit(){
		var stockQuantity=$('#stockQuantity').val();
		var safeStock=$('#safeStock').val();
		var maxStock=$('#maxStock').val();
		var bloodStockId=$('#bloodStockId').val();
		var data={
				bloodStockId:bloodStockId,
				stockQuantity:stockQuantity,
				safeStock:safeStock,
				maxStock:maxStock
		}
		$.when($.post('${pageContext.request.contextPath}/app/bloodstock/updata',data)).done(function(data){
			if("false"==data.success){
				alert(data.msg);
			}else{
				alert(data.msg);
				location.reload();
			}
		})
	}
	
	$('#id_btn_add').click(function(data){
		parent.layer.open({
			type: 2,
			title: '新增血液库存详细信息',
			area: ['600px','500px'],
			shade:0.2,
			content:'${pageContext.request.contextPath}/app/bgnavi/addStock/'+userId,
			end:function(){
				location.reload();
			}
		});
	})
</script>
</html>