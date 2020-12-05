<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script src="${ctx}/jsp/${JspRoot}/scripts/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${ctx}/jsp/${JspRoot}/scripts/SimpleTree.js" type="text/javascript"></script>
<link href="${ctx}/jsp/${JspRoot}/css/tree/SimpleTree.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function(){
	$(".st_tree").SimpleTree({
		/* 可无视代码部分*/
		click:function(a){
			if(!$(a).attr("hasChild"))
				alert($(a).attr("ref"));
		}	
	});
});
</script>
<style type="text/css">
BODY {
 SCROLLBAR-FACE-COLOR: #e8e7e7; 
 SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; 
 SCROLLBAR-SHADOW-COLOR: #ffffff; 
 SCROLLBAR-3DLIGHT-COLOR: #cccccc; 
 SCROLLBAR-ARROW-COLOR: #03B7EC; 
 SCROLLBAR-TRACK-COLOR: #EFEFEF; 
 SCROLLBAR-DARKSHADOW-COLOR: #b2b2b2; 
 SCROLLBAR-BASE-COLOR: #000000;
}
</style>

</head>
<body style="height: 484px;">

<div class="st_tree">
	<ul>
		<li><a href="#" ref="hyjm">欢迎界面</a></li>
		<li><a href="#" ref="xtgl">系统管理</a></li>
		<ul show="true">
			<li><a href="#" ref="yhgl">用户管理</a></li>
			<li><a href="#" ref="rzck">日志查看日志查看日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看日志查看日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
			<li><a href="#" ref="rzck">日志查看</a></li>
		</ul>
	</ul>
</div>

</body>
</html>
