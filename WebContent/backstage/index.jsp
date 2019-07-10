 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/backstage/head/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>测试首页</title>
<meta charset="utf-8">
<style type="text/css">
</style>
</head>
<body>
	<!--左侧菜单-->
	<div class="admin-iframe-content">
		<div class="admin-iframe-menu">
			<ul class="menu">
				<li class="active"><a href="javascript:;">管理中心</a></li>
				<li><a href="javascript:">自定义</a></li>
			</ul>
			
			<ul class="menu">
				<li class="menus">
					<a href="javascript:;">系统管理</a>
					<ul class="menu">
						<li><a href="javascript:;">武器管理</a></li>
						<li><a href="javascript:;">皮肤管理</a></li>
					</ul>
				</li>
			</ul>
			
			<ul class="menu">
				<li class="menus">
					<a href="javascript:;">用户管理</a>
					<ul class="menu">
						<li><a href="javascript:page('/backstage/user/user.jsp');">用户信息</a></li>
						<li><a href="javascript:;">战绩管理</a></li>
						<li><a href="javascript:page('/backstage/user/cday.jsp');">封号管理</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<!--载入页面-->
		<div class="admin-markdown">
			<iframe id="page" src=""></iframe>
		</div>
	</div>
</body>
<script>
	javaex.loading();
	
	javaex.nav({
		id : "nav",	// 导航的id
		isAutoSelected : true
	});
	
	// 控制页面载入
	function page(url) {
		var loginname = "${loginname }";
		if(loginname != null && loginname != ""){
			$("#page").attr("src", url);
		}else{
			window.location.href="login.jsp";
		}
	};
	
	// 菜单保持高亮
	javaex.iframeMenu();
</script>
</html>