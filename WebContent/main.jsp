<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#me{
width:80px;
height: 100px;
background-color: red;
position:absolute;
}
.other{
width:80px;
height: 100px;
background-color: yellow;
position:absolute;
}
#main{
width:80%;
height: 800px;
margin: auto;
border: 1px solid black;
}
</style>


</head>
<body>
<input id="name" type="hidden" value="${name}">
<div id="main">


<div id="me"></div>
</div>


</body>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript">

var me = document.getElementById("me");
var name = document.getElementById("name").value;
var main = document.getElementById("main");
var y=0;
var x=0;
var sid = setInterval("draw()", 20);
me.style.top=y+"px";
me.style.left=x+"px";
me.innerHTML=name;
document.onkeypress=function(e){
	var code = e.keyCode;
	var s = String.fromCharCode(code);
	switch(s){
	case 'd':
		x++;
		me.style.left=x+"px";
		break;
	case 'w':
		y--;
		me.style.top=y+"px";
		break;
	case 'a':
		x--;
		me.style.left=x+"px";
		break;
	case 's':
		y++;
		me.style.top=y+"px";
		break;
	}

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
</script>
</html>