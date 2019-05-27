<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %> 
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="author" content="becom"/>
<meta name="copyright" content="北控软件版权所有"/>
<title><fmt:message key="system.title"/></title>
<link href="${ctx }/css/becom_global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/becom_library.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/becom_master.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="contanier">
  <div id="header" style="height:40px; ">
    <!--===上部分开始===-->
    <div id="top">
     <div id="logo" class="cn16 bold" style="width:300px"></div>
     <!--===上部分导航开始===-->
      <div id="navhead">
        <div id="navhead_l"></div>
        <div id="navhead_c">你好，<span class="f_royalbluedark">${user.name }</span> [<a href="#" onclick="javascript:window.open('ChangePasswordAction.a?show&isClick=1','','height=200, width=350');">修改密码</a>]&nbsp; <a href="welcome.jsp" target="mainFrame">首页</a> <a href="${ctx}/j_acegi_logout" target="_parent">退出</a></div>
        <div id="navhead_r"></div>
      </div>
    <!--===上部分导航结束===-->
    </div>
    <!--===上部分结束===-->   
  </div>
</div>
</body>
</html>
