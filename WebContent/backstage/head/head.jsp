<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/backstage/head/link.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 顶部导航和右侧登陆  -->
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!--顶部导航-->
	<div id="nav" class="admin-iframe-header">
		<h1 class="logo"><a href="javascript:;">火柴人后台管理</a></h1>
		<div class="admin-iframe-nav">
			<ul class="navs">
				<li class="nav active"><a href="#">首页</a></li>
				<li class="nav"><a href="#">全局</a></li>
				<li class="nav"><a href="#">界面</a></li>
				<li class="nav"><a href="#">用户</a></li>
				<li class="nav"><a href="#">分类</a></li>
				<li class="nav"><a href="#">视频</a></li>
				<li class="nav"><a href="#">接口</a></li>
				<li class="nav"><a href="#">站长</a></li>
			</ul>
		</div>

		<!--右侧功能-->
		<div class="admin-iframe-header-right">
			<ul class="navs">
				<li class="nav">
					<c:if test="${sessionScope.username != null }">
						<p class="pull-left margin-left-10">欢迎您，<span>${sessionScope.username }</span></p>
						<label class="margin-left-10">|</label>
						<a href="../checkout">退出</a>
					</c:if>
					<c:if test="${sessionScope.username == null }">
						<a href="javascript:login();">登陆</a>
					</c:if>
				</li>
				<li class="nav"><a href="javascript:;" target="_blank">站点首页</a></li>
			</ul>
		</div>
	</div>
</body>

<script type="text/javascript">
	//登陆
	function login(){
		javaex.dialog({
			type : "dialog",	// 弹出层类型
			width : "400",
			height : "300",
			url : "/backstage/head/login.html",
		});
	};
</script>
</html>