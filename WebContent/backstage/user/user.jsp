<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/backstage/head/link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
</head>
<body>
<!--主体内容-->
<div class="list-content">
	<!--块元素-->
	<div class="block">
		<!--页面有多个表格时，可以用于标识表格-->
		<h2>用户管理</h2>
		<!--右上角的返回按钮-->
		<a href="javascript:history.back();">
			<button class="button indigo radius-3" style="position: absolute;right: 20px;top: 16px;"><span class="icon-arrow_back"></span> 返回</button>
		</a>
		
		<!--正文内容-->
		<div class="main">
			<!--表格上方的搜索操作-->
			<div class="admin-search">
				<div class="input-group">
					<input type="text" class="text" placeholder="提示信息" />
					<button class="button blue">搜索</button>
				</div>
			</div>
			
			<!--表格上方的操作元素，添加、删除等-->
			<div class="operation-wrap">
				<div class="buttons-wrap">
					<button class="button blue radius-3"><span class="icon-plus"></span> 添加</button>
					<button class="button red radius-3"><span class="icon-close2"></span> 删除</button>
				</div>
			</div>
			<table id="table" class="table color2">
				<thead>
					<tr>
						<th class="checkbox"><input type="checkbox" class="fill listen-1" /> </th>
						<th>序号</th>
						<th>市区</th>
						<th>省区</th>
						<th>国别</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="checkbox"><input type="checkbox" class="fill listen-1-2" /> </td>
						<td>1</td>
						<td>苏州</td>
						<td>江苏省</td>
						<td>中国</td>
					</tr>
					<tr>
						<td class="checkbox"><input type="checkbox" class="fill listen-1-2" /> </td>
						<td>2</td>
						<td>无锡</td>
						<td>江苏省</td>
						<td>中国</td>
					</tr>
					<tr>
						<td class="checkbox"><input type="checkbox" class="fill listen-1-2" /> </td>
						<td>3</td>
						<td>常州</td>
						<td>江苏省</td>
						<td>中国</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>