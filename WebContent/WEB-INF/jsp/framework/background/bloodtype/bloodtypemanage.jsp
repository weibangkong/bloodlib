<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血型及匹配原则管理</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%">
		<div title="血型查询" style="width:70%;height:100%;float:left;margin-top:10px;">
			<div style="width:100%;height:100%">
				<table class="layui-table" id="id_bt_table" lay-filter="demo"></table>
			</div>
		</div>
		<div title="血型匹配查询" style="width:30%;height:100%;float:left;" align="center">
			<div style="width:60%;height:40%;margin-top:30% ">
				<button  style="width:100%;height:100%" class="layui-btn layui-btn-lg"><i class="layui-icon">&#xe615;</i>血型匹配查询</button>
			</div>
			<div style="width:60%;height:40%;margin-top:30% ">
				<button id="id_btn_add"style="width:100%;height:100%" class="layui-btn layui-btn-lg"><i class="layui-icon">&#xe654;</i>新增血型及匹配原则</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" id="toolBarDemo">
<button class="layui-btn layui-btn-xs" lay-event="edit" ><i class="layui-icon">&#xe642;</i>匹配血型修改</button>
<button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</button>
</script>
<script type="text/javascript">
var form;
var table;
var layer;
layui.use(['form','table','layer'],function(){
	form=layui.form;
	table=layui.table;
	layer=layui.layer;
	
	table.render({
		elem:'#id_bt_table',
		page:true,
		url:'${pageContext.request.contextPath}/app/bloodtype/getlist',
		cols:[[
		        {field:'bloodTypeId',title:'ID',fixed:true,align:'center',width:30,unresize:true}
		       	,{field:'type1',title:'血型类别1',width:100,unresize:true}
		       	,{field:'type2',title:'血型类别2',width:100,unresize:true}
		       	,{field:'inputType',title:'可输入血型'}
		       	,{field:'outputType',title:'可输出血型'}
		        ,{field:'',title:'操作',align:'center',toolbar:'#toolBarDemo'}
		       ]]
	});
	table.on('tool(demo)', function(obj){
	    var data = obj.data;
	    if(obj.event == 'edit'){
	      layer.open({
	    	  title:'匹配原则修改'
	    	  ,type:2
	    	  ,area:['80%','80%']
	    	  ,side:0.75
	    	  ,content:'${pageContext.request.contextPath}/app/bgnavi/getbloodtypedetailpage/edit/'+data.bloodTypeId
	    	  ,end:function(){
	    		  location.reload();
	    	  }
	      })
	    } else if(obj.event == 'del'){
	      layer.confirm('真的删除行么', {btn:['删除','取消']}
	      ,function(index){
	    	  $.when($.post('${pageContext.request.contextPath}/app/bloodtype/delete',{btid:data.bloodTypeId}))
	    	  .done(function(data){
	    		  if(data.success=="false"){//删除失败
	  				layer.msg(data.msg,{
	  					time:1600,
	  					icon:2
	  				});
	  			}else{//删除成功
	  				layer.msg(data.msg,{
	  					time:1600,
	  					icon:1,
	  					end:function(){
	  						location.reload();
	  					}
	  				});
	  				
	  			}
	    	  });
	      },function(index){
	    	  layer.close(index);
	      });
	    } 
	  });
})
$('#id_btn_add').click(function(){
	layer.open({
		title:'新增血型'
		,type: 2
		,area:['80%','80%']
		,side: 0.75
		,content:'${pageContext.request.contextPath}/app/bgnavi/getbloodtypedetailpage/add'
		,end:function(){
			location.reload();
		}
		
	})
})



</script>
</html>