<%--标签 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<link rel="stylesheet" href="${ctx}/notebook/notebook_files/font.css" type="text/css">
<link rel="stylesheet" href="${ctx}/notebook/notebook_files/app.v1.css" type="text/css">
<link rel="stylesheet" href="${ctx}/css/lanyuan.css" type="text/css">
	<!-- base start 重要部分不可删改-->
<script type="text/javascript" src="${ctx}/notebook/notebook_files/app.v1.js"></script>
<script type="text/javascript" src="${ctx}/notebook/notebook_files/app.plugin.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/messages_cn.js"></script>
<script type="text/javascript" src="${ctx}/js/layer-v1.9.2/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/underscore.js"></script>
<script type="text/javascript" src="${ctx}/common/lyGrid.js"></script>
<!--[if lt IE 9]> <script src="${ctx}/js/jquery/ie/html5shiv.js"></script> <script src="${ctx}/js/jquery/ie/respond.min.js"></script><![endif]-->
<link href="${ctx}/js/date/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/js/date/font-awesome.min.css" rel="stylesheet">
<!-- [EasyUI] --><%-- 
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
<script type="text/javascript" src="${staticPath }/static/easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticPath }/static/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script> --%>
<!-- [扩展JS] -->
<%-- <script type="text/javascript" src="${staticPath }/static/extJs.js" charset="utf-8"></script> --%>


<script type="text/javascript">
    var basePath = "${staticPath }";
</script>