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
		$(".btn_checked").hide();
		$(".btn_nochecked").hide();
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
							for(i in lihtml ){
								//alert(i+"==="+lihtml[i]);
								//alert(i);
								if(i=='operatorStatus'){
									$("select[name="+i+"]").val(lihtml[i]);
								}else{
									$("input[name="+i+"]").val(lihtml[i]);
								}
							}
						}
					}).jstree(
					{
						"core" : {
							"data" : {
								"url" : "${ctx}/operator!ajax.action",
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
		$('.btn_checked').click(function() {
			//$("#submitForm").submit();
			
			$.ajax({
				type : "POST",
				dataType : "html",
				url : "${ctx}/operator!save.action",
				data : $('#submitForm').serialize(),
				success : function(result) {
					//$('#html').data('jstree', false).empty().jstree({});
					var tree = jQuery.jstree.reference("#html");
					tree.refresh();
					$(".btn_nochecked").click();
				},
				error : function(data) {
					alert("error:" + data.responseText);
				}
			});
		});
		
		
	    $(".btn_add").click(function() {
	    	$(".btn_del").hide();
	    	$(".btn_config").hide();
	    	$(".btn_search").hide();
	    	$(".btn_recycle").hide();
	    	$(".btn_count").hide();
	    	$(".btn_checked").show();
			$(".btn_nochecked").show();
			$("#submitForm input").each(function(){
				$(this).attr("disabled",false);
				$(this).attr("value","");
			});
			$("#submitForm select").each(function(){
				$(this).attr("disabled",false);
				$(this).attr("value","0");
			});
			$("#bg").css({
				display : "block",
				height : $(".box_border").height() - $(".box_bottom").height(),
				width : $(".box_center").width()
			});
		});
	    $(".btn_config").click(function() {
	    	$(".btn_add").hide();
	    	$(".btn_del").hide();
	    	$(".btn_search").hide();
	    	$(".btn_count").hide();
	    	$(".btn_search").hide();
	    	$(".btn_checked").show();
			$(".btn_nochecked").show();
			$(".btn_recycle").hide();
			$("#bg").css({
				display : "block",
				height : $(".box_border").height() - $(".box_bottom").height(),
				width : $(".box_center").width()
			});
		});
	    
	    $(".btn_nochecked").click(function() {
	    	$(".btn_add").show();
	    	$(".btn_del").show();
	    	$(".btn_config").show();
	    	$(".btn_search").show();
	    	$(".btn_count").show();
	    	$(".btn_checked").hide();
			$(".btn_nochecked").hide();
			$(".btn_recycle").show();
			$(".btn_export").show();
			$("#bg").css("display", "none");
			$("#submitForm input").each(function(){
				$(this).attr("disabled",true);
			});
		});
	});
</script>
   <style type="text/css">
     .box_m{position:absolute;width:600px;left:50%;height:auto;z-index:100;background-color:#fff;border:1px #ddd solid;padding:1px;}
.box_m h2{height:25px;font-size:14px;background-color:#aaa;position:relative;padding-left:10px;line-height:25px;color:#fff;}
.box_m h2 a{position:absolute;right:5px;font-size:12px;color:#fff;}
.box_m .list{padding:10px;}
.box_m .list li{height:24px;line-height:24px;}
.box_m .list li span{margin:0 5px 0 0;font-family:"宋体";font-size:12px;font-weight:400;color:#ddd;}
.showbtn {font:bold 24px '微软雅黑';}
#bg{background-color:#666;position:absolute;z-index:99;left:0;top:0;display:none;width:100%;height:100%;opacity:0.5;filter: alpha(opacity=50);-moz-opacity: 0.5;}
   .styled-select {
   width:560px; height:24px; background:none; border:none;
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
								<div class="box_top_l fl">

								</div>
								<div class="box_top_r fr pr15"></div>
							</div>
							<div class="box_center">
								  <div id="bg" class="pl10"></div>
								  <div id="html" style="overflow: scroll; min-height: 450px; max-height: 450px" ></div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="main_right fr span7">
				<div id="search_bar" >
					<div class="box" >
						<div class="box_border">
							<div class="box_top">
							    <div id="button">
							       <input type="button" name="button" class="btn btn82 btn_add" value="新增"> 
							       <input type="button" name="button" class="btn btn82 btn_del" value="删除"> 
							       <input type="button" name="button" class="btn btn82 btn_config" value="修改">
							       <input type="button" name="button" class="btn btn82 btn_search" value="查询">   							      
							       <input type="button" name="button" class="btn btn82 btn_count" value="查找"> 
							       <input type="button" name="button" class="btn btn82 btn_checked" value="保存"> 
							       <input type="button" name="button" class="btn btn82 btn_nochecked" value="取消"> 
							       <input type="button" name="button" class="btn btn82 btn_recycle" value="过滤">
							       <input type="button" name="button" class="btn btn82 btn_export" value="导出">
							    </div>
							</div>
								<ul class="htabs">
									<li><h2><a href="#design" id="designt">基础信息</a></h2></li>
									<li><h2><a href="#development" id="developmentt">扩展至货主</a></h2></li>
									<li><h2><a href="#freebies" id="freebiest">系统信息</a></h2></li>
								</ul>
							  <form action="" class="jqtransform" id="submitForm">
								<div class="tabs" style="min-height: 460px; max-height: 460px">
									<div class="box_center pt10 pb10 tab" id="design">
										<table class="form_table" border="0" cellpadding="0"
										cellspacing="0">
										<tr>
											<td>代码</td>
											<td><input type="text" name="operatorId"
												class="input-text lh25" size="80" disabled="disabled"></td>
										</tr>
										<tr>
											<td>名称</td>
											<td><input type="text" name="operatorName"
												class="input-text lh25" size="80" disabled="disabled"></td>
										</tr>
										<tr>
											<td>名称(外文)</td>
											<td><input type="text" name="operatorCode"
												class="input-text lh25" size="80" disabled="disabled">
										    </td>
										</tr>
										<tr>
											<td>状态</td>
											<td>
												<select name="operatorStatus" class="styled-select" disabled="disabled" > 
										              <option value="0">正常</option> 
										               <option value="1">锁定</option> 
									            </select> 
								                
											</td>
										</tr>
										<tr>
											<td>密码</td>
											<td><input type="text" name="operatorPwd"
												class="input-text lh25" size="80" disabled="disabled"></td>
										</tr>									 
									</table>
									</div>
									<div class="box_center pt10 pb10 tab" id="development">
										<table class="form_table" border="0" cellpadding="0" cellspacing="0">
										    <tr>
												<td>创建人员</td>
												<td><input type="text" name="createOpId"
													class="input-text lh25" size="80" disabled="disabled"></td>
											</tr>
											<tr>
												<td>创建人员</td>
												<td><input type="text" name="createTime"
													class="input-text lh25" size="80" disabled="disabled"></td>
											</tr>
											<tr>
												<td>修改人员</td>
												<td><input type="text" name="updateOpId"
													class="input-text lh25" size="80" disabled="disabled"></td>
											</tr>
											<tr>
												<td>修改人员</td>
												<td><input type="text" name="updateTime"
													class="input-text lh25" size="80" disabled="disabled"></td>
											</tr>
											<tr>
												<td>备注</td>
												<td><input type="text" name="notes"
													class="input-text lh25" size="80" disabled="disabled"></td>
											</tr>
											<tr>
												<td>备注(外文)</td>
												<td><input type="text" name="foreignNotes"
													class="input-text lh25" size="80" disabled="disabled"></td>
											</tr>
									    </table>
									</div>
									<div class="box_center pt10 pb10 tab bmod" id="freebies">
										<table class="form_table" border="0" cellpadding="0" cellspacing="0">
										   <tr>
											<td>名称(外文)</td>
											<td><input type="text" name="opGroupId"
												class="input-text lh25" size="80" disabled="disabled"></td>
										</tr>
										<tr>
											<td>名称(外文)</td>
											<td><input type="text" name="cargoOwnerId"
												class="input-text lh25" size="80" disabled="disabled"></td>
										</tr>
										 
									   </table>
									</div>
								</div>
							 </form>	
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>