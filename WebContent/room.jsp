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
<script src="js/draw.js"></script>

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
			<button class="button  radius-10 left room" >房间名:${param.RoomName }的房间</button>
			
		</div>
		<div class="emp 1" style="background-color:darkgoldenrod">
		<div class="player"></div>
		</div>
		<div class="emp 2"  style="background-color:blueviolet">
			<div class="player"></div>
		</div>
		<div class="emp 3"  style="background-color:blanchedalmond">
			<div class="player"></div>
		</div>
	</div>
	<div style="height:100%;background-color:#ffdd57; ">
		<div style="height: 25%; ">
			<button class="button  radius-10 left room" >
				<a id="quit" href="QuitRoom?RoomName=${param.RoomName}&name=${param.name} ">退出房间</a>
			</button>
		</div>
		<div class="emp 4"  style="background-color:darkgoldenrod">
			<div class="player"></div>
		</div>
		<div class="emp 5"  style="background-color:blueviolet">
			<div class="player"></div>
		</div>
		<div class="emp 6"  style="background-color:blanchedalmond">
			<div class="player"></div>
		</div>
		<div id="play">
		<div  style="margin-top: 10%;">
			<button   class="button blue radius-10 right prepare" onclick="play()">
			<%-- <a   href="joinG?name=${param.name}&RoomName=${param.RoomName}">play</a> --%>
			play
			</button>
		</div>
		</div>
	</div>
	
</div>
	
</body>

<script>
history.pushState(null, null, document.URL);
//禁用浏览器的后退功能
	window.addEventListener('popstate', function () {
	    history.pushState(null, null, document.URL);
	});
	
	
	var name = "${param.name}";
	var RoomName = "${param.RoomName}";
 	if(name==RoomName){
		id("quit").innerHTML="解散房间";
	}
 	if(RoomName!=name){
		document.getElementById("play").style.display="none";
	} 
	var h=document.documentElement.clientHeight;//可见区域高度
	document.getElementsByClassName('total')[0].style.height = h + "px";
	
	setInterval("refresh()",1000);
	setInterval("start()",500);
	function refresh(){
		$.ajax({
			url:"room?act=refresh",
			type:"post",
			data:{"roomName":RoomName },
			dataType:"json",
			success:function(result){
				console.log(result);
				
				$.each(clz("player"),function(index,iteam){
					iteam.innerHTML="";
				});
				$.each(result,function(index,iteam){
				clz("player")[index].innerHTML=iteam.name;
				});
			},
			error:function(){
				refresh();
			}
		});
	}
	
	function start(){
		$.ajax({
			url:"startGame",
			data:{"RoomName":RoomName },
			success:function(result){
				console.log(result);
				if(result=="false"){
					window.location.href = "joinG?RoomName="+RoomName+"&name="+name;
				}
			},
			error:function(){
				start();
			}
		});
	}
	
	function play(){
		$.ajax({
			url:"playgame",
			data:{"RoomName":RoomName },
			success:function(result){
				
			},
			error:function(){
				play();
			}
		});
	}


</script>
</html>