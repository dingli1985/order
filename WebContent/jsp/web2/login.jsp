<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/login.css">
    <script type="text/javascript" src="${ctx}/jsp/${JspRoot}/js/jquery.min.js"></script>
    <script type="text/javascript">
       <!--验证吗切换 -->
       function changeCode(){
   		  $("#imgCode").attr("src","${ctx}/vertify!getCode.action?id="+new Date());
       }

    
    </script>
	<title>后台登陆</title>
</head>
<body>
   <div id="login_top">
		<div id="welcome">
			欢迎使用教学质量与教学改革工程管理系统
		</div>
		<div id="back">
			<a href="#">返回首页</a>&nbsp;&nbsp; | &nbsp;&nbsp;
			<a href="#">帮助</a>
		</div>
	</div>
	<div id="login_center">
		<div id="login_area">
			<div id="login_form">
				<form action="${ctx}/operator!login.action" method="post">
					<div id="login_tip">
						用户登录&nbsp;&nbsp;UserLogin
					</div>
					<div><input type="text" class="username" name="userName"></div>
					<div><input type="password" class="pwd" name="passWord"></div>
					<div id="btn_area">
						<input type="submit" name="submit" id="sub_btn" value="登&nbsp;&nbsp;录">&nbsp;&nbsp;
						<input type="text" class="verify" name="vertifyCode">
						<img id="imgCode" onclick="changeCode()" src="${ctx}/vertify!getCode.action?id="+new Date() alt="" width="80" height="40" border="1">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="login_bottom">
		版权所有
	</div>
</body>
</html>