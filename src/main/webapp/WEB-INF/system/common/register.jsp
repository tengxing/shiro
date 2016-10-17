<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎注册</title>
	<script>
	var path=<%=request.getContextPath()%>;
	</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/css/bootstrap.min.js">
	
	
</script>
</head>
<body>
<p>请填写以下信息</p>
	<form action="<%=request.getContextPath()%>/control/register" id="message" method="POST">
	
	<label>学号：</label>  <input type="text" name="studentId" value="14110403001"/>
		<label>姓名：</label>  <input type="text" name="username"/>
			<label>密码：</label>  <input type="text" name="password" value="123456"/>
			<input type="submit" id="submit" value="保存" />
			
			
	</form>
	<a href="<%=request.getContextPath()%>/control/index">登录</a>
	<script type="text/javascript">
		if ("${status}" != "") {
			alert("${status}");
		};
	</script>
	<script type="text/javascript">

	/* 	$("#submit").click(function(){
			
			$.ajax({
				type:post,
				url:path+"control/registger",
				date:$("#message").serialize(),
				sucess:function(data){
					alert(data.getJSON());
					window.location=path+"control/system";
				}
			})
		});
		 */
		
	</script>
</body>
</html>