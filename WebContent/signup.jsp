<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册页面</title>
		<link rel="stylesheet" href="css/style.css" type="text/css" 
			media="all"/>
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/css/bootstrap.min.css"/>
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-pills">
				<li >
					 <a href="#">首页</a>
				</li>
				<li>
					 <a href="#">登陆</a>
				</li >
				<li class="active">
					 <a href="#">注册</a>
				</li>
				<li class="dropdown pull-right">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">忘记密码？<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							 <a href="#">重新注册</a>
						</li>
						<li>
							 <a href="#">找回密码</a>
						</li>
			
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="row clearfix" style="margin-top:20px">
		<div class="col-md-12 column">
			<form class="form-horizontal" role="form" action="user" method="post">
				<div class="form-group">
					 <label for="username" class="col-sm-2 control-label">Username</label>
					<div class="col-sm-4">
						<input type="hidden" name="act"  value="addUser"/>
						<input type="text" name="rid" class="form-control" id="username" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-4">
						<input type="password"  name="password" class="form-control" id="inputPassword3" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							 <label><input type="checkbox" />Remember me</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">Sign in</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>	
	</body>
</html>