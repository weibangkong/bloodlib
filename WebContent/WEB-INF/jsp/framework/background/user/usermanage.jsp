<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<%@ include file="../../../common/include.jsp" %>
</head>
<body>
	<div style="width:100%;height:100%;position: absolute;">
		<div style="width:80%;height:100%;float: left">
			<div style="width:100%;height:90%;padding: 10px 10px 10px 10px">
				<table class="layui-table" lay-size="sm" id="id_user_table" lay-filter="demo">
				</table>
			</div>
		</div>
		<!-- <div style="width:20%;height:100%;float:left">
			<button type="button" class="layui-btn" id="id_btn_add">新增</button>
		</div> -->
	</div>
</body>
<script type="text/javascript" id="toolBarDemo">
<button class="layui-btn layui-btn-xs" lay-event="edit" ><i class="layui-icon">&#xe642;</i>查看详细信息</button>
<button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</button>
</script>
<script type="text/javascript">
var layer;
var laypage;
var table;
layui.use(['layer','laypage','table'],function(){
	layer=layui.layer;
	laypage=layui.laypage;
	table=layui.table;

	
	table.render({
		elem:'#id_user_table',
		page:true,
		url:'${pageContext.request.contextPath}/app/user/getlist',
		cols:[[
		        {field:'userName',title:'姓名',align:'center'}
		       	,{field:'loginName',title:'登录名'}
		       	,{field:'password',title:'密码'}
		       	,{field:'roleId',title:'身份'}
		        ,{field:'',title:'操作',align:'center',toolbar:'#toolBarDemo'}
		       ]]
		,done:function(){
			 $("[data-field='roleId']").children().each(function(){  
                 if($(this).text()=='1'){  
                    $(this).text("个人")  
                 }else if($(this).text()=='2'){  
                    $(this).text("医院")  
                 }else if($(this).text()=='3'){  
                    $(this).text("血库")  
                 }else if($(this).text()=='-1'){  
                    $(this).text("临时用户")  
                 }else if($(this).text()=='99'){
                	 $(this).text("管理员")
                 }  
         })  
		}
	});
	
	table.on('tool(demo)', function(obj){
	    var data = obj.data;
	    if(obj.event == 'edit'){
	      layer.open({
	    	  title:'用户信息修改'
	    	  ,type:2
	    	  ,area:['80%','80%']
	    	  ,side:0.75
	    	  ,content: '${pageContext.request.contextPath}/app/bgnavi/getuserdetailpage/'+data.userId
	    	  ,end:function(){
	    		  location.reload();
	    	  }
	      })
	    } else if(obj.event == 'del'){
	      layer.confirm('真的删除么', {btn:['删除','取消']}
	      ,function(index){
	    	  $.when($.post('${pageContext.request.contextPath}/app/user/delete',{userId:data.userId}))
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
function showDetail(userId){
	layer.open({
		type: 2,
		title: '用户详细信息',
		area: ['800px','400px'],
		shade:0.75,
		content:'${pageContext.request.contextPath}/app/bgnavi/getuserdetailpage/'+userId,
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
$('#id_btn_add').click(function(){
	layer.open({
		type: 2,
		title: '新增用户',
		area: ['800px','400px'],
		shade:0.75,
		content:'${pageContext.request.contextPath}/app/bgnavi/adduser/',
		end:function(){
			location.reload();
		}
	});
});
</script>
</html>