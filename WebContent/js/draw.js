//如果一个js里面有一个方法写错了，整个js不能用
function draw(){
	alert("success!");
}
function sin(value){
	return Math.sin(value/180*3.1415926);
}
//根据正切值返回角度
function atan(value){
	 return ((Math.atan(value))*180/3.1415926);
}
function cos(value){
	return Math.cos(value/180*3.1415926);
}
function drawCircle(x,y,r){
	var div = document.createElement("div");
	div.style.cssText="top: "+(y-r)+"px;"
				+"border-radius: 95%;"
				+"left: "+(x-r)+"px;"
				+"width:"+(2*r)+"px;"
				+"height: "+(2*r)+"px;"
				+"border: 1px solid black;"
				+"position: absolute;";
	return div;
}
function id(id){
	return document.getElementById(id);
}

function drawLine(x,y,width){
	var l = document.createElement("div");
	l.style.cssText="top: "+y+"px;left: "+x+"px;position: absolute;"+
	"height:1px;width:"+width+"px;border-top:1px solid black;";
	return l;
}
function rotateZ(e,angle){
	if(angle<0){
		angle+=360;
	}
	e.style.transform="rotateZ(-"+angle+"deg)";
}
function c(e){
	return e.style.cssText;
}

//返回一个小于180度和右边正切的圆弧
function drawArc(x,y,r,angle){
	var circle = drawCircle(x,y,r);
	// clip对应属性（y开始，x结束，y结束，x开始）
	var x0 = r-r*cos(angle/2)+1;
	circle.style.cssText+="clip: rect(0px,"+x0+"px,200px,0px);";
	rotateZ(circle,180);
    return circle;
}
function drawSector(r,angle){
	
	var y =r*sin(angle)-8;
	
	var d = document.createElement("div");
	var arc = drawArc(0,y,r,angle);
	var l1 = drawLine(0,y,r);
	var l2 = drawLine(0,y,r);
	l1.style.cssText+="transform-origin: 0 50%;";
	l2.style.cssText+="transform-origin: 0 50%;";
	rotateZ(l1,(angle/2));
	rotateZ(l2,(360-angle/2));
	d.appendChild(l1);
	d.appendChild(l2);
	d.appendChild(arc);
	return d;
}


