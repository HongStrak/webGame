<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/backstage/head/link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>封号管理页面</title>
</head>
<body>
<!--主体内容-->
<div class="list-content">
	<!--块元素-->
	<div class="block">
		<!--页面有多个表格时，可以用于标识表格-->
		<h2>标题</h2>
		<!--右上角的返回按钮-->
		<a href="javascript:history.back();">
			<button class="button indigo radius-3" style="position: absolute;right: 20px;top: 16px;"><span class="icon-arrow_back"></span> 返回</button>
		</a>
		
		<!--正文内容-->
		<div class="main">
			<!--表格上方的搜索操作-->
			<div class="admin-search">
				<div class="input-group">
					<input type="text" name="username" class="text" placeholder="提示信息" />
					<button class="button blue search">搜索</button>
				</div>
			</div>
			
			<!--表格上方的操作元素，添加、删除等-->
			<div class="operation-wrap">
				<div class="buttons-wrap">
					<!-- <button id="add" class="button blue radius-3"><span class="icon-plus"></span> 添加</button> -->
					<button id="edit" class="button green radius-3"><span class="icon-edit-2"></span> 编辑</button>
					<button id="delete" class="button red radius-3"><span class="icon-close2"></span> 删除</button>
				</div>
			</div>
			<table id="table" class="table color2">
				<thead>
					<tr>
						<th class="checkbox"><input type="checkbox" class="fill listen-1" /> </th>
						<th>序号</th>
						<th>账号</th>
						<th>密码</th>
						<th>信用度</th>
						<th>封号天数</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="page">
				<!-- <ul id="page" class="pagination"></ul> -->
			</div>
			
		</div>
	</div>
</div>
</body>
<script type="text/javascript">

	$(function(){
		var id;
		
		var nowpage = 1; //默认第一页
		
		$(".search").click(function(){
			
			javaex.message({
				content : "数据提交中，请稍候...",
				type : "submit"
			});
			
			
			var username = $("[name = username]").val();
			
			$.ajax({
				url:"/user?act=cday",
				type:"get",
				data:{'username':username,'nowpage':nowpage},
				dataType:"json",
				
				success:function(result){
					console.log(result);
					
					javaex.message({
						content : "操作成功",
						type : "success"
					});
					
					$("table > tbody").html("");
					$.each(result.list,function(index,item){
						$("table > tbody").append("<tr><td class=\"checkbox\"><label class=\"fill-label\"><input type=\"checkbox\" name=\"cond\" "
								+"value=\""+item.id+"\"  class=\"fill listen-1-2\">"
								+"<span class=\"fill-css icon-check\" style=\"color: #fff;\"></span><span></span></label></td>"
								+"<td>"+(index+1)+"</td>"
								+"<td>"+item.username+"</td>"
								+"<td>"+item.password+"</td>"
								+"<td>"+item.credit+"</td>"
								+"<td>"+item.cday+"</td></tr>");
					});
					if(result.byname != "true"){
						$(".page").html("");
						$(".page").append("<ul id=\"page\" class=\"pagination\"></ul>");
						
						 javaex.page({
							id : "page",
							pageCount : result.pageCount,	// 总页数
							currentPage : nowpage,// 默认选中第几页
							//perPageCount : 10,	// 每页显示多少条，不填时，不显示该条数选择控件
							isShowJumpPage : true,	// 是否显示跳页
							totalNum : result.totalCount,		// 总条数，不填时，不显示
							position : "right",
							callback : function(rtn) {
								nowpage = rtn.pageNum;
								$(".search").click();
							}
						});  
					}else{
						$(".page").html("");
					}
				},
				error:function(){
					javaex.message({
						content : "操作失败",
						type : "error"
					});
				}
			})
		});
		
		$("#edit").click(function(){
			var cond = document.getElementsByName("cond");
			
			for(var i=0;i<cond.length;i++){
				if(cond[i].checked){
					javaex.dialog({
						type : "window",
						id : "test",	// 指定id，仅当页面存在多个弹出层，需要关闭指定弹出层时才使用
						url : "/user?act=toEditUser&id="+cond[i].value,	// 页面地址或网址或请求地址
						width : "800",	// 弹出层宽度
						height : "600",	// 弹出层高度
						closeX : "callback()"
					}); 
					break;
				}
			}
		});
		
		$("#delete").click(function(){
			var cond = document.getElementsByName("cond");
			var ids = []; //传输数组
			for(var i=0;i<cond.length;i++){
				if(cond[i].checked){
					ids.push(cond[i].value);
				}
			}
			//alert(ids);
			$.ajax({
				url:"/user?act=delete",
				type:"post",
				data:{"ids":ids},
				datatype:"json",
				traditional:true,
				success:function(result){
					javaex.alert({
						content : "修改了"+result+"条数据",
					});
					//解决刷新问题
					$(".search").click();
				},
				error:function(){
					alert("error");
				}
			})
		});
		
		
	})
	
	function callback() {
			alert("确定退出");
		}

</script>
</html>