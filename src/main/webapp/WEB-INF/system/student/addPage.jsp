<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- [EasyUI] -->
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="${ctx }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="${ctx }/static/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/notebook/notebook_files/app.v1.css" />
<script type="text/javascript"
	src="${ctx }/static/easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctx }/static/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<title>学生添加</title>
</head>
<body>
	<form id="form" name="form" class="form-horizontal" method="post" action="${ctx}/student/add">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">姓名</label>
				</div>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入姓名"
						name="username" id="userName">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">学号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入学号" name="studentId" id="accountName">
				</div>
			</div>

			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">学院</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请选择学院" name="departdent" id="accountName">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">专业</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请选择专业" name="major" id="accountName">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">班级</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请选择班级" name="className" id="accountName">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">状态</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
						<button data-toggle="dropdown"
							class="btn btn-sm btn-default dropdown-toggle">
							<span class="dropdown-label">使用中</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-select">
							<li class=""><a href="#"><input type="radio"
									name="status" value="0" checked="checked">是</a></li>
							<li class="active"><a href="#"><input type="radio"
									name="status" value="1">未使用</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">密码</label>
				<div class="col-sm-9" style="color: red;">默认密码为:123456</div>
				<input type="hidden" name="password" value="123456" />
			</div>
			<div class="line line-dashed line-lg pull-in"></div>

			<div class="line line-dashed line-lg pull-in"></div>

			<footer class="panel-footer text-right bg-light lter">
			<button id="submit" class="btn btn-success btn-s-xs">提交</button>
			</footer>
		</section>
	</form>
	
</body>
</html>