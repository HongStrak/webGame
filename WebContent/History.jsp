<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
		<title>历史战绩查询</title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/css/bootstrap.min.css"/>
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> 
		 <a class="navbar-brand" href="#">历史战绩查询</a>
	</div>
	
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li>
				 <a href="#">首页</a>
			</li>
			
			
		</ul>
		<form action="history" class="navbar-form navbar-left" role="search">
			<div class="form-group">
				 <input type="hidden" name="act" value="searchhistory" /> 
				<input type="text" class="form-control" name="heroname" />
			</div> <button type="submit" class="btn btn-default">search</button>
		</form>
	</div>
</nav>

<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">					
					<table class="table">
						<thead>
							<tr>
								<th>英雄编号</th>
								<th>英雄姓名</th>
								<th>胜利次数</th>
								<th>胜率</th>
								<th>平均排名</th>
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${historys}" var="history">
								<tr>
									<td>${history.heronum }</td>
									<td>${history.heroname }</td>
									<td>${history.victory }</td>
									<td>${history.winrate }</td>
									<td>${history.averank }</td>
									
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
                    <c:if test="${cp!=null }">
						<ul class="pagination">
							<li <c:if test="${cp==1}"> class="disabled" </c:if> >
							<a href="history?act=searchhistory&cp=${cp-1<=0? 1:cp-1}">&laquo;</a></li>
								
							<c:forEach begin="1" end="${totalPage}" var="item">
								<li <c:if test="${item==cp }"> class="active" </c:if> ><a href="history?act=searchhistory&cp=${item}">${item}</a></li>
							</c:forEach>
							
							<li <c:if test="${cp==totalPage}"> class="disabled" </c:if>>
							<a href="history?act=searchhistory&cp=${cp+1>totalPage? totalPage:cp+1}">&raquo;</a></li>
						</ul>
					</c:if>
					
</body>
</html>