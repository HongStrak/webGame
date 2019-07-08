//如果一个js里面有一个方法写错了，整个js不能用
//function draw(){
//	alert("success!");
//}
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

//返回一个小于180度和右边正切的圆弧
function drawArc(x,y,r,angle){
	var circle = drawCircle(x,y,r);
	// clip对应属性（y开始，x结束，y结束，x开始）
	var x0 = r-r*cos(angle/2)+1;
	circle.style.cssText+="clip: rect(0px,"+x0+"px,"+(2*r)+"px,0px);";
	rotateZ(circle,180);
    return circle;
}
function drawSector(x,y,r,angle){
	
	
	
	var d = document.createElement("div");
	var arc = drawArc(0,0,r,angle);
	var l1 = drawLine(0,0,r);
	var l2 = drawLine(0,0,r);
	l1.style.cssText+="transform-origin: 0 50%;";
	l2.style.cssText+="transform-origin: 0 50%;";
	rotateZ(l1,(angle/2));
	rotateZ(l2,(360-angle/2));
	d.appendChild(l1);
	d.appendChild(l2);
	d.appendChild(arc);
	cstyle(d,"position: absolute;left:"+x+"px;top:"+y+"px;");
	return d;
}
function test(){
	alert(x);
}
function sqrt(value){
	return Math.sqrt(value);
}
function sq(value){
	var v = value*value;
	return v;
}

//把字符串类型转换成number类型
function int(value){
	return parseInt(value);
}
function clz(clz){
	var c = document.getElementsByClassName(clz);
return c;
}
function xyToAngle(x0,y0,x1,y1){
	var b = (y0-y1)/(x1-x0);
	var angle = atan(b);
	if(b<0){
		angle+=360;
}
	if((y0-y1)>0&&(x1-x0)<0){
		angle+=180;
				}
	if((y0-y1)<0&&(x1-x0)<0){
		angle+=180;
	}
	angle = formatAn(angle);
	return angle;
}
function isByShoot(oth,angle){
	angle = formatAn(angle);
	
	var xo = int(oth.getAttribute("x"));
	var yo = int(oth.getAttribute("y"));
	var x1=x+40;
	var y1=y+40;
	var distance = sqrt(sq(x1-xo)+sq(y1-yo));
	var disAn = xyToAngle(x1,y1,xo,yo);
	if(distance<rangeLen&&(formatAn(disAn-angle)<rangeAng/2||formatAn(disAn-angle)>(360-rangeAng/2))){
		return true;
	}else{
		return false;
	}
}
function formatAn(an){
	var a = (an+360)%360;
	return a;
}
function whoByShoot(){
	var oth = clz("other");
	var arr = new Array();
	var xoth;
	var yoth;
	for(var i=0;i<oth.length;i++){
		xoth=parseInt(oth[i].getAttribute("x"));
		yoth=parseInt(oth[i].getAttribute("y"));
	}
}
function cstyle(id,style){
	id.style.cssText+=style;
}
function moveX(){
	var dis = cos(targetAn)*speed;
	x+=dis;
	me.style.left=x+"px";
}
function moveY(){
	var dis = sin(targetAn)*speed;
	y-=dis;
	
	me.style.top=y+"px";
}
function abval(val){
	if(val<0){
		val=-val;
	}
	return val;
}




