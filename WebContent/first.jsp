<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>首页</title>
	</head>
	<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>

	<style>
		.head {
			max-width: 1936px;
			height: 360px;
			background: url(img/0.jpg) no-repeat 4px 5px;
			background-size: 100% 100%;
		}
	</style>

	<body>
		<div class="head">

		</div>
	
		<div class="container " style="margin-top: 20px;">
			<div class="row clearfix ">
				<div class="col-md-12 column ">
					<nav class="navbar navbar-default " role="navigation " style="background-color:pink">
						<div class="navbar-header ">
							 <button type="button " class="navbar-toggle " data-toggle="collapse " data-target="#bs-example-navbar-collapse-1 "> <span class="sr-only ">Toggle navigation</span><span class="icon-bar "></span><span class="icon-bar "></span><span class="icon-bar "></span></button> <a class="navbar-brand " href="# ">PlaneWar</a>
						</div>
						
						<div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1 ">
							<ul class="nav navbar-nav ">
								
								<li>
									 <a href="person1.jsp">My info</a>
								</li>
								<li>
									 <a href="History.jsp">WarRecord</a>
								</li>
								<li><a href="gameLo">Game Lobby</a></li>
							</ul>
							
							<ul class="nav navbar-nav navbar-right ">
								<li>
									 <a href="login.jsp">login</a>
								</li>
								<li><a href="signup.jsp">signup</a></li>
							</ul>
						</div>
						
					</nav>
					<div class="row ">
						<div class="col-md-4 ">
							<div class="thumbnail ">
								<img alt="300x200 " src="img/1.jpg" />
								<div class="caption ">
									<h3 style="margin-left:80px">
										Our Team
									</h3>
									<p>
										&nbsp;&nbsp; A good game needs a good team,as the fish can not survive without water
									
								</div>
							</div>
						</div>
						<div class="col-md-4 ">
							<div class="thumbnail ">
								<img alt="300x200 " src="img/2.jpg" />
								<div class="caption ">
									<h3 style="margin-left:60px">
										Origin of game 
									</h3>
									<p>
										&nbsp;&nbsp;Our game just like plane war,two and more 
										players can join the game and fight with one another
									</p>
									
								</div>
							</div>
						</div>
						<div class="col-md-4 ">
							<div class="thumbnail ">
								<img alt="300x200 " src="img/3.jpg" />
								<div class="caption ">
									<h3 style="margin-left:60px">
										Pleased People
									</h3>
									<p> 
										&nbsp;&nbsp; Our game is full of fun,so I strongly suggest you play our game and 
										have a good time
									</p>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
 		
 		
	</body>
	
	
</html>