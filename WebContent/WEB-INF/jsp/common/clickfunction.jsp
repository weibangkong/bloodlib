<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
//点击用户名
//点击个人信息
$('#id_a_userinfo').click(function(){
	window.location.href=basePath+"fgnavi/myuserinfo";
})
//修改密码
$('#id_a_updatepass').click(function(){
	window.location.href=basePath+"fgnavi/updatepass";
})

//导航栏
//点击首页
$('#id_btn_firstpage').click(function(){
	window.location.href="${pageContext.request.contextPath}/app/fgnavi/user/index";
});
//点击我的血型信息
$('#id_btn_mybt').click(function(){
	window.location.href=basePath+"fgnavi/updatamybloodType";
});
//跳转到附近到医院界面
$('#id_btn_nearhospital').click(function(data){
	window.location.href=basePath+"fgnavi/shownear/2";
})
//跳转到附近的血库界面
$('#id_btn_nearbloodlib').click(function(data){
	window.location.href=basePath+"fgnavi/shownear/3";
})
//个人主页
$('#id_nav_mypage').click(function(data){
	window.location.href="${pageContext.request.contextPath}/app/fgnavi/user/index";
})

//快捷入口
//点击发布新需血信息
$('#id_nb_new').click(function(){
	window.location.href=basePath+"fgnavi/publishneedblood";
});
//查看我发布的的需血信息系
$('#id_nb_my').click(function(){
	window.location.href=basePath+"fgnavi/nblist";
});
//查看我的血液库存
$('#id_bs_my').click(function(){
	window.location.href=basePath+"fgnavi/showstock";
});
//点击修改血液存量
$('#id_bs_edit').click(function(){
	window.location.href=basePath+"fgnavi/stockedit";
});
//点击创建血液存量
$('#id_bs_add').click(function(){
	window.location.href=basePath+"fgnavi/createstock";
});
//点击血型及匹配原则管理
$('#id_bt_edit').click(function(){
	window.location.href="${pageContext.request.contextPath}/app/fgnavi/user/index";
});
$('#id_donate_new').click(function(){
	window.location.href="${pageContext.request.contextPath}/app/fgnavi/applydonate"
})
</script>