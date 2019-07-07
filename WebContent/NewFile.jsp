<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.3.min.js"></script>
<script language="javascript" type="text/javascript">
	function showdiv() {
		document.getElementById("bg").style.display = "block";
		document.getElementById("show").style.display = "block";

		$('body').css("overflow", "hidden")
	}
	function hidediv() {
		document.getElementById("bg").style.display = 'none';
		document.getElementById("show").style.display = 'none';
		
		$('body').css("overflow", "auto")
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>

<style type="text/css">
#bg {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background-color: black;
	z-index: 1001;
	/*-moz-opacity: 0.7;*/
	opacity: .70;
	/*filter: alpha(opacity = 70);*/
}

#show {
	display: none;
	position: absolute;
	top: 25%;
	left: 22%;
	width: 49%;
	height: 49%;
	padding: 8px;
	border: 8px solid #E8E9F7;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

#box {
	width: 200px;
	height: 50px;
	background_color: grey;
}

#btnbegin {
	background-color: cornsilk;
	position: relative;
	top: -45px;
	left: 630px;
}

#btnclose {
	background-color: cornsilk;
}

#login {
    top: 10px;
	position: relative;
	left: 100px;
}

.banner {
    margin-top:30px;
	height: 55px;
	/*background-color: black;*/
}

.picture {
	font-size: 26px;
	color: white;
	font-family: 楷体;
	margin-left: 30px;
	float: left;
}

.table {
	width: 450px;
	height: 55px;
	/*background-color: yellow;*/
	margin-left: 30px;
	float: left;
}

.table ul {
	list-style-type: none;
}

.table ul li {
	float: left;
	line-height: 55px;
	font-family: 宋体;
	font-size: 18px;
	padding: 0 7px;
	color: white;
}

.table ul li:hover {
	cursor: pointer;
}

.search {
	width: 400px;
	float: left;
}

.search .kuang {
	height: 25px;
	margin-top: 13px;
}

.search .btn {
	width: 80px;
	height: 30px;
	background-color: whitesmoke;
}

.login {
	width: 200px;
	float: right;
}

.login a {
	text-decoration: none;
	color: white;
	line-height: 55px;
}

#img img {
	width: 1349px;
	height: 600px;
}

body {
	/*padding-top: 300px;*/
	background:
		url(image/2a95123cfbaeed9ba4a0a2d88759faac9912cf6411435-AZsLBr_fw658.jpg)
		no-repeat #efeff4;
	background-size: 100% 100%;
	width: 1349px;
	height: 600px;
}

#butt {
	position: relative;
	left: 80px;
}
</style>
</head>
<body>

	<div class="banner">
		<div class="picture">游戏首页</div>
		<div class="table">
			<ul>
				<li><a href="#">游戏资料</a></li>
				<li><a href="#">角色信息</a></li>
				<li><a href="#">充值购买</a></li>
				<li><a href="#">游戏下载</a></li>
			</ul>
		</div>
		
		<div class="search">
			<input class="kuang" type="text" name="name" /> <input class="btn"
				type="button" value="战绩查询"  onclick="location.href='History.jsp'"  />
		</div>
		<div class="login">

			<a href="#">注册</a>
			
		</div>
	</div>
	
<input id="btnbegin" type="button" value="点击登录" onclick="showdiv();"
		style="width: 80px; height: 40px; opacity: 0.8;" />
	<div id="bg">

		<div id="img">
			<img
				src="image/2a95123cfbaeed9ba4a0a2d88759faac9912cf6411435-AZsLBr_fw658.jpg" />
		</div>
	</div>

	<div id="show">
		<div id="box">
			<input id="btnclose" type="button" value="返回" onclick="hidediv();"
				style="width: 50px; height: 30px;" />
		</div>


		<div id="login">
			<form action="joinG">
				账 号：<input type="text" name="username"
					style="width: 150px; height: 30px;"> <br>
				<br> 密 码：<input type="text" name="username"
					style="width: 150px; height: 30px;"> <br>
				<br>
				<br>
				<br>
				<br> <input type="submit" value="登录"
					style="width: 70px; height: 30px;" id="butt">
			</form>
		</div>
	</div>

</body>
</html>