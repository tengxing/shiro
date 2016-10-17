<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="en"
	class="app">
<head>
<title>题库资源平台</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<!-- name="viewport" 的详细用法  http://www.php100.com/html/webkaifa/HTML5/2012/0831/10979.html -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/favicon.ico" type="image/x-icon" rel="shortcut icon">
<!-- 
width - viewport的宽度 height - viewport的高度
initial-scale - 初始的缩放比例
minimum-scale - 允许用户缩放到的最小比例
maximum-scale - 允许用户缩放到的最大比例
user-scalable - 用户是否可以手动缩放
 -->
<script type="text/javascript">
//js获取项目根路径，如： http://localhost:8083/uimcardprj  
function getRootPath(){  
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp  
    var curWwwPath=window.document.location.href;  
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp  
    var pathName=window.document.location.pathname;  
    var pos=curWwwPath.indexOf(pathName);  
    //获取主机地址，如： http://localhost:8083  
    var localhostPaht=curWwwPath.substring(0,pos);  
    //获取带"/"的项目名，如：/uimcardprj  
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);  
    return(localhostPaht+projectName);  
}  
 var path=getRootPath();
</script>
<link rel="stylesheet" href="notebook/notebook_files/font.css" type="text/css">
<link rel="stylesheet" href="notebook/notebook_files/app.v1.css" type="text/css">
	<!-- base start 重要部分不可删改-->
<script type="text/javascript" src="notebook/notebook_files/app.v1.js"></script>
<script type="text/javascript" src="notebook/notebook_files/app.plugin.js"></script>
<script type="text/javascript" src="js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery-validation/messages_cn.js"></script>
<script type="text/javascript" src="js/layer-v1.9.2/layer/layer.js"></script>
<script type="text/javascript" src="common/common.js"></script>
<script type="text/javascript" src="js/jquery/underscore.js"></script>
<script type="text/javascript" src="common/lyGrid.js"></script>
<!--[if lt IE 9]> <script src="/js/jquery/ie/html5shiv.js"></script> <script src="js/jquery/ie/respond.min.js"></script><![endif]-->
<link href="js/date/bootstrap.min.css" rel="stylesheet">
<link href="js/date/font-awesome.min.css" rel="stylesheet">
<%-- 
    时间控件 -------- 可能导致样式问题,和某些js事件失效 如加上,,自行处理
<link rel="stylesheet" type="text/css" media="all" href="js/date/daterangepicker-bs3.css" />
<script type="text/javascript" src="js/date/bootstrap.min.js"></script>
<script type="text/javascript" src="js/date/moment.js"></script>
<script type="text/javascript" src="js/date/daterangepicker.js"></script>--%>
<script type="text/javascript" src="js/system/user/updatePassword.js"></script> 
<style type="text/css">
.l_err{
    background: none repeat scroll 0 0 #FFFCC7;
    border: 1px solid #FFC340;
    font-size: 12px;
    padding: 4px 8px;
    width: 200px;
    display: none;
}
.error{
  border: 3px solid #FFCCCC;
}
.form-group{
  padding-left: 15px
}
.left{
	text-align: left;
	padding-left: 10px;
}
.right{
	text-align: right;
}
.hidden-xs{
	display: inherit;
}
</style>
<!-- base end -->
<script type="text/javascript">
function onloadurl(){

	$("[data-url]").each(function () {
		var tb = $(this);
		tb.html(CommnUtil.loadingImg());
		tb.load(rootPath+tb.attr("data-url"));
    });
}
layer.config({
    extend: ['skin/style.css'], //加载新皮肤
    fix : false,// 用于设定层是否不随滚动条而滚动，固定在可视区域。
    skin: 'layer-ext-myskin' //一旦设定，所有弹层风格都采用此主题。
});

/**
 * options:
 * url : 获取select数据的路径
 * name : input name
 * textFiled :显示
 * valueFiled:value
 * data : 查询条件{}
 * value ：默认值
 */
function getSelectEx(byId,options){
	if(byId && options){
		if(options.url && options.textFiled 
				&& options.valueFiled && options.name){
			$.ajax({
				type : "post", //使用get方法访问后台
			    dataType : "json", //json格式的数据
			    async : true, //同步   不写的情况下 默认为true
			    url : rootPath + options.url,
			    data : options.data,
			    success : function(data){
			    	for(var i = 0; i < data.length;i++){
				    	var selectObj = $("#"+byId).find("ul"); 
				    	if(selectObj){
				    		if(options.value == "" && i == 0){
				    			$("#"+byId).append("<button data-toggle='dropdown' class='btn btn-sm btn-default dropdown-toggle'> "+
										"<span class='dropdown-label'>"+data[i][options.textFiled]+"</span> <span class='caret'></span></button>");
				    			$("#"+byId).find("ul").append("<li class='active'><a href='#'><input type='radio' name="+options.name+
							    		" value="+data[i][options.valueFiled]+" checked='checked'>"+data[i][options.textFiled]+"</a></li>");
						    }else{
						    	 if(options.value == data[i][options.valueFiled]){
						    		    $("#"+byId).append("<button data-toggle='dropdown' class='btn btn-sm btn-default dropdown-toggle'> "+
												"<span class='dropdown-label'>"+data[i][options.textFiled]+"</span> <span class='caret'></span></button>");
								    	$("#"+byId).find("ul").append("<li class='active'><a href='#'><input type='radio' name="+options.name+
									    		" value="+data[i][options.valueFiled]+" checked='checked'>"+data[i][options.textFiled]+"</a></li>");
								 }else{
									 $("#"+byId).find("ul").append("<li class=''><a href='#'><input type='radio' name="+options.name+
									    		" value="+data[i][options.valueFiled]+" >"+data[i][options.textFiled]+"</a></li>");
								 }
							}
					    }	
			    	}	
				}
			});
			
		}
	}
}
</script>
<!-- 返回顶部 -->
<script type="text/javascript" src="js/scrolltopcontrol.js"></script>
<script type="text/javascript">
	$(function() {
    //修改时间2015年10月13日14:32:57
    //修改在手机上点击菜单后菜单不关闭问题
    //修改人赵雷
    var winwidth = $("body").width();
    if(winwidth<770){
      $("#nav ul.lt li").click(function(){
        $("#nav").removeClass("nav-off-screen");
     });
    }
    //---------修改人赵雷完毕----------
		var tb = $("#loadhtml");
		tb.html(CommnUtil.loadingImg());
		tb.load(rootPath+"/welcome.jsp");
		$("[nav-n]").each(function () {
			$(this).bind("click",function(){
					var nav = $(this).attr("nav-n");
					var sn = nav.split(",");
					var html = '<li><i class="fa fa-home"></i>';
					html+='<a href="index.shtml">Home</a></li>';
					for(var i=0;i<2;i++){
						html+='<li><a href="javascript:void(0)">'+sn[i]+'</a></li>';
					}
					$("#topli").html(html);
					var tb = $("#loadhtml");
					tb.html(CommnUtil.loadingImg());
					tb.load(rootPath+sn[2]);
			});
		});
	});
		
</script>
</head>
<body class="" style="">
	<section class="vbox">
		<header class="bg-success dk header navbar navbar-fixed-top-xs">
			<div class="navbar-header aside-md" >
				<a class="btn btn-link visible-xs"
					data-toggle="class:nav-off-screen,open" data-target="#nav,html">
					<i class="fa fa-bars"></i>
				</a> <a href="index.shtml#" class="navbar-brand"
					data-toggle="fullscreen"><img
					src="notebook/notebook_files/logo.png" class="m-r-sm">试题资源学习平台</a>
				<a class="btn btn-link visible-xs" data-toggle="dropdown"
					data-target=".nav-user"> <i class="fa fa-cog"></i>
				</a>
			</div>
			<ul class="nav navbar-nav hidden-xs">
				<li class="dropdown"><a href="index.html#"
					class="dropdown-toggle dker" data-toggle="dropdown"> <i
						class="fa fa-building-o"></i> <span class="font-bold">Activity</span>
				</a>
					<section
						class="dropdown-menu aside-xl on animated fadeInLeft no-borders lt">
						<div class="wrapper lter m-t-n-xs">
							<a href="index.html#" class="thumb pull-left m-r"> <img
								src="notebook/notebook_files/avatar.jpg"
								class="img-circle">
							</a>
							<div class="clear">
								<a href="index.html#"><span class="text-white font-bold">@Mike
										Mcalidek</span></a> <small class="block">Art Director</small> <a
									href="index.html#" class="btn btn-xs btn-success m-t-xs">Upgrade</a>
							</div>
						</div>
						<div class="row m-l-none m-r-none m-b-n-xs text-center">
							<div class="col-xs-4">
								<div class="padder-v">
									<span class="m-b-xs h4 block text-white">245</span> <small
										class="text-muted">Followers</small>
								</div>
							</div>
							<div class="col-xs-4 dk">
								<div class="padder-v">
									<span class="m-b-xs h4 block text-white">55</span> <small
										class="text-muted">Likes</small>
								</div>
							</div>
							<div class="col-xs-4">
								<div class="padder-v">
									<span class="m-b-xs h4 block text-white">2,035</span> <small
										class="text-muted">Photos</small>
								</div>
							</div>
						</div>
					</section></li>
				<li>
					<div class="m-t m-l">
						<a href="price.html"
							class="dropdown-toggle btn btn-xs btn-primary" title="Upgrade"><i
							class="fa fa-long-arrow-up"></i></a>
					</div>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">
				<li class="hidden-xs"><a href="index.html#"
					class="dropdown-toggle dk" data-toggle="dropdown"> <i
						class="fa fa-bell"></i> <span
						class="badge badge-sm up bg-danger m-l-n-sm count"
						style="display: inline-block;">3</span>
				</a>
					<section class="dropdown-menu aside-xl">
						<section class="panel bg-white">
							<header class="panel-heading b-light bg-light">
								<strong>You have <span class="count"
									style="display: inline;">3</span> notifications
								</strong>
							</header>
							<div class="list-group list-group-alt animated fadeInRight">
								<a href="index.html#" class="media list-group-item"
									style="display: block;"><span
									class="pull-left thumb-sm text-center"><i
										class="fa fa-envelope-o fa-2x text-success"></i></span><span
									class="media-body block m-b-none">Sophi sent you a email<br>
										<small class="text-muted">1 minutes ago</small></span></a> <a
									href="index.html#" class="media list-group-item"> <span
									class="pull-left thumb-sm"> <img
										src="notebook/notebook_files/avatar.jpg"
										alt="John said" class="img-circle">
								</span> <span class="media-body block m-b-none"> Use awesome
										animate.css<br> <small class="text-muted">10
											minutes ago</small>
								</span>
								</a> <a href="index.html#" class="media list-group-item"> <span
									class="media-body block m-b-none"> 1.0 initial released<br>
										<small class="text-muted">1 hour ago</small>
								</span>
								</a>
							</div>
							<footer class="panel-footer text-sm">
								<a href="index.html#" class="pull-right"><i
									class="fa fa-cog"></i></a> <a href="index.html#notes"
									data-toggle="class:show animated fadeInRight">See all the
									notifications</a>
							</footer>
						</section>
					</section></li>
				<li class="dropdown hidden-xs"><a href="index.html#"
					class="dropdown-toggle dker" data-toggle="dropdown"><i
						class="fa fa-fw fa-search"></i></a>
					<section class="dropdown-menu aside-xl animated fadeInUp">
						<section class="panel bg-white">
							<form role="search">
								<div class="form-group wrapper m-b-none">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search">
										<span class="input-group-btn">
											<button type="submit" class="btn btn-info btn-icon">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</form>
						</section>
					</section></li>
				<li class="dropdown"><a href="index.html#"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="thumb-sm avatar pull-left"> <img
							src="notebook/notebook_files/avatar.jpg">
					</span> ${studentId} <b class="caret"></b>
				</a>
					<ul class="dropdown-menu animated fadeInRight">
						<span class="arrow top"></span>
						<li><a href="#" onclick="javascript:updatePasswordLayer();">密码修改</a></li>
						<li><a href="docs.html">Help</a></li>
						<li class="divider"></li>
						<li><a href="logout">注销</a></li>
					</ul></li>
			</ul>
		</header>
		<section>
			<section class="hbox stretch">
				<!-- .aside -->
				<aside class="bg-success aside-md hidden-print hidden-xs" id="nav">
					<section class="vbox">
						<!-- <header class="header bg-primary lter text-center clearfix">
							<div class="btn-group">
							系统菜单
							</div>
						</header> -->
						<section class="w-f scrollable">
							<div class="slim-scroll" data-height="auto"
								data-disable-fade-out="true" data-distance="0" data-size="5px"
								data-color="#4384af">
								<!-- nav -->
								<nav class="nav-primary hidden-xs">
									<ul class="nav">

										<!-- <li class="active"> 某一项展开-->
										<li class="active"><a href="javascript:void(0)"
											class="active"> <i class="fa fa-dashboard icon"> <b
													class="bg-danger"></b>
											</i> <span class="pull-right"> <i
													class="fa fa-angle-down text"></i> <i
													class="fa fa-angle-up text-active"></i>
											</span> <span>基础信息管理</span>
										</a>

											<ul class="nav lt">

												<li class="active"><a href="javascript:void(0)"
													class="active" nav-n="系统基础管理,我的信息,/student/info">
														<i class="fa fa-angle-right"></i> <span>我的信息</span>
												</a></li>

												<li class="active"><a href="javascript:void(0)"
													class="active" nav-n="系统基础管理,我的老师,/teacher/info">
														<i class="fa fa-angle-right"></i> <span>我的老师</span>
												</a></li>

												<li class="active"><a href="javascript:void(0)"
													class="active"
													nav-n="系统基础管理,我的任务,/student/work"> <i
														class="fa fa-angle-right"></i> <span>我的任务</span>
												</a></li>

											</ul></li>

										<!-- <li class="active"> 某一项展开-->
										<li><a href="javascript:void(0)"> <i
												class="fa fa-pencil-square icon"> <b class="bg-warning"></b>
											</i> <span class="pull-right"> <i
													class="fa fa-angle-down text"></i> <i
													class="fa fa-angle-up text-active"></i>
											</span> <span>试题中心管理</span>
										</a>

											<ul class="nav lt">

												<li class="active"><a href="javascript:void(0)"
													class="active"
													nav-n="试题中心管理,上传试题,/monitor/list.shtml?id=35"> <i
														class="fa fa-angle-right"></i> <span>上传试题</span>
												</a></li>

												<li class="active"><a href="javascript:void(0)"
													class="active"
													nav-n="试题中心管理,试题管理,/monitor/monitor.shtml?id=33"> <i
														class="fa fa-angle-right"></i> <span>试题管理</span>
												</a></li>

											</ul></li>

										<!-- <li class="active"> 某一项展开-->
										<li><a href="javascript:void(0)"> <i
												class="fa fa-columns icon"> <b class="bg-primary"></b>
											</i> <span class="pull-right"> <i
													class="fa fa-angle-down text"></i> <i
													class="fa fa-angle-up text-active"></i>
											</span> <span>在线学习管理</span>
										</a>

											<ul class="nav lt">

												<li class="active"><a href="javascript:void(0)"
													class="active"
													nav-n="在线学习管理,我要学习,/userlogin/listUI.shtml?id=26"> <i
														class="fa fa-angle-right"></i> <span>我要学习</span>
												</a></li>
												<li class="active"><a href="javascript:void(0)"
													class="active"
													nav-n="在线学习管理,学习资料,/monitor/monitor.shtml?id=33"> <i
														class="fa fa-angle-right"></i> <span>学习资料</span>
												</a></li>

											</ul></li>

										<!-- <li class="active"> 某一项展开-->
										<li><a href="javascript:void(0)"> <i
												class="fa fa-book icon"> <b class="bg-info"></b>
											</i> <span class="pull-right"> <i
													class="fa fa-angle-down text"></i> <i
													class="fa fa-angle-up text-active"></i>
											</span> <span>反馈留言管理</span>
										</a>

											<ul class="nav lt">

												<li class="active"><a href="javascript:void(0)"
													class="active" nav-n="反馈留言管理,我要留言,/log/list.shtml?id=28">
														<i class="fa fa-angle-right"></i> <span>我要留言</span>
												</a></li>

											</ul></li>

									</ul>
								</nav>
								<!-- / nav -->
							</div>
						</section>
						<footer class="footer lt hidden-xs b-t b-dark">
							<div id="chat" class="dropup">
								<section class="dropdown-menu on aside-md m-l-n">
									<section class="panel bg-white">
										<header class="panel-heading b-b b-light">Active
											chats</header>
										<div class="panel-body animated fadeInRight">
											<p class="text-sm">No active chats.</p>
											<p>
												<a href="#" class="btn btn-sm btn-default">Start a chat</a>
											</p>
										</div>
									</section>
								</section>
							</div>
							<div id="invite" class="dropup">
								<section class="dropdown-menu on aside-md m-l-n">
									<section class="panel bg-white">
										<header class="panel-heading b-b b-light">
											John <i class="fa fa-circle text-success"></i>
										</header>
										<div class="panel-body animated fadeInRight">
											<p class="text-sm">No contacts in your lists.</p>
											<p>
												<a href="#" class="btn btn-sm btn-facebook"><i
													class="fa fa-fw fa-facebook"></i> Invite from Facebook</a>
											</p>
										</div>
									</section>
								</section>
							</div>
							<a href="#nav" data-toggle="class:nav-xs"
								class="pull-right btn btn-sm btn-dark btn-icon"> <i
								class="fa fa-angle-left text"></i> <i
								class="fa fa-angle-right text-active"></i>
							</a>
							<div class="btn-group hidden-nav-xs">
								<button type="button" title="Chats"
									class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
									data-target="#chat">
									<i class="fa fa-comment-o"></i>
								</button>
								<button type="button" title="Contacts"
									class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
									data-target="#invite">
									<i class="fa fa-facebook"></i>
								</button>
							</div>
						</footer>
					</section>
				</aside>
				<!-- /.aside -->
				<section id="content">
					<section id="id_vbox" class="vbox">
						<ul class="breadcrumb no-border no-radius b-b b-light" id="topli">
						</ul>
						<section class="scrollable" style="margin-top: 35px;">
						<div id="loadhtml"></div>
						</section>
					</section>
				</section>
				<aside class="bg-light lter b-l aside-md hide" id="notes">
					<div class="wrapper">Notification</div>
				</aside>
			</section>
		</section>
	</section>
	<!-- Bootstrap -->
	<div id="flotTip" style="display: none; position: absolute;"></div>


</body>
</html>