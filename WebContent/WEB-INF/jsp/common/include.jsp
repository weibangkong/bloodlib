<!-- jquery 3.3.1 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jquery/jquery-3.3.1.js"></script>
<!-- jquery.min 1.10.2 -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/jquery/jquery-1.10.2.min.js"></script> --%>

<!-- mycss -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/mycss/mybutton.css">

<!-- bootstrap 3.3.0 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">

<!-- bootstrapValidator -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/bootstrapValidator/js/bootstrapValidator.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/bootstrapValidator/css/bootstrapValidator.css">

<!-- easyui 1.5.3 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/easyui/themes/icon.css">

<!-- layui 2.2.4 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/layui/css/layui.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/layui/layui.js"></script>

<!-- jqthumb -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/jqthumb/jqthumb.min.js"></script> --%>

<!-- layer 3.1.1 -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/layer/layer.js"></script> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/layer/theme/default/layer.css"> --%>

<script type="text/javascript">
/**
 * used in layui.confirm
 */
function myalert(data){
	if(data.success=="true"){
		layer.msg(data.msg,{
			time:1600,
			icon:1,
			anim:0,
			shade:0.7,
			shadeClose: true,
			end:function(){
				location.reload();
			}
		})
	}else{
		layer.msg(data.msg,{
			time:1600,
			icon:2,
			anim:6,
			shade:0.7,
			shadeClose: true,
			end:function(){
				layer.close();
			}
		})
	}
};
</script>