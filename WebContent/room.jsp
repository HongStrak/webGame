<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="javaex/pc/css/icomoon.css" rel="stylesheet" />
<!--动画-->
<link href="javaex/pc/css/animate.css" rel="stylesheet" />
<!--骨架样式-->
<link href="javaex/pc/css/common.css" rel="stylesheet" />
<!--皮肤（缇娜）-->
<link href="javaex/pc/css/skin/tina.css" rel="stylesheet" />
<!--jquery，不可修改版本-->
<script src="javaex/pc/lib/jquery-1.7.2.min.js"></script>
<!--全局动态修改-->
<script src="javaex/pc/js/common.js"></script>
<!--核心组件-->
<script src="javaex/pc/js/javaex.min.js"></script>
<!--表单验证-->
<script src="javaex/pc/js/javaex-formVerify.js"></script>
</head>
<style>
	.emp{
	
		width: 80%;
		margin-top: 20px;
		margin-left: 10%;
		height: 12%;
		text-align: center;
		line-height: 12%;
	}
	.prepare{
		width: 200px;
		height: 60px;
		margin-right: 10%;
	}
	
	.user{
    margin-top: 2%;
    width: 60%;
    height: 73%;
	}
	
	
</style>
<body>
<div class="grid-1-1 total" >
	<div style=" height:100%;background-color:#00d1b2; 	text-align: center;">
		<div style="height: 25%;"></div>
		<div class="emp" style="background-color:darkgoldenrod">
		<!--	<input class="user" type="text" />-->
		</div>
		<div class="emp"  style="background-color:blueviolet">
			
		</div>
		<div class="emp"  style="background-color:blanchedalmond">
			
		</div>
	</div>
	<div style="height:100%;background-color:#ffdd57; ">
		<div style="height: 25%; "></div>
		<div class="emp"  style="background-color:darkgoldenrod">
			
		</div>
		<div class="emp"  style="background-color:blueviolet">
			
		</div>
		<div class="emp"  style="background-color:blanchedalmond">
			
		</div>
		
		<div style="margin-top: 10%;">
			<button class="button blue radius-10 right prepare" >准备</button>
		</div>
		
	</div>
	
</div>
	
</body>
<script>
	var h=document.documentElement.clientHeight;//可见区域高度
	document.getElementsByClassName('total')[0].style.height = h + "px";
</script>
</html>