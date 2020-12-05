<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<!--图标样式-->
<link rel="stylesheet" type="text/css" href="${ctx}/css/base/bootstrap.min.css" />

<!--主要样式-->
<link rel="stylesheet" type="text/css" href="${ctx}/jsp/${JspRoot}/css/tree/BoostrapTree.css" />

<script src="${ctx}/jsp/${JspRoot}/scripts/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
    //$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
    /* $('.tree li.parent_li > span').on('click', function (e) {
        var children = $(this).parent('li.parent_li').find(' > ul > li');
        if (children.is(":visible")) {
            children.hide('fast');
            $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
        } else {
            children.show('fast');
            $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
        }
        e.stopPropagation();
    }); */
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
<div class="tree">
    <ul>
        <li>
            <span>所有员工</span>
            <ul>
                <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工1</span>
                 
                </li>
                <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                 
                </li>
                <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                 
                </li>
                <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
                 <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i>员工2</span>
                </li>
            </ul>
        </li>
    </ul>
</div>

</body>
</html>