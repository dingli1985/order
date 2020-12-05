<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/common.css">
   <link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/main.css">
  <link rel="stylesheet" href="${ctx}/jsp/${JspRoot}/css/style.css">
  <script type="text/javascript" src="${ctx}/jsp/${JspRoot}/js/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx}/jsp/${JspRoot}/js/jquery.SuperSlide.js"></script>
  <script type="text/javascript">
  
  function logout(){
	if (confirm("您确定要退出控制面板吗？"))
	  top.location = "${ctx}/jsp/mainLogin.jsp";
	  return false;
  }
  $(function(){
      $(".sideMenu").slide({
         titCell:"h3", 
         targetCell:"ul",
         defaultIndex:0, 
         effect:'slideDown', 
         delayTime:'500' , 
         trigger:'click', 
         triggerTime:'150', 
         defaultPlay:true, 
         returnDefault:false,
         easing:'easeInQuint',
         endFun:function(){
              scrollWW();
         }
       });
      //鼠标事件
      $(".sideMenu ul li").hover(function(){
    	  $(this).addClass("on");
      },function(){
    	  $(this).removeClass("on");
         });
      $(window).resize(function() {
          scrollWW();
      });
      
      $("#here_area :button").click(function(){
    	  var className=$(this).attr("class");
    	  if(className.indexOf("btn_add")>-1){
    		  alert("new");
    	  }
    	  if(className.indexOf("btn_add")>-1){
    		  alert("new");
    	  }
    	  
    	  
      });
      $(window).resize(function() {
          scrollWW();
      });
  });
  function scrollWW(){
    if($(".side").height()<$(".sideMenu").height()){
       $(".scroll").show();
       var pos = $(".sideMenu ul:visible").position().top-38;
       $('.sideMenu').animate({top:-pos});
    }else{
       $(".scroll").hide();
       $('.sideMenu').animate({top:0});
       n=1;
    }
  } 

var n=1;
function menuScroll(num){
  var Scroll = $('.sideMenu');
  var ScrollP = $('.sideMenu').position();
  /*alert(n);
  alert(ScrollP.top);*/
  if(num==1){
     Scroll.animate({top:ScrollP.top-38});
     n = n+1;
  }else{
    if (ScrollP.top > -38 && ScrollP.top != 0) { ScrollP.top = -38; }
    if (ScrollP.top<0) {
      Scroll.animate({top:38+ScrollP.top});
    }else{
      n=1;
    }
    if(n>1){
      n = n-1;
    }
  }
}
  </script>
  <title>后台首页</title>
</head>
<body>
    <div class="top">
      <div id="top_t">
        <div id="logo" class="fl"></div>
        <div id="photo_info" class="fr">
          <div id="photo" class="fl">
            <a href="#"><img src="${ctx}/jsp/${JspRoot}/images/a.png" alt="332323232" width="60" height="60"></a>
          </div>
          <div id="base_info" class="fr">
            <div class="help_info">
              <a href="1" id="hp">&nbsp;</a>
              <a href="2" id="gy">&nbsp;</a>
              <a  href="${ctx}/operator!logout.action" id="out">&nbsp;</a>
            </div>
            <div class="info_center">
              ${userName}
              <span id="nt">通知</span><span><a href="#" id="notice">3</a></span>
            </div>
          </div>
        </div>
      </div>
      <div id="side_here">
        <div id="side_here_l" class="fl"></div>
        <div id="here_area" class="fl">
               当前位置：字典设置
        </div>
      </div>
    </div>
    <div class="side">
        <div class="sideMenu" style="margin:0 auto">
		  <c:forEach items="${userPermissinMap}" var="m">
		     <c:forEach items="${m.value}" var="permission" varStatus="s">
		         <c:choose>  
					<c:when test="${permission.hdParentId==99}">  
					   <h3>${permission.hdPermissionName}</h3>
					   <ul>
					</c:when>  
                    <c:otherwise> 
                          <li><a href="${ctx}/${permission.hdPermissionUrl}" target="right">${permission.hdPermissionName}</a></li>
                          
                    </c:otherwise>  
                 </c:choose>
             </c:forEach>
             </ul> 
         </c:forEach>
       </div>
    </div>
    <div class="main">
       <iframe name="right" id="rightMain" src="${ctx}/jsp/${JspRoot}/main.jsp" frameborder="no" scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
    </div>
    <div class="bottom">
      <div id="bottom_bg">版权</div>
    </div>
    <div class="scroll">
          <a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(1);"></a>
          <a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
    </div>
</body>

</body>
</html>