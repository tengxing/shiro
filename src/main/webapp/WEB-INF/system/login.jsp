<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" />
	<script src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.js"></script>
<%-- <%@include file="/common/common.jspf"%> --%>


<%-- 	<script src="${ctx}/notebook/notebook_files/jquery.flot.min.js"></script>
	<script src="${ctx}/notebook/notebook_files/jquery.flot.tooltip.min.js"></script>
	<script src="${ctx}/notebook/notebook_files/jquery.flot.resize.js"></script>
	<script src="${ctx}/notebook/notebook_files/jquery.flot.grow.js"></script>
	<script src="${ctx}/notebook/notebook_files/jquery.sparkline.min.js"></script>
	<script src="${ctx}/notebook/notebook_files/jquery.sortable.js"></script>
	<script src="${ctx}/notebook/notebook_files/jquery.easy-pie-chart.js"></script>
	<script src="${ctx}/notebook/notebook_files/bootstrap_calendar.js"></script> --%>
</head>

<script type="text/javascript">
	var path="<%=request.getContextPath()%>";
</script>
<body class="login">

	<section>

	<h1>
		<strong>网络题库资源</strong> 平台
	</h1>
	<form>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

			<div class="input-icon">
				<i class="fa fa-user"></i> <input id="username"
					class="form-control placeholder-no-fix" type="text"
					autocomplete="off" placeholder="Username" name="username"
					value="admin" />
			</div>
		</div>
		<div class="form-group">

			<div class="input-icon">
				<i class="fa fa-lock"></i> <input id="password"
					class="form-control placeholder-no-fix" type="password"
					autocomplete="off" placeholder="Password" name="password"
					value="123456" />
			</div>
		</div>
		<label>学生</label> <input type="radio" name="status" value="1"
			checked="checked" /> <br> <label>教师</label><input type="radio"
			name="status" value="2" /> <br> <label>管理员</label> <input
			type="radio" name="status" value="3" /> <br> <input
			type="button" id="submit" value="登录" /> ${request.Scope.error}
	</form>
	<p>
		<a href="#">Forgot your password?</a>
	</p>
	</section>

	<script type="text/javascript">
			var sub = $("#submit");
	sub.click(function() {
	$.ajax({

		type : 'POST',

		url : path+"/login",

		data : {
			username:$("#username").val(),
			password:$("#password").val()
		},
		dataType:"json",
		success: function (data) {
			alert(JSON.stringify(data));
           		 if (data.success== false) {
               			alert(data.msg);
           		 }else{
				// alert("登录成功");
               			 window.location.href = "home";
				}
			}
		});
	});
	</script>
	
</body>
</html>