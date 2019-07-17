<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>登陆页面</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>
		
		
		<meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<!--webfonts-->
		<link rel="stylesheet" href="index/css/bootstrap.min.css">
		<link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
		<!--//webfonts-->
		<script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/jquery-2.2.3.min.js"></script>
	</head>
	
    <style type="text/css">
			#submit{
				font-size: 30px;
			    color: #fff;
			    outline: none;
			    border: none;
			    background: #3ea751;
			    width: 100%;
			    padding: 18px 0;
			    cursor: pointer;
			}
		</style>
	<body>
		<script>
			$(document).ready(function(c) {
				$('.close').on('click', function(c) {
					$('.login-form').fadeOut('slow', function(c) {
						$('.login-form').remove();
					});
				});
			});
		</script>
		<!--SIGN UP-->
		<h1>Welcome to Game</h1>
		<div class="login-form">
			<div class="close"> </div>
			<div class="head-info">
				
				<label class="lbl-1"></label>
				<label class="lbl-2"> </label>
				<label class="lbl-3"> </label>
			</div>
			<div class="clear"> </div>
			<div class="avtar">
				<img src="images/avtar.png" />
			</div>
			<form action="" method="post" id="login">
				<input  type="text" class="text" value="Username"  autocomplete="off"  name="username" onfocus="this.value = '';" >
				<div class="key">
					<input  type="password" value="Password"  name="password" onfocus="this.value = '';" >
				</div>
				<div class="signin">
				<input type="button" id="submit" value="Login">
			    </div>
			</form>
			
		</div>
		

	</body>
	
	<script type="text/javascript">
      $(function(){
    	  $("[name = username]").blur(function(){
			var value = $("[name = username]").val();
			// 4-10
			var reg = /^[a-zA-Z0-9]{4,10}$/;
			if(!reg.test(value)){
				alert("账号格式错误");
			}
    	  })
    	  
    	  $("[name = password]").blur(function(){
			var value = $("[name = password]").val();
			// 4-10
			var reg = /^[a-zA-Z0-9]{4,10}$/;
			if(!reg.test(value)){
				alert("密码格式错误");
			}
    	  })
    	  
    	   // 监听点击保存按钮事件
		$("#submit").click(function() {
			alert("sadsa");
			 $.ajax({
		           //几个参数需要注意一下
		           url: "join",//url
		              type: "get",//方法类型
		              dataType:"text",//预期服务器返回的数据类型
		              data:$('#login').serialize(),
		              success:function (result) {
		                  console.log(result);//打印服务端返回的数据(调试用)
		              	if(result == "false"){
		                   alert("账号或密码错误");
		              	}else if(result == "true"){
		              		alert("登陆成功");
		              		window.location.href = "first1.jsp";
		              	}
		              },
		              error : function(result) {
		              	console.log(result);
		                  alert("异常！");
		              }
		          });
			})
			
			
      })
      
   
    </script>
</html>
    