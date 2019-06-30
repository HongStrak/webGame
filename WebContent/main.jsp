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
<!-- <script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/draw.js"></script>


</head>
<body>
<input id="name" type="hidden" value="${name}">
<div id="main" onmousemove="point(event)">


<div id="me">

</div>
<div id="sp"></div>
</div>




</body>

<script type="text/javascript" >
var me = document.getElementById("me");
var name = document.getElementById("name").value;
var main = document.getElementById("main");
var y=0;
var x=0;
alert(name);
var sid = setInterval("draw()", 20);
me.style.top=y+"px";
me.style.left=x+"px";
me.innerHTML=name;
document.onkeypress=function(e){
	var code = e.keyCode;
	var s = String.fromCharCode(code);
	switch(s){
	case 'd':
		x=x+10;
		me.style.left=x+"px";
		break;
	case 'w':
		y-=10;
		me.style.top=y+"px";
		break;
	case 'a':
		x-=10;
		me.style.left=x+"px";
		break;
	case 's':
		y+=10;
		me.style.top=y+"px";
		break;
	}
	point(event);
}
function draw(){
	
	
	/* alert("aa"); */
	
	$.ajax({
		url:"ctrl",
		type:"get",
		data:{'name':name,
			'y':y,'x':x},
		dataType:"json",
		success:function(result){
			$.each(result,function(index,iteam){
				if(iteam.name!=name){
					var oth = document.getElementById(iteam.name);
					if(oth==null){
						oth = document.createElement("div");
						oth.setAttribute("id",iteam.name);
						oth.setAttribute("class","other");
						main.appendChild(oth);
						oth.innerHTML=iteam.name;
					}else{
						oth.style.top=iteam.y+"px";
						oth.style.left=iteam.x+"px";
					}
					
				}
			})
		},
		error:function(){
			/* alert("请求失败"); */
			draw();
		}
	})
}

var pointX;
var pointY;
var centerY;
var centerX ;
var b ;
var angle=0;
var sp = document.getElementById("sp");
function point(e){
			centerX=x+40;
			centerY=y+50;
			pointX=e.clientX;
			pointY=e.clientY;
			b=(centerY-pointY)/(pointX-centerX);
			
			angle = ((Math.atan(b))*180/3.1415926);
			if(b<0){
				angle+=360;	
			}if((centerY-pointY)>0&&(pointX-centerX)<0){
				angle+=180;
			}
			if((centerY-pointY)<0&&(pointX-centerX)<0){
				angle+=180;
			}
			sp.style.transform="rotateZ(-"+angle+"deg)";
			sp.style.top=y+"px";
			sp.style.left=(x+40)+"px";
		}


</script>
</html>