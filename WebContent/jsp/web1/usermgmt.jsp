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
  
  <td>
    <table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
            <tr height=28>
                <td background=./img/title_bg1.jpg>当前位置: </td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=./img/shadow_bg.jpg></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="90%" align=center border=0>
            <tr height=100>
                <td align=middle width=100><img height=100 src="./img/admin_p.gif" 
                                                width=90></td>
                <td width=60>&nbsp;</td>
                <td>
                    <table height=100 cellspacing=0 cellpadding=0 width="100%" border=0>

                        <tr>
                            <td>当前时间：2008-12-27 17:03:55</td></tr>
                        <tr>
                            <td style="font-weight: bold; font-size: 16px">admin</td></tr>
                        <tr>
                            <td>欢迎进入网站管理中心！</td></tr></table></td></tr>
            <tr>
                <td colspan=3 height=10></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="95%" align=center border=0>
            <tr height=20>
                <td></td></tr>
            <tr height=22>
                <td style="padding-left: 20px; font-weight: bold; color: #ffffff" 
                    align=middle background=./img/title_bg2.jpg>您的相关信息</td></tr>
            <tr bgcolor=#ecf4fc height=12>
                <td></td></tr>
            <tr height=20>
                <td></td></tr></table>
        <table cellspacing=0 cellpadding=2 width="95%" align=center border=0>
            <tr>
                <td align=right width=100>登陆帐号：</td>
                <td style="color: #880000">admin</td></tr>
            <tr>
                <td align=right>真实姓名：</td>
                <td style="color: #880000">admin</td></tr>
            <tr>
                <td align=right>注册时间：</td>
                <td style="color: #880000">2007-7-25 15:02:04</td></tr>
            <tr>
                <td align=right>登陆次数：</td>
                <td style="color: #880000">58</td></tr>
            <tr>
                <td align=right>上线时间：</td>
                <td style="color: #880000">2008-12-27 17:02:54</td></tr>
            <tr>
                <td align=right>ip地址：</td>
                <td style="color: #880000">222.240.172.117</td></tr>
            <tr>
                <td align=right>身份过期：</td>
                <td style="color: #880000">30 分钟</td>
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
