<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet"
	href="${ctx}/jsp/${JspRoot}/themes/default/style.min.css" />
<script type="text/javascript"
	src="${ctx}/jsp/${JspRoot}/js/jquery.min.js"></script>
<script src="${ctx}/jsp/${JspRoot}/js/jstree.min.js"></script>
<style>
h1 {
	font-size: 1.8em;
}

.demo {
	overflow: auto;
	border: 1px solid silver;
	min-height: 100px;
}
</style>
</head>
<body>
	<div id="html" class="demo">
		<ul>
			<li data-jstree='{ "opened" : true }'>${RootNode}
				<ul>
					<c:forEach items="${treeList}" var="user" varStatus="s">
						<!-- <li data-jstree='{ "selected" : true }'>Child node 1</li> -->
						<li id="${user.hdOperatorId}"
							<c:if test="${s.index==0}">data-jstree='{ "selected" : true }'</c:if>>${user.hdOperatorName}</li>
					</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
	<script>
		$('#html').on("changed.jstree", function(e, data) {
			if (data.selected.length) {
				var id = data.instance.get_node(data.selected[0]).id;
				/* $.ajax({
				     type: "POST",
				     dataType: "text",
				     url: "${ctx}/operator!queryById.action",
				     data: "id="+id,
				     success: function (result) {
				         alert(result);
				     },
				     error: function(data) {
				         alert("error:"+data.responseText);
				      }
				 }); */

			}
		}).jstree(
				{
					"plugins" : [ "contextmenu", "dnd", "search", "state",
							"types", "wholerow" ]
				});
	</script>
</body>
</html>