<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> - 管理页面</title>
<link href="${ctx}/jsp/${JspRoot}/css/skin.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
  function logout(){
	if (confirm("您确定要退出控制面板吗？"))
		top.location = "${ctx}/jsp/mainLogin.jsp";
		return false;
  }
</script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
  <tr>
    <td width="61%" height="64"><img src="${ctx}/jsp/${JspRoot}/images/logo.gif" width="262" height="64"/></td>
    <td width="39%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="74%" height="38" class="admin_txt">管理员：${userName} <b></b> 您好,感谢登陆使用！</td>
        <td width="22%"><a href="${ctx}/user!logout.action" target="_parent" ><img src="${ctx}/jsp/${JspRoot}/images/out.gif" alt="安全退出" width="46" height="20" border="0"/></a></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" colspan="3">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
