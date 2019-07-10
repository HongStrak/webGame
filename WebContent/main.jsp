<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/type.css" type="text/css"  media="all"/>

<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/draw.js"></script>

<script>

var time=5;
var rangeLen=200;
var rangeAng=60;
var attack=10;
var speed=2;
var y=0;
var x=0;
var targetX=x;
var targetY=y;
var targetAn=0;
var centerY=y+40;
var centerX=x+40;
var alive=true;
var angle=0;
var volume=40;    //等于R 半径

var pointX;
var pointY;
</script>
</head>
<body>
<input id="name" type="hidden" value="${name}">
<input id="RoomName" type="hidden" value="${RoomName}">
<div id="main" onmousemove="point(event)" onmousedown="move(event)">


<div id="me">

</div>
<div id="sp"></div>
<div id="death"><div id="time"><font size="4" color="green">复活倒计时：</font>
<br>
<input type="text" id="timeo">
</div></div>
</div>




</body>

<script type="text/javascript" >
var RoomName=id("RoomName").value;
var sp = id("sp");

var me = document.getElementById("me");
var name = document.getElementById("name").value;
var main = document.getElementById("main");
main.oncontextmenu=function(){return false}; 

var sid = setInterval("draw()", 20);
var mid = setInterval("movexy()", 20);
var reid = null;
me.style.top=y+"px";
me.style.left=x+"px";
/* sp.style.top=(y-40)+"px";
sp.style.left=x+"px"; */


function move(event){
	var btnNum = event.button;
	if(btnNum==2){
		targetX=pointX-volume;
		targetY=pointY-volume;
		targetAn = xyToAngle(x,y,targetX,targetY);
	}
}
function movexy(){
	if(abval(targetX-x)>2){
		moveX();
	}
	if(abval(targetY-y)>2){
		moveY();
	}
	sp.style.transform="rotateZ(-"+angle+"deg)";
	sp.style.top=y+"px";
	sp.style.left=(x+volume)+"px";
}

function draw(){
	
	
	/* alert("aa"); */
	
	$.ajax({
		url:"ctrl",
		type:"get",
		data:{'name':name,'RoomName':RoomName,
			'y':y,'x':x},
		dataType:"json",
/* 		traditional: true, */
		success:function(result){
			handle(result);
		},
		error:function(){
			/* alert("请求失败"); */
			draw();
		}
	})
}
id("main").onclick=function(){
	
	$.each(clz("other"),function(index,iteam){
		if(isByShoot(iteam,angle)&&alive){
			
			$.ajax({
				url:"ByShoot",
				type:"get",
				data:{'attack':attack,'name':iteam.getAttribute("id"),'RoomName':RoomName},
				dataType:"json",
				success:function(result){
					
				},
				error:function(){
					 alert("请求失败");
					
				}
			})
		}
	});
	
}




sp.appendChild(drawSector(0,40,200,60));
function point(e){
centerX=x+40;
centerY=y+40; 
pointX=e.clientX-(document.body.clientWidth-1366)/2;
pointY=e.clientY;
angle=xyToAngle(centerX,centerY,pointX,pointY);
}



</script>
</html>