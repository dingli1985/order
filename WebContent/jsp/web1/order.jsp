<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<%@ include file="/jsp/common/base_scripts.jsp"%>
<link href="${ctx}/jsp/${JspRoot}/css/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript">
function iFrameHeight() {

	var ifm = document.getElementById("iframepage");

	var subWeb = document.frames ? document.frames["iframepage"].document :

		ifm.contentDocument;

	if (ifm != null && subWeb != null) {

		ifm.height = subWeb.body.scrollHeight;

	}

}
</script>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
   <tr>
       <td width="17" valign="top" background="${ctx}/jsp/${JspRoot}/images/mail_leftbg.gif">
         <img src="${ctx}/jsp/${JspRoot}/images/left-top-right.gif" width="17" height="29" />
       </td>
       <td valign="top" background="${ctx}/jsp/${JspRoot}/images/content-bg.gif">
	    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
	      <tr>
	        <td height="31"><div class="titlebt">用户列表</div></td>
	      </tr>
	    </table>
    </td>
    <td width="16" valign="top" background="${ctx}/jsp/${JspRoot}/images/mail_rightbg.gif">
      <img src="${ctx}/jsp/${JspRoot}/images/nav-right-bg.gif" width="16" height="29" />
    </td>
  </tr>
  <tr>
    <td valign="middle" background="${ctx}/jsp/${JspRoot}/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">

      <tr>
        <td width="10%" valign="top">
        <!-- 树形菜单开始 -->
            <%--  <%@ include file="/jsp/tree/SimpleTree.jsp"%> --%>
             <table width="100%" height="524" border="0" cellpadding="0" cellspacing="0" class="line_table">
	          <tr>
	            <td width="7%" height="27" background="${ctx}/jsp/${JspRoot}/images/news-title-bg.gif">
	             
	            </td>
	            <td width="93%" background="${ctx}/jsp/${JspRoot}/images/news-title-bg.gif" class="left_bt2">用户信息</td>
	          </tr>
	          <tr>
	            <td colspan="2">	
	            	<iframe border="1" id="iframepage" src="${ctx}/jsp/${JspRoot}/tree/BootstrapTree.jsp" height="100%"  min-height:484px; frameborder="0" onLoad="iFrameHeight()" ></iframe>
                 </td>
	          </tr>
	        </table>
        <!-- 树形菜单结束 -->              
        </td>
        <td colspan="3" valign="top">
            <table width="100%" height="144" border="0" cellpadding="0" cellspacing="0" class="line_table">
          <tr>
            <td width="7%" height="27" background="${ctx}/jsp/${JspRoot}/images/news-title-bg.gif">
            <img src="${ctx}/jsp/${JspRoot}/images/news-title-bg.gif" width="2" height="27">
            </td>
            <td width="93%" background="${ctx}/jsp/${JspRoot}/images/news-title-bg.gif" class="left_bt2">最新动态</td>
          </tr>
          <tr>
            <td height="102" valign="top">&nbsp;</td>
            <td height="102" valign="top"><label>用户信息：</label><input value="dingli"/></td>
          </tr>
          <tr>
            <td height="5" colspan="2">&nbsp;</td>
          </tr>
        </table>
        </td>
        <td></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" valign="top"><!--JavaScript部分-->
        
        </td>
      </tr>
      <tr>
        <td colspan="3" valign="top"><!--JavaScript部分-->
        
        </td>
      </tr>
            <tr>
        <td colspan="3" valign="top"><!--JavaScript部分-->
        
        </td>
      </tr>
            <tr>
        <td colspan="3" valign="top"><!--JavaScript部分-->
        
        </td>
      </tr>
            </tr>
            <tr>
        <td colspan="3" valign="top"><!--JavaScript部分-->
        
        </td>
      </tr>
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="51%" class="left_txt"><img src="${ctx}/jsp/${JspRoot}/images/icon-mail2.gif" width="16" height="11"> 客户服务邮箱：215288671@qq.com<br>
              <img src="${ctx}/jsp/${JspRoot}/images/icon-phone.gif" width="17" height="14"> 官方网站：http://www.mycodes.net</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </td>
    <td background="${ctx}/jsp/${JspRoot}/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="${ctx}/jsp/${JspRoot}/images/mail_leftbg.gif"><img src="${ctx}/jsp/${JspRoot}/images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="${ctx}/jsp/${JspRoot}/images/buttom_bgs.gif"></td>
    <td valign="bottom" background="${ctx}/jsp/${JspRoot}/images/mail_rightbg.gif"><img src="${ctx}/jsp/${JspRoot}/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
