<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>
<div class="progress-container" style="height:8%;width:100%">
						<label>A :</label>
						<div class="progress">
 							<div class="progress-bar progress-bar-success progress-bar-striped" id="id_pro_a_yang">
   								<span class="sr-only">已有RH+库存</span>
  							</div>
  							<div class="progress-bar progress-bar-info progress-bar-striped" id="id_pro_a_yin">
   								<span class="sr-only">已有RH-库存</span>
  							</div>
  							<div class="progress-bar progress-bar-danger" id="id_pro_a_safe">
   							 	<span class="sr-only">安全库存</span>
  							</div>
  							<!-- <div class="progress-bar" id="id_pro_a_max">
    							<span class="sr-only">最大库存</span>
 						 	</div> -->
						</div>
					</div>
					<div class="progress-container" style="height:8%;width:100%">
						<label>B :</label>
						<div class="progress">
 							<div class="progress-bar progress-bar-success progress-bar-striped" id="id_pro_b_yang">
   								<span class="sr-only">已有RH+库存</span>
  							</div>
  							<div class="progress-bar progress-bar-info progress-bar-striped" id="id_pro_b_yin">
   								<span class="sr-only">已有RH-库存</span>
  							</div>
  							<div class="progress-bar progress-bar-danger" id="id_pro_b_safe">
   							 	<span class="sr-only">安全库存</span>
  							</div>
  							<!-- <div class="progress-bar" id="id_pro_b_max">
    							<span class="sr-only">最大库存</span>
 						 	</div> -->
						</div>
					</div>
					<div class="progress-container" style="height:8%;width:100%">
						<label>AB :</label>
						<div class="progress">
 							<div class="progress-bar progress-bar-success progress-bar-striped" id="id_pro_ab_yang">
   								<span class="sr-only">已有RH+库存</span>
  							</div>
  							<div class="progress-bar progress-bar-info progress-bar-striped" id="id_pro_ab_yin">
   								<span class="sr-only">已有RH-库存</span>
  							</div>
  							<div class="progress-bar progress-bar-danger" id="id_pro_ab_safe">
   							 	<span class="sr-only">安全库存</span>
  							</div>
  							<!-- <div class="progress-bar" id="id_pro_ab_max">
    							<span class="sr-only">最大库存</span>
 						 	</div> -->
						</div>
					</div>
					<div class="progress-container" style="height:8%;width:100%">
						<label>O :</label>
						<div class="progress">
 							<div class="progress-bar progress-bar-success progress-bar-striped" id="id_pro_o_yang">
   								<span class="sr-only">已有RH+库存</span>
  							</div>
  							<div class="progress-bar progress-bar-info progress-bar-striped" id="id_pro_o_yin">
   								<span class="sr-only">已有RH-库存</span>
  							</div>
  							<div class="progress-bar progress-bar-danger" id="id_pro_o_safe">
   							 	<span class="sr-only">安全库存</span>
  							</div>
  							<!-- <div class="progress-bar" id="id_pro_o_max">
    							<span class="sr-only">最大库存</span>
 						 	</div> -->
						</div>
					</div>
<script type="text/javascript">
$(function(){
	calPro();
});
function calPro_a(){
	$('#id_pro_a_yang').css({'width':'10%'});
	$('#id_pro_a_yin').css({'width':'10%'});
	$('#id_pro_a_safe').css({'width':'10%'});
	//$('#id_pro_a_max').css({'width':'10%'});
}
function calPro_b(){
	$('#id_pro_b_yang').css({'width':'10%'});
	$('#id_pro_b_yin').css({'width':'5%'});
	$('#id_pro_b_safe').css({'width':'13%'});
	//$('#id_pro_b_max').css({'width':'24%'});
}
function calPro_ab(){
	
	$('#id_pro_ab_yang').css({'width':'10%'});
	$('#id_pro_ab_yin').css({'width':'10%'});
	$('#id_pro_ab_safe').css({'width':'10%'});
	//$('#id_pro_ab_max').css({'width':'10%'});
}
function calPro_o(){
	
	$('#id_pro_o_yang').css({'width':'10%'});
	$('#id_pro_o_yin').css({'width':'10%'});
	$('#id_pro_o_safe').css({'width':'10%'});
	//$('#id_pro_o_max').css({'width':'10%'});
}
function calPro(){
	calPro_a();
	calPro_b();
	calPro_ab();
	calPro_o();
}
</script>				