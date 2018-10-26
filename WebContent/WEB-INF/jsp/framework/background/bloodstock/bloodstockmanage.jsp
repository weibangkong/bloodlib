<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血量库存管理</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%;position: absolute;">
		<div style="width:80%;height:100%;float: left">
			<div style="width:100%;height:90%;padding: 10px 10px 10px 10px">
				<table class="layui-table" lay-size="sm" id="id_user_table">
			 		<thead>
						<tr>
							<th>单位名称</th>
							<th>登录名</th>
							<th>单位类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="id_user_tbody"></tbody>
				</table>
			</div>
			<div  style="width:100%;heigh:10%">
				<div id="pageDemo" style="float:right"></div>	
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var layer;
var laypage;
var table;
layui.use(['layer','laypage','table'],function(){
	layer=layui.layer;
	laypage=layui.laypage;
	table=layui.table;
	laypage.render({
		elem:'pageDemo',
		count:50,
		limit:10
	})
})
$(loadData());
function loadData(){
	$('#id_user_tbody').empty();
	$.when($.get('${pageContext.request.contextPath}/app/user/getstockuser')	
	).done(function(data){
		rows=data.rows;
		for(var i=0;i<rows.length;i++){
			var li="";
			li+="<tr><td>"+cutData(rows[i].userName)+"</td>";
			li+="<td>"+cutData(rows[i].loginName)+"</td>";
	//		li+="<td>"+cutData(data[i].password)+"</td>";
			li+="<td>"+getRoleName(rows[i].roleId)+"</td>";
			li+="<td>"+"<a href='javascript:void(0)' class='layui-btn layui-btn-sm' onclick='showDetail("+cutData(rows[i].userId)+")'>详细信息</a>";
			li+="</tr>";
			$('#id_user_tbody').append(li);
		} 
		//使用easyui
		//$('#id_user_table').datagrid('loadData',data);
	});
}
function cutData(data){
	if(data==""||data==undefined){
		return "";
	}else{
		return data;
	}
}
function getRoleName(data){
	if(data==""||data==undefined){
		return "";
	}else{
		if(data=="1"){
			return "个人";
		}
		if(data=="2"){
			return "医院";
		}
		if(data=="3"){
			return "血库";
		}
		if(data=="4"){
			return "公安局";
		}
		if(data=="99"){
			return "系统管理员";
		}
	}
}
function showDetail(userId){
	layer.open({
		type: 2,
		title: '用户详细血液库存详细信息',
		area: ['1000px','500px'],
		shade:0.75,
		content:'${pageContext.request.contextPath}/app/bgnavi/getbloodstockdetailpage/edit/'+userId,
		end:function(){
			location.reload();
		}
	});
}
function isDelete(userId){
	layer.confirm('是否确定要删除用户?',{
		btn:['删除','取消']
	},function(){
		$.when($.post('${pageContext.request.contextPath}/app/user/delete',{userId:userId})
		).done(function(data){
			if(data.success=="false"){
				layer.msg(data.msg,{
					time:1600,
					icon:2
				});
			}else{
				layer.msg(data.msg,{
					time:1600,
					icon:1});
				loaction.reload;
			}
		});	
	},function(){
		layer.closeAll();
	})
}
</script>
</html>