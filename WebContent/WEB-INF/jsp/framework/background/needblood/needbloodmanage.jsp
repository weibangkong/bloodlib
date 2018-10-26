<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息管理</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%">
		<div title="需血列表" style="width:80%;height:90%;margin-top:10px;float:left">
			<div style="width:100%;height:100%">
				<table class="layui-table" id="id_nb_table"  lay-filter="demo"></table>
			</div>
		</div>
		<div title="查询按钮" style="width:20%;height:100%;float:left;">
			<!-- <div style="width:80%;height:100%;margin-top:30%" >
				<button   id="id_btn_hasReceived" style="width:100%;" class="layui-btn "><i class="layui-icon">&#xe615;</i>切换到已解决</button>
				<button  id="id_btn_noReceived" style="width:100%;display: none" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i>切换到未解决</button>
			</div> -->
			<div style="width:100%;height:40%;margin-top:30%">
				<button id="id_btn_add" style="width:80%;height:100%;padding:5px" class="layui-btn">
				<i class="layui-icon">&#xe654;</i>发布新需血信息
				</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" id="toolBarDemo">
<button class="layui-btn layui-btn-xs" lay-event="edit" ><i class="layui-icon">&#xe642;</i>查看详细信息</button>
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
		elem:'#id_nb_table',
		page:true,
		url:'${pageContext.request.contextPath}/app/needblood/getlist?isReceived=0',
		cols:[[
		        {field:'needBloodId',title:'ID',fixed:true,align:'center',width:30,unresize:true}
		       	,{field:'needBloodPerson',title:'姓名',width:100,fixed:true}
		       	,{field:'type1',title:'血型',width:70,unresize:true}
		       	,{field:'quantity',title:'需血量'}
		       	,{field:'areaname',title:'区域'}
		       	,{field:'tel',title:'联系电话',width:120}
		        ,{field:'',title:'操作',align:'center',toolbar:'#toolBarDemo'}
		       ]]
	});

	table.on('tool(demo)', function(obj){
	    var data = obj.data;
	    if(obj.event == 'edit'){
	      layer.open({
	    	  title:'需血信息修改'
	    	  ,type:2
	    	  ,area:['80%','80%']
	    	  ,side:0.75
	    	  ,content:'${pageContext.request.contextPath}/app/bgnavi/getneedblooddetailpage/edit/'+data.needBloodId
	    	  ,end:function(){
	    		  location.reload();
	    	  }
	      })
	    } else if(obj.event == 'del'){
	      layer.confirm('真的删除么', {btn:['删除','取消']}
	      ,function(index){
	    	  $.when($.post('${pageContext.request.contextPath}/app/needblood/delete',{nbid:data.needBloodId}))
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
		title:'新增需血信息'
		,type: 2
		,area:['80%','80%']
		,side: 0.75
		,content:'${pageContext.request.contextPath}/app/bgnavi/getneedblooddetailpage/add'
		,end:function(){
			location.reload();
		}
		
	})
})

function loadtable(isReceived){
	table.render({
		elem:'#id_nb_table',
		page:true,
		url:'${pageContext.request.contextPath}/app/needblood/getlist?isReceived='+isReceived,
		cols:[[
		        {field:'needBloodId',title:'ID',fixed:true,align:'center',width:30,unresize:true}
		       	,{field:'userName',title:'用户名',fixed:true}
		       	,{field:'type1',title:'需求血型',width:70,unresize:true}
		       	,{field:'quantity',title:'需血量'}
		       	,{field:'areaId',title:'区域ID'}
		       	,{field:'tel',title:'联系电话',width:120}
		        ,{field:'',title:'操作',align:'center',toolbar:'#toolBarDemo'}
		       ]]
	});
}

</script>
</html>