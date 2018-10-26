<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>献血信息管理</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%">
		<div style="width:80%;height:100%;float:left;margin-top:10px;">
			<div style="width:100%;height:100%">
				<table class="layui-table" id="id_donate_table" lay-filter="demo"></table>
			</div>
		</div>
		<div style="width:20%;height:100%;float:left;" align="center">
			<div style="width:60%;height:40%;margin-top:30% ">
				<button  style="width:100%;height:100%" class="layui-btn layui-btn"><i class="layui-icon">&#xe615;</i>献血信息查询</button>
			</div>
			<div style="width:60%;height:40%;margin-top:30% ">
				<button id="id_btn_add"style="width:100%;height:100%" class="layui-btn layui-btn"><i class="layui-icon">&#xe654;</i>新增献血信息</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" id="toolBarDemo">
	<button class="layui-btn layui-btn-sm" lay-event="check" ><i class="layui-icon">&#xe642;</i>检验</button>
	<button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</button>
</script>
<script type="text/javascript">
	var table;
	var layer;
	layui.use(['table','layer'],function(){
		table=layui.table;
		layer=layui.layer;
		table.render({
			elem:'#id_donate_table',
			page:true,
			url:'${pageContext.request.contextPath}/app/donate/getdetaillist',
			cols:[[
			        {field:'donateBloodId',title:'ID',fixed:true,align:'center',width:30,unresize:true}
			       	,{field:'donateer',title:'献血者',width:100,unresize:true}
			       	,{field:'type1',title:'血型类别1',width:100,unresize:true}
			       	,{field:'type2',title:'血液类型2',width:100}
			       	,{field:'quantity',title:'献血量',width:100}
			       	,{field:'hosName',title:'献血地点'}
			       	,{field:'donateDate',title:'献血时间'}
			        ,{field:'',title:'操作',align:'center',toolbar:'#toolBarDemo'}
			       ]]
		});
		//表格监听事件-start
		table.on('tool(demo)', function(obj){
		    var data = obj.data;
		    if(obj.event == 'check'){
		      layer.open({
		    	  title:'献血信息校验'
		    	  ,type:2
		    	  ,area:['80%','97%']
		    	  ,side:0.75
		    	  ,content:'${pageContext.request.contextPath}/app/bgnavi/getdonatedetail/edit?donateId='+data.donateId
		    	  ,end:function(){
		    		  location.reload();
		    	  }
		      })
		    } else if(obj.event == 'del'){
		      layer.confirm('真的删除行么', {btn:['删除','取消']}
		      ,function(index){
		    	  $.when($.post('${pageContext.request.contextPath}/app/donate/delete',{donateId:data.donateId}))
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
		//表格监听事件-end
	});
	
	$('#id_btn_add').click(function(){
		layer.open({
			title : '新增献血信息',
			type : 2 ,
			side : 0.75,
			area : ['80%','97%'],
			content : '${pageContext.request.contextPath}/app/bgnavi/getdonatedetail/add',
			end : function(){
				location.reload();
			}
		})
	})
</script>
</html>