<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>游戏房间</title>
</head>
<link href="javaex/pc/css/icomoon.css" rel="stylesheet" />
<link href="javaex/pc/css/animate.css" rel="stylesheet" />
<link href="javaex/pc/css/common.css" rel="stylesheet" />
<link href="javaex/pc/css/skin/tina.css" rel="stylesheet" />
<script src="javaex/pc/lib/jquery-1.7.2.min.js"></script>
<script src="javaex/pc/js/common.js"></script>
<script src="javaex/pc/js/javaex.min.js"></script>
<script src="javaex/pc/js/javaex-formVerify.js"></script>
<script src="js/jquery-2.2.3.min.js"></script>

<style type="text/css">
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
	
	.room{
		width: 200px; 
		height: 60px;	
		margin-left: 10%; 
		margin-top: 5%;
	}
</style>
<body>

<%-- <%
	String roomName = request.getParameter("RoomName");
	request.setAttribute("RoomName", roomName);
%> --%>

<div class="grid-1-1 total" >
	<div style=" height:100%;background-color:#00d1b2; 	text-align: center;">
		<div style="height: 25%;">
			<button class="button  radius-10 left room" >房间名:${param.RoomName }</button>
		</div>
		<div class="emp 1" style="background-color:darkgoldenrod">
		<!--	<input class="user" type="text" />-->${param.RoomName }
		</div>
		<div class="emp 2"  style="background-color:blueviolet">
			
		</div>
		<div class="emp 3"  style="background-color:blanchedalmond">
			
		</div>
	</div>
	<div style="height:100%;background-color:#ffdd57; ">
		<div style="height: 25%; "></div>
		<div class="emp 4"  style="background-color:darkgoldenrod">
			
		</div>
		<div class="emp 5"  style="background-color:blueviolet">
			
		</div>
		<div class="emp 6"  style="background-color:blanchedalmond">
			
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
	
	setInterval("refresh()",1000);
	
	function refresh(){
		$.ajax({
			url:"room?act=refresh",
			type:"post",
			data:{"roomName":"${param.RoomName }" },
			dataType:"json",
			success:function(result){
				console.log(result);
				$.each(result,function(index,item){
				//	alert(item);
					//item.name;
				})
			},
			error:function(){
				alert(error);
			}
		})
	};
	
	$(function(){
		
	})
</script>
</html>