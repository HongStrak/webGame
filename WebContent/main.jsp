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
var rangeLen=200;
var rangeAng=60;
var attack=10;
var speed=1;
var y=0;
var x=0;
var targetX=x;
var targetY=y;
var targetAn=0;
var centerY;
var centerX ;
var angle=0;
</script>
</head>
<body>
<input id="name" type="hidden" value="${name}">
<div id="main" onmousemove="point(event)" onmousedown="move(event)">


<div id="me">

</div>
<div id="sp"></div>
</div>



<input type="button" onclick="ByShoot()" value="shoot"> 
</body>

<script type="text/javascript" >
document.oncontextmenu=function(){return false}; 
var me = document.getElementById("me");
var name = document.getElementById("name").value;
var main = document.getElementById("main");


var sid = setInterval("draw()", 20);
var mid = setInterval("movexy()", 20);
me.style.top=y+"px";
me.style.left=x+"px";
var pointX;
var pointY;

function move(event){
	var btnNum = event.button;
	if(btnNum==2){
		
		targetX=pointX;
		targetY=pointY;
		targetAn = xyToAngle(x,y,targetX,targetY);
	}
}
function movexy(){
	if(abval(targetX-x)>2&&abval(targetY-y)>2){
		moveX();
		moveY();
	}
	sp.style.transform="rotateZ(-"+angle+"deg)";
	sp.style.top=y+"px";
	sp.style.left=(x+40)+"px";
}

function draw(){
	
	
	/* alert("aa"); */
	
	$.ajax({
		url:"ctrl",
		type:"get",
		data:{'name':name,
			'y':y,'x':x},
		dataType:"json",
/* 		traditional: true, */
		success:function(result){
			$.each(result,function(index,iteam){
				if(iteam.name!=name){
					var oth = document.getElementById(iteam.name);
					if(oth==null){
						oth = document.createElement("div");
						oth.setAttribute("id",iteam.name);
						oth.setAttribute("class","other");
						oth.setAttribute("x",iteam.x+40);
						oth.setAttribute("y",iteam.y+40);
						oth.setAttribute("hp",iteam.hp);
						main.appendChild(oth);
						oth.innerHTML=iteam.name+":"+iteam.hp;
					}else{
						oth.setAttribute("hp",iteam.hp);
						oth.setAttribute("x",int(iteam.x)+40);
						oth.setAttribute("y",int(iteam.y)+40);
						oth.style.top=iteam.y+"px";
						oth.style.left=iteam.x+"px";
						oth.innerHTML=iteam.name+":"+iteam.hp;
					}
					
				}else{
					me.setAttribute("hp",iteam.hp);
					me.innerHTML=iteam.name+":"+iteam.hp;
				}
			})
		},
		error:function(){
			/* alert("请求失败"); */
			draw();
		}
	})
}
id("main").onclick=function(){
	
	$.each(clz("other"),function(index,iteam){
		if(isByShoot(iteam,angle)){
			
			$.ajax({
				url:"ByShoot",
				type:"get",
				data:{'attack':attack,'name':iteam.getAttribute("id")},
				dataType:"json",
		/* 		traditional: true, */
				success:function(result){
					
				},
				error:function(){
					 alert("请求失败");
					
				}
			})
		}
	});
	
}



var sp = id("sp");
sp.appendChild(drawSector(0,40,200,60));
function point(e){
centerX=x+40;
centerY=y+50;
pointX=e.clientX;
pointY=e.clientY;
angle=xyToAngle(centerX,centerY,pointX,pointY);
			
}



</script>
</html>