<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/common.css">
   <link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/main.css">
   <link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/sweetalert.css">
   <script type="text/javascript" src="${ctx}/jsp/${JspRoot}/js/jquery.min.js"></script>
   <script type="text/javascript" src="${ctx}/jsp/${JspRoot}/js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="${ctx}/jsp/${JspRoot}/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/jsp/${JspRoot}/js/sweetalert.min.js"></script>
   <script src="${ctx}/jsp/${JspRoot}/js/jstree.min.js"></script>
   
   <script type="text/javascript">
     
      $(function(){  
        $('#html').on("changed.jstree", function (e, data) {
			if(data.selected.length) {
				var id=data.instance.get_node(data.selected[0]).id;
				//$("input[name=hdOperatorId]").val(data.instance.get_node(data.selected[0]).id);
				//$("input[name=hdOperatorName]").val(data.instance.get_node(data.selected[0]).text);
				return ;
				$.ajax({
	                 type: "POST",
	                 dataType: "text",
	                 url: "${ctx}/unit!queryById.action",
	                 data: "id="+id,
	                 success: function (result) {
	                     alert(result);
	                 },
	                 error: function(data) {
	                     alert("error:"+data.responseText);
	                  }
	             });
			}
		}).jstree();
        $('.btn_save2').click(function(){
        	//$("#submitForm").submit();
        	 $.ajax({
                 type: "POST",
                 dataType: "html",
                 url: "${ctx}/unit!save.action",
                 data: $('#submitForm').serialize(),
                 success: function (result) {
                     alert(result);
                     //加载最大可退金额
                 },
                 error: function(data) {
                     alert("error:"+data.responseText);
                  }
             });
        });
      }); 
   </script>
   <title>Document</title>
	<link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/themes/default/style.min.css" />
 </head>
 <body>
  <div class="container">
     <div class="main_top">
          <div class="main_left fl span2">
              <div class="box pr5">
                <div class="box_border">
                  <div class="box_top">
                    <div class="box_top_l fl"><b class="pl15">用户信息</b></div>
                    <div class="box_top_r fr pr15">
	                        <select name="" class="select"> 
	                        <option>男</option> 
	                        <option>女</option> 
                           </select> 
                    </div>
                  </div>
                  <div class="box_center">
                     <div id="html" class="demo">
						<ul>
							<li data-jstree='{ "opened" : true }'>${RootNode}
								<ul>
								    <c:forEach items="${unitList}" var="user" varStatus="s">
								        <!-- <li data-jstree='{ "selected" : true }'>Child node 1</li> -->
								        <li id="${user.hdUnitCode}"
									        <c:if test="${s.index==0}">
									          data-jstree='{ "selected" : true }'
									        </c:if>
								        >${user.hdUnitName}</li>
								    </c:forEach>
								</ul>
							</li>
						</ul>
					</div>     
                  </div>
                </div>
              </div>
          </div>
          <div class="main_right fr span8">
             <div class="box pl5">
                <div class="box_border">
                  <div class="box_top">
                  </div>
                  <div class="box_center">
		<div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_center">
              <form action="${ctx}/unit!save.action" class="jqtransform" id="submitForm" method="post">
                 <input type="hidden" name="operFlag" value="">
                 <input type="hidden" name="hdOperatorId" value="">
               <table class="form_table pt15 pb15" id="details_show" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">单位代码：</td>
                  <td > 
                    <input type="text" name="hdUnitCode"  class="input-text lh30" size="40">
                  </td>
                </tr>
                <tr >
                 <td class="td_right">单位名称：</td>
                 <td>
                   <input type="text" name="hdUnitName" class="input-text lh30" size="40">
                 </td>
                 </tr>
                 <tr >
                 <td class="td_right">单位描述：</td>
                 <td>
                   <input type="text" name="hdNotes" class="input-text lh30" size="40">
                 </td>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" name="button" class="btn btn82 btn_save2" value="保存"> 
                    <input type="button" name="button" class="btn btn82 btn_res" value="重置"> 
                   </td>
                 </tr>
               </table>
               </form>
            </div>
          </div>
        </div>
     </div>
		     <div id="table" class="mt10">
		        <div class="box span10 oh">
		              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
		                <tr>
		                   <th width="30">#</th>
		                   <th width="100">标题</th>
		                   <th width="100">标题</th>
		                   <th>标题</th>
		                    </tr>
		                <tr class="tr">
		                   <td class="td_center"><input type="checkbox"></td>
		                   <td>aad</td>
		                   <td>aad</td>
		                   <td>aad</td>
		                 </tr>
		                 <tr class="tr">
		                    <td class="td_center"><input type="checkbox"></td>
		                   <td>aad</td>
		                   <td>aad</td>
		                   <td>aad</td>
		                 </tr>
		              </table>
		              <div class="page mt10">
		                <div class="pagination">
		                  <ul>
		                      <li class="first-child"><a href="#">首页</a></li>
		                      <li class="disabled"><span>上一页</span></li>
		                      <li class="active"><span>1</span></li>
		                      <li><a href="#">2</a></li>
		                      <li><a href="#">下一页</a></li>
		                      <li class="last-child"><a href="#">末页</a></li>
		                  </ul>
		                </div>
		              </div>
		        </div>
		     </div>

              </div>
                  </div>
                </div>
              </div>
        
          </div>

          <div class="clear"></div>
     </div>
   </div> 
 </body>
 </html>