<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻轮播页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jqthumb/jqthumb.min.js"></script>
<script type="text/javascript">
function DrawImage(img)
{
   $(img).jqthumb({
   			classname: '#jqthumb',
            width:'400',
            height: '200',
            position: { y: '50%', x: '50%'},
            showoncomplete:true
   });
}
</script>
</head>
<body>
	<div style="width:100%;height:100%;padding:5px">
		<div id="id_img_turn" class="carousel slide" style="width:100%;height:100%" data-ride="carousel">
			<ol class="carousel-indicators">
    			<li data-target="#id_img_turn" data-slide-to="0" class="active"></li>
    			<li data-target="#id_img_turn" data-slide-to="1"></li>
    			<li data-target="#id_img_turn" data-slide-to="2"></li>
  			</ol>

  			<!-- Wrapper for slides -->
 			 <div class="carousel-inner" style="width:100%;height:100%;" role="listbox">
    			<div class="item active" style="height:100%;width:100%">
     				 <img class="img-responsive" src="../../resources/images/picture1.png" style="height:90%;width:100%" >
      				 <div style="height:10%;width:100%">文字说明1 </div>
    			</div>
    			<div class="item" style="height:100%;width:100%">
      				<img class="img-responsive" src="../../resources/images/IMG_20170620_173639.jpg" style="height:90%;width:100%" >
      				<div style="height:10%;width:100%"><h4>文字说明2 </h4></div>
   				</div>
   				<div class="item" style="height:100%;width:100%">
      				<img class="img-responsive" src="../../resources/images/IMG_20170612_173935.jpg" style="height:90%;width:100%" >
      				<div style="height:10%;width:100%">文字说明3 </div>
   				</div>
  			</div>

  			<!-- Controls -->
  			<a class="left carousel-control" href="#id_img_turn" role="button" data-slide="prev">
    			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    			<span class="sr-only">上一条</span>
  			</a>
  			<a class="right carousel-control" href="#id_img_turn" role="button" data-slide="next">
    			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    			<span class="sr-only">下一条</span>
  			</a>
		</div>
	</div>
</body>

</html>