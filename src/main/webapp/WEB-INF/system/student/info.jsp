<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- [EasyUI] -->
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctx }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctx }/static/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx }/static/easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx }/static/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/system/student/list.js"></script> --%>

	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">账号:</span></label> <input
					class="input-medium ui-autocomplete-input" id="accountName"
					name="userFormMap.accountName">
			</div>
			<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
			<a href="javascript:grid.exportData('/user/export.shtml')" class="btn btn-info" id="search">导出excel</a>
		</form>
	</div>
	<header class="panel-heading">

	<div class="doc-buttons">
		<script>
	var dataGrid;
	dataGrid=$('#treeGrid').datagrid({
    url:rootPath+'/student/datagrid',
    toolbar: [{
		iconCls: 'icon-edit',
		handler: function(){alert('edit')}
	},'-',{
		iconCls: 'icon-help',
		handler: function(){alert('help')}
	},'-',{
		iconCls: 'icon-add',
		handler: function(){addAccount();}
	}],
    columns:[[
		{field:'name',title:'学号',width:150},
		{field:'password',title:'姓名',width:150},
		{field:'name',title:'手机',width:150},
		{field:'password',title:'班级',width:150},
		{field:'age',title:'专业',width:100},
		{field:'loginname',title:'学院',width:150},
		{field:'loginname',title:'学院',width:150},
		{field:'status',title:'状态',width:50, sortable:true,formatter : function(value, row, index) {
       	 switch (value) {
         case 0:
             return '正常';
         case 1:
             return '停用';
         }}},
		{
            field : 'sex',
            title : '操作',
            width : 210,
	    align:'center',
            formatter : function(value, row, index) {
		String.prototype.format=function() 
{ 
  if(arguments.length==0) return this; 
  for(var s=this, i=0; i<arguments.length; i++) 
    s=s.replace(new RegExp("\\{"+i+"\\}","g"), arguments[i]); 
  return s; 
}; 
		//alert("http://{0}/{1}".format("www.songyanjun.net", "index.html")); 
            	     var str = '';
	 str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
	 str += '<a href="javascript:void(0)" id="permissions" class="role-easyui-linkbutton-ok" data-options="plain:true,iconCls:\'icon-ok\'"onclick="permissions({0});">授权</a>'.format(row.id);
 str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
	 str += '<a href="javascript:void(0)" id="" class="role-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-ok\'" onclick="editAccount({0});">编辑</a>'.format(row.id);
 str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
	 str += '<a href="javascript:void(0)" class="role-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-ok\'"onclick="delAccount({0});">删除</a>'.format(row.id);
                return str; 
            }
		}
    ]],
	onLoadSuccess:function(data){
        $('.role-easyui-linkbutton-ok').linkbutton({text:'授权',plain:true,iconCls:'icon-ok'});
        $('.role-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
        $('.role-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
    },
});

function editAccount(id) {
if (id == undefined) {
            var rows = dataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
	
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/student/edit/id='+id
	});
}
function addAccount() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/student/addPage'
	});
}
function delAccount(id) {
	if (id == undefined) {
            var rows = dataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/user/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
function permissions(id) {
	if (id == undefined) {
            var rows = dataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
	var url = rootPath + '/resources/permissions.shtml?userId='+id;
	pageii = layer.open({
		title : "分配权限功能尚未开通",
		type : 2,
		area : [ "700px", "80%" ],
		content : url
	});
}
</script>
		<table id="treeGrid" class="pp-list table table-striped table-bordered" >
		
		

		
		</table>

	</div>
	 <div id="toolbar" style="display: none;">
	 </div>
	</header>
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>
	
	<div class="table-responsive">
		<div id="paging2" class="pagclass"></div>
	</div>
	