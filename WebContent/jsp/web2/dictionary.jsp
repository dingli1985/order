<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/common.css">
<link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/main.css">
<link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/tab.css">

<script type="text/javascript"
	src="${ctx}/jsp/${JspRoot}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/jsp/${JspRoot}/js/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="${ctx}/jsp/${JspRoot}/js/common.js"></script>
<script type="text/javascript"
	src="${ctx}/jsp/${JspRoot}/js/sweetalert.min.js"></script>
<script src="${ctx}/jsp/${JspRoot}/js/jstree.min.js"></script>
<script src="${ctx}/jsp/${JspRoot}/js/tab.js"></script>
<script type="text/javascript">
	$(function() {
		var posStr = "字典设置－>"
		$('#html')
				.on(
						"changed.jstree",
						function(e, data) {
							if (data.selected.length) {
								var code = data.instance
										.get_node(data.selected[0]).id;
								var text = data.instance
										.get_node(data.selected[0]).text;
								var lihtml = data.instance
										.get_node(data.selected[0]).li_attr
								$("#posDesc").text(posStr + text);
								for (i in lihtml) {
									//alert(i+"==="+lihtml[i]);
									//alert(i);
									$("input[name=" + i + "]").val(lihtml[i]);
								}
							}
						})
				.jstree(
						{
							"core" : {
								"data" : {
									"url" : "${ctx}/dictionary!ajax.action",
									"dataType" : "json",
									"cache" : false
								}
							},
							"plugins" : [ "contextmenu", "dnd", "search",
									"state", "types" ],
							"contextmenu" : {
								"items" : {
									"create" : null,
									"rename" : null,
									"remove" : null,
									"ccp" : null,
									"新建菜单" : {
										"label" : "新建菜单",
										"action" : function(data) {
											var inst = jQuery.jstree
													.reference(data.reference), obj = inst
													.get_node(data.reference);
										}
									},
									"删除菜单" : {
										"label" : "删除菜单",
										"action" : function(data) {
											var inst = jQuery.jstree
													.reference(data.reference), obj = inst
													.get_node(data.reference);
										}
									},
									"编辑菜单" : {
										"label" : "编辑菜单",
										"action" : function(data) {
											var inst = jQuery.jstree
													.reference(data.reference), obj = inst
													.get_node(data.reference);
										}
									}
								}
							}
						});
		$('.btn_search').click(function() {
			$('#html').jstree(true).search("liuhui");
		});
		$('.btn_save2').click(function() {
			//$("#submitForm").submit();
			//$('#html').data('jstree', false).empty().jstree({});
			alert($('#html').jstree().get_checked());
			return;
			$.ajax({
				type : "POST",
				dataType : "html",
				url : "${ctx}/dictionary!save.action",
				data : $('#submitForm').serialize(),
				success : function(result) {
					alert(result);
					var tree = jQuery.jstree._reference("#html");
					tree.refresh();
				},
				error : function(data) {
					alert("error:" + data.responseText);
				}
			});
		});
		$("#showbtn").click(function() {
			$("#bg").css({
				display : "block",
				height : $(".box_border").height() - $(".box_bottom").height(),
				width : $(".box_center").width()
			});
		});
		//点击关闭按钮的时候，遮罩层关闭
		$(".close").click(function() {
			$("#bg").css("display", "none");
		});
	});
</script>
<style type="text/css">
.box_m {
	position: absolute;
	width: 600px;
	left: 50%;
	height: auto;
	z-index: 100;
	background-color: #fff;
	border: 1px #ddd solid;
	padding: 1px;
}

.box_m h2 {
	height: 25px;
	font-size: 14px;
	background-color: #aaa;
	position: relative;
	padding-left: 10px;
	line-height: 25px;
	color: #fff;
}

.box_m h2 a {
	position: absolute;
	right: 5px;
	font-size: 12px;
	color: #fff;
}

.box_m .list {
	padding: 10px;
}

.box_m .list li {
	height: 24px;
	line-height: 24px;
}

.box_m .list li span {
	margin: 0 5px 0 0;
	font-family: "宋体";
	font-size: 12px;
	font-weight: 400;
	color: #ddd;
}

.showbtn {
	font: bold 24px '微软雅黑';
}

#bg {
	background-color: #666;
	position: absolute;
	z-index: 99;
	left: 0;
	top: 0;
	display: none;
	width: 100%;
	height: 100%;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
}
</style>
<title>Document</title>
<link rel="stylesheet"
	href="${ctx}/jsp/${JspRoot}/themes/default/style.min.css" />
</head>
<body>
	<div class="container">
		<div class="main_top">
			<div class="main_left fl span3">
				<div class="box pr5">
					<div class="box pr5">
						<div class="box_border">
							<div class="box_top">
								<div class="box_top_l fl"></div>
								<div class="box_top_r fr pr15"></div>
							</div>
							<div class="box_center">
								<div id="bg" class="pl10"></div>
								<div id="html"
									style="overflow: scroll; min-height: 480px; max-height: 480px"></div>

							</div>
							<div class="box_bottom pb5 pt5 pr10"
								style="border-top: 1px solid #dadada;">
								<div class="search_bar_btn" style="text-align: right;">
									<input type="submit" value="确定" class="ext_btn ext_btn_submit">
									<input type="button" value="返回"
										onclick="location.href='javascript:history.go(-1)'"
										class="ext_btn"> <input type="button"
										class="ext_btn ext_btn_success" value="成功"> <input
										type="button" class="ext_btn ext_btn_error" value="错误">
									<a href="#" class="ext_btn" id="showbtn"><span class="add"></span>添加</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="main_right fr span7">
				<div id="search_bar">
					<div class="box">
						<div class="box_border">
							<div class="box_top">
								<b class="pl15">搜索</b>
							</div>
							<ul class="htabs">
								<li><h2>
										<a href="#design" id="designt">基础信息</a>
									</h2></li>
								<li><h2>
										<a href="#development" id="developmentt">扩展至货主</a>
									</h2></li>
								<li><h2>
										<a href="#freebies" id="freebiest">系统信息</a>
									</h2></li>
							</ul>
							<div class="tabs" style="min-height: 490px; max-height: 490px">
								<div class="box_center pt10 pb10 tab" id="design">
									<table class="form_table" border="0" cellpadding="0"
										cellspacing="0">
										<tr>
											<td>代码</td>
											<td><input type="text" name="cargoId"
												class="input-text lh25" size="80" disabled="disabled"></td>
										</tr>
										<tr>
											<td>名称</td>
											<td><input type="text" name="cargoName"
												class="input-text lh25" size="80" disabled="disabled"></td>
										</tr>
										<tr>
											<td>名称(外文)</td>
											<td><input type="text" name="cargoForeignName"
												class="input-text lh25" size="80" disabled="disabled"></td>
										</tr>
									</table>
								</div>
								<div class="box_center pt10 pb10 tab" id="development">
									<table class="form_table" border="0" cellpadding="0"
										cellspacing="0">
									</table>
								</div>
								<div class="box_center pt10 pb10 tab bmod" id="freebies">
									<table class="form_table" border="0" cellpadding="0"
										cellspacing="0">
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>