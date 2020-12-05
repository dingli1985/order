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
   <!--jQuery dependencies-->
    <link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/jquery-ui.css" />
    <script src="${ctx}/jsp/${JspRoot}/js/jquery-ui-1.9.2.custom.min.js"></script>
<!--PQ Grid files-->
    <link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/pqgrid.min.css" />
    <script src="${ctx}/jsp/${JspRoot}/js/pqgrid.min.js"></script>
<!--PQ Grid Office theme-->
    <link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/pqgrid.css" />
   
   <script type="text/javascript">
     
      $(function(){  
        $('#html').on("changed.jstree", function (e, data) {
			if(data.selected.length) {
				$("input[name=hdRoleId]").val(data.instance.get_node(data.selected[0]).id);
				$("input[name=hdRoleName]").val(data.instance.get_node(data.selected[0]).text);
				
			}
		}).jstree();
        $('.btn_save2').click(function(){
        	$("#submitForm").submit();
        });
      }); 
      
      $(function () {
          var data = [[1, 'Exxon Mobil', '339,938.0', '36,130.0'],
              [2, 'Wal-Mart Stores', '315,654.0', '11,231.0'],
  			[3, 'Royal Dutch Shell', '306,731.0', '25,311.0'],
  			[4, 'BP', '267,600.0', '22,341.0'],
  			[5, 'General Motors', '192,604.0', '-10,567.0'],
  			[6, 'Chevron', '189,481.0', '14,099.0'],
  			[7, 'DaimlerChrysler', '186,106.3', '3,536.3'],
  			[8, 'Toyota Motor', '185,805.0', '12,119.6'],
  			[9, 'Ford Motor', '177,210.0', '2,024.0'],
  			[10, 'ConocoPhillips', '166,683.0', '13,529.0'],
  			[11, 'General Electric', '157,153.0', '16,353.0'],
  			[12, 'Total', '152,360.7', '15,250.0'],
  			[13, 'ING Group', '138,235.3', '8,958.9'],
  			[14, 'Citigroup', '131,045.0', '24,589.0'],
  			[15, 'AXA', '129,839.2', '5,186.5'],
  			[16, 'Allianz', '121,406.0', '5,442.4'],
  			[17, 'Volkswagen', '118,376.6', '1,391.7'],
  			[18, 'Fortis', '112,351.4', '4,896.3'],
  			[19, 'Crédit Agricole', '110,764.6', '7,434.3'],
  			[20, 'American Intl. Group', '108,905.0', '10,477.0']];


          var obj = { width: 800, height: 400, title: "ParamQuery Grid Example",resizable:true,draggable:true };
          obj.colModel = [{ title: "Rank", width: 100, dataType: "integer" },
          { title: "Company", width: 200, dataType: "string" },
          { title: "Revenues ($ millions)", width: 150, dataType: "float", align: "right" },
          { title: "Profits ($ millions)", width: 150, dataType: "float", align: "right"}];
          obj.dataModel = { data: data };
          $("#grid_array").pqGrid(obj);

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
                    <div class="box_top_l fl"><b class="pl15">角色信息</b></div>
                    <div class="box_top_r fr pr15">
                          
                    </div>
                  </div>
                  <div class="box_center">
                     <div id="html" class="demo">
						<ul>
							<li data-jstree='{ "opened" : true }'>${RootNode}
								<ul>
								    <c:forEach items="${roleList}" var="role" varStatus="s">
								        <!-- <li data-jstree='{ "selected" : true }'>Child node 1</li> -->
								        <li id="${role.hdRoleId}"
									        <c:if test="${s.index==0}">
									          data-jstree='{ "selected" : true }'
									        </c:if>
								        >${role.hdRoleName}</li>
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
                      <li value=""></li>
                  </div>
                  <div class="box_center">
                  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_center">
              <form action="${ctx}/role!save.action" class="jqtransform" id="submitForm" method="post">
               <table class="form_table pt15 pb15" id="details_show" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">角色ID：</td>
                  <td > 
                    <input type="text" name="hdRoleId"  class="input-text lh30" size="40">
                  </td>
                </tr>
                <tr >
                 <td class="td_right">角色名称：</td>
                 <td>
                   <input type="text" name="hdRoleName" class="input-text lh30" size="40">
                 </td>
                 </tr>
                  <tr >
                 <td class="td_right">角色描述：</td>
                 <td>
                   <input type="text" name="hdRoleDesc" class="input-text lh30" size="40">
                 </td>
                 </tr>
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
              <div id="grid_array"></div>
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