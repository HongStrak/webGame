<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/backstage/head/link.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑</title>
</head>
<body>
	<div class="list-content">
	<!--块元素-->
	<div class="block">
		<!--正文内容-->
		<div class="main">
			<form id="edit">
				<!--文本框-->
				<div class="unit clear">
					<input type="hidden" class="text" name="id" value="${user.id }" />
					<div class="left"><span class="required">*</span><p class="subtitle">账号：</p></div>
					<div class="right">
						<input type="text" class="text" name="username" data-type="必填" value="${user.username }" />
					</div>
				</div>
				<div class="unit clear">
					<div class="left"><span class="required">*</span><p class="subtitle">密码：</p></div>
					<div class="right">
						<input type="text" class="text" name="password" data-type="必填"  value="${user.password }" />
					</div>
				</div>
				<div class="unit clear">
					<div class="left"><span class="required">*</span><p class="subtitle">信用度：</p></div>
					<div class="right">
						<input type="text" class="text" name="credit" data-type="必填" value="${user.credit }"  />
					</div>
				</div>
				<div class="unit clear">
					<div class="left"><span class="required">*</span><p class="subtitle" >封号天数：</p></div>
					<div class="right">
						<input type="text" class="text" name="cday" data-type="必填" value="${user.cday }" />
					</div>
				</div>
				
				<!--提交按钮-->
				<div class="unit clear" style="width: 800px;">
					<div style="text-align: center;">
						<!--表单提交时，必须是input元素，并指定type类型为button，否则ajax提交时，会返回error回调函数-->
						<input type="button" id="return" class="button no" value="返回"  />
						<input type="button" id="save" class="button yes" value="保存" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$("#save").click(function(){
		// 表单验证函数
		if (javaexVerify()) {
			 $.ajax({
	            //几个参数需要注意一下
	            url: "/user?act=updateUser",//url
                type: "post",//方法类型
                dataType:"text",//预期服务器返回的数据类型
                data:$('#edit').serialize(),
                success:function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                	if(result == "true"){
                		//alert("编辑成功");
                		parent.javaex.close();
	                    parent.$(".search").click();
                	}
                },
                error : function() {
                    alert("异常！");
                }
            });
		} else {
			return false;
		}
	});
	
	$("#return").click(function(){
		parent.javaex.close();
	})

</script>
</html>